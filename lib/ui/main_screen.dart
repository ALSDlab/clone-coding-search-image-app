import 'dart:async';

import 'package:clone_coding_image_search_app/ui/image_item_widget.dart';
import 'package:clone_coding_image_search_app/ui/main_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'main_event.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final searchTextController = TextEditingController();
  StreamSubscription<MainEvent>? subscription;

  @override
  void initState() {
    Future.microtask(
      () {
        subscription = context.read<MainViewModel>().eventController.listen(
          (event) {
            switch (event) {
              case ShowSnackBar():
                final snackBar = SnackBar(content: Text(event.message));
                ScaffoldMessenger.of(context).showSnackBar(snackBar);
              case ShowDialog():
                showDialog(
                  context: context,
                  builder: (context) {
                    final dialog = AlertDialog(
                      title: Center(
                        child: Text(event.message),
                      ),
                    );
                    return dialog;
                  },
                );
            }
          },
        );
      },
    );
    super.initState();
  }

  @override
  void dispose() {
    searchTextController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<MainViewModel>();
    final state = viewModel.state;
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Center(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 16),
                  child: TextField(
                    controller: searchTextController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: const BorderSide(
                          width: 3,
                          color: Colors.blueGrey,
                        ),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: const BorderSide(
                          width: 3,
                          color: Colors.blue,
                        ),
                      ),
                      hintText: '검색어 입력',
                      suffixIcon: IconButton(
                        icon: const Icon(Icons.search),
                        onPressed: () {
                          viewModel.searchImage(searchTextController.text);
                        },
                      ),
                    ),
                  ),
                ),
                state.isLoading
                    ? Center(
                        child: CircularProgressIndicator(),
                      )
                    : Expanded(
                        child: GridView.builder(
                            itemCount: state.imageModels.length,
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              crossAxisSpacing: 32,
                              mainAxisSpacing: 32,
                            ),
                            itemBuilder: (context, index) {
                              final imageItem = state.imageModels[index];
                              return ImageItemWidget(imageItem: imageItem);
                            }))
              ],
            ),
          ),
        ),
      ),
    );
  }
}

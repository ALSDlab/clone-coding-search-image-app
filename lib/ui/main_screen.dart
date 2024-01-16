import 'dart:async';

import 'package:clone_coding_image_search_app/ui/main_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'image_item_widget.dart';
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
        child: Center(
          child: Column(
            children: [
              TextField(
                controller: searchTextController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: const BorderSide(
                      width: 4,
                      color: Colors.lightBlueAccent,
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: const BorderSide(
                      width: 4,
                      color: Colors.yellowAccent,
                    ),
                  ),
                  hintText: '검색어 입력',
                  suffixIcon: IconButton(
                    icon: const Icon(Icons.search),
                    onPressed: () {
                      viewModel.searchImages(searchTextController.text);
                    },
                  ),
                ),
              ),
              const SizedBox(
                height: 12,
              ),
              state.isLoading
                  ? const Center(
                      child: CircularProgressIndicator(),
                    )
                  : Expanded(
                      child: GridView.builder(
                          itemCount: state.imageItems.length,
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            crossAxisSpacing: 32,
                            mainAxisSpacing: 32,
                          ),
                          itemBuilder: (context, index) {
                            final iamgeItem = state.imageItems[index];
                            return ImageItemWidget(imageItem: iamgeItem);
                          }))
            ],
          ),
        ),
      ),
    );
  }
}

import 'dart:async';

import 'package:clone_coding_image_search_app/ui/image_item_widget.dart';
import 'package:clone_coding_image_search_app/ui/main_event.dart';
import 'package:clone_coding_image_search_app/viewmodel/image_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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
    super.initState();

    Future.microtask(() {
      subscription =
          context.read<ImageViewmodel>().eventController.listen((event) {
        switch (event) {
          case ShowSnackBar():
            final snackBar = SnackBar(
              content: Text(event.message),
            );
            ScaffoldMessenger.of(context).showSnackBar(snackBar);
          case ShowDialog():
            showDialog(
              context: context,
              builder: (context) {
                final dialog = AlertDialog(insetPadding: const EdgeInsets.all(10),
                    title: Center(child: Text(event.message, style: const TextStyle(fontSize: 15),)));
                return dialog;
              },
            );
        }
      });
    });
  }

  @override
  void dispose() {
    searchTextController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final viewmodel = context.watch<ImageViewmodel>();
    final state = viewmodel.state;
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(32),
          child: Column(
            children: [
              TextField(
                controller: searchTextController,
                decoration: InputDecoration(
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(
                        width: 3,
                        color: Colors.orange,
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: const BorderSide(
                          width: 3,
                          color: Colors.deepOrange,
                        )),
                    hintText: '검색',
                    suffixIcon: IconButton(
                      icon: const Icon(Icons.search),
                      onPressed: () async {
                        await viewmodel.searchImage(searchTextController.text);
                      },
                    )),
              ),
              const SizedBox(
                height: 20,
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
                            final item = state.imageItems[index];
                            return ImageItemWidget(imageModel: item);
                          }))
            ],
          ),
        ),
      ),
    );
  }
}

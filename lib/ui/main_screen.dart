import 'dart:async';

import 'package:clone_coding_image_search_app/data/model/image_model.dart';
import 'package:clone_coding_image_search_app/ui/image_view_model.dart';
import 'package:clone_coding_image_search_app/ui/main_event.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'image_widget.dart';

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
      subscription = context.read<ImageViewModel>().eventController.listen((event) {
        switch(event){
          case ShowSnackBar():
            final snackBar = SnackBar(content: Text(event.message));
            ScaffoldMessenger.of(context).showSnackBar(snackBar);
          case ShowDialog():
            showDialog(context: context, builder: (context) {
              final dialog = AlertDialog(
                title: Center(child: Text(event.message),),
              );
              return dialog;
            });
        }
      });
      return null;
    });
  }


  @override
  void dispose() {
    super.dispose();
    searchTextController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<ImageViewModel>();
    final state = viewModel.state;
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          '이미지 검색',
          style: TextStyle(fontSize: 25),
        ),
      ),
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              TextField(
                controller: searchTextController,
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(
                        width: 3,
                        color: Colors.green,
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(
                        width: 4,
                        color: Colors.greenAccent,
                      ),
                    ),
                    suffixIcon: IconButton(
                      icon: const Icon(Icons.search),
                      onPressed: () {
                        viewModel.searchImage(searchTextController.text);
                      },
                    ),
                    hintText: '검색어를 입력하세요'),
              ),
              state.isLoading
                  ? const Center(
                      child: CircularProgressIndicator(),
                    )
                  : Expanded(
                      child: GridView.builder(
                          itemCount: state.imageModelLists.length,
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            crossAxisSpacing: 32,
                            mainAxisSpacing: 32,
                          ),
                          itemBuilder: (context, index) {
                            final item = state.imageModelLists[index];
                            return ImageWidget(imageItem: item);
                          }))
            ],
          ),
        ),
      ),
    );
  }
}

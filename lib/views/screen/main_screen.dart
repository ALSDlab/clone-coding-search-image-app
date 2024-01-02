import 'package:clone_coding_image_search_app/viewmodels/image_viewmodel.dart';
import 'package:clone_coding_image_search_app/views/widgets/image_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final searchTextController = TextEditingController();

  @override
  Widget build(BuildContext context) {
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
                      color: Colors.redAccent,
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: const BorderSide(
                      width: 3,
                      color: Colors.yellowAccent,
                    ),
                  ),
                  hintText: '검색',
                  suffixIcon: IconButton(
                    icon: const Icon(
                      Icons.search,
                      color: Colors.redAccent,
                    ),
                    onPressed: () {
                      context
                          .read<ImageViewModel>()
                          .searchImage(searchTextController.text);
                    },
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Consumer<ImageViewModel>(builder: (context, model, child) {
                return Expanded(
                  child: GridView.builder(
                    itemCount: model.imageItems.length,
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 20,
                      mainAxisSpacing: 20,
                    ),
                    itemBuilder: (context, index) {
                      final item = model.imageItems[index];
                      return ImageWidget(item: item);
                    },
                  ),
                );
              })
            ],
          ),
        ),
      ),
    );
  }
}

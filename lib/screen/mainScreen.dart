import 'package:clone_coding_image_search_app/model/imageModel.dart';
import 'package:clone_coding_image_search_app/repository/imageRepository.dart';
import 'package:clone_coding_image_search_app/widget/imageGridCard.dart';
import 'package:flutter/material.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final searchTextController = TextEditingController();
  final imageRepository = ImageItemRepository();

  List<ImageItem> imageItems = [];
  bool isLoading = false;

  Future<void> searchImage(String keyword) async {
    setState(() {
      isLoading = true;
    });

    imageItems = await imageRepository.getImageItems(keyword);

    setState(() {
      isLoading = false;
    });
  }

  @override
  void dispose() {
    searchTextController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(32.0),
          child: Column(
            children: [
              TextField(
                controller: searchTextController,
                decoration: InputDecoration(
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: const BorderSide(
                      width: 1,
                      color: Colors.blueAccent,
                    ),
                  ),
                  hintText: '이미지 찾기',
                  suffixIcon: IconButton(
                    icon: const Icon(
                      Icons.search_rounded,
                      color: Colors.blueAccent,
                    ),
                    onPressed: () => searchImage(searchTextController.text),
                  ),
                ),
              ),
              isLoading
                  ? const Center(
                      child: CircularProgressIndicator(),
                    )
                  : Expanded(
                      child: GridView.builder(
                          itemCount: imageItems.length,
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2,
                                  crossAxisSpacing: 32,
                                  mainAxisSpacing: 32),
                          itemBuilder: (context, index) {
                            final imageItem = imageItems[index];
                            return const ImageGridCard();
                          }))
            ],
          ),
        ),
      ),
    );
  }
}

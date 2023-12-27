import 'package:clone_coding_image_search_app/model/imageModel.dart';
import 'package:clone_coding_image_search_app/repository/imageRepository.dart';
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
    return const Placeholder();
  }
}

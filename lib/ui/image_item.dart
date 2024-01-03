import 'package:clone_coding_image_search_app/model/image_model.dart';
import 'package:flutter/material.dart';

class ImageItem extends StatelessWidget {
  const ImageItem({super.key, required this.imageModel});

  final ImageModel imageModel;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: Image.network(
        imageModel.imageURL,
        fit: BoxFit.cover,
      ),
    );
  }
}

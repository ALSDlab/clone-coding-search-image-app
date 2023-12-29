import 'package:clone_coding_image_search_app/image_model/image_model.dart';
import 'package:flutter/material.dart';

class ImageItemWidget extends StatelessWidget {
  const ImageItemWidget({super.key, required this.imageItem});

  final ImageModel imageItem;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(15),
      child: Image.network(
        imageItem.ImageUrl,
        fit: BoxFit.cover,
      ),
    );
  }
}

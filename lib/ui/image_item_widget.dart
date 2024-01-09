import 'package:clone_coding_image_search_app/data/model/image_model.dart';
import 'package:flutter/material.dart';

class ImageItemWidget extends StatelessWidget {
  const ImageItemWidget({super.key, required this.imageItem});

  final ImageModel imageItem;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: Image.network(
        imageItem.imageURL,
        fit: BoxFit.cover,
      ),
    );
  }
}

import 'package:clone_coding_image_search_app/models/model/image_model.dart';
import 'package:flutter/material.dart';

class ImageWidget extends StatelessWidget {
  const ImageWidget({super.key, required this.item});

  final ImageModel item;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: Image.network(
        item.imageURL,
        fit: BoxFit.cover,
      ),
    );
  }
}

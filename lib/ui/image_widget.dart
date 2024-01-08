import 'package:flutter/material.dart';

import '../data/model/image_model.dart';

class ImageWidget extends StatelessWidget {
  const ImageWidget({super.key, required this.imageItem});

  final ImageModel imageItem;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(30),
      child: Image.network(
        imageItem.imageURL,
        fit: BoxFit.cover,
      ),
    );
  }
}

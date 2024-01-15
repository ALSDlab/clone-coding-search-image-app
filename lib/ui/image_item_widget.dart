import 'package:flutter/material.dart';

import '../data/model/image_model.dart';

class ImageItemWidget extends StatelessWidget {
  final ImageModel imageItem;

  const ImageItemWidget({
    super.key,
    required this.imageItem,
  });

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

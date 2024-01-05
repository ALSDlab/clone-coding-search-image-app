import 'package:clone_coding_image_search_app/domain/model/image_model.dart';
import 'package:flutter/material.dart';

class DetailScreen extends StatelessWidget {
  const DetailScreen({super.key, required this.imageModel});
  final ImageModel imageModel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Hero(
          tag: 'no tag',
          child: Image.network(imageModel.imageURL,
          fit: BoxFit.cover,),
        ),
      ),
    );
  }
}

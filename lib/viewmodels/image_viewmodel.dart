import 'dart:async';

import 'package:clone_coding_image_search_app/models/model/image_model.dart';
import 'package:clone_coding_image_search_app/models/repository/image_repository.dart';
import 'package:flutter/cupertino.dart';

class ImageViewModel  extends ChangeNotifier {
  final _repository = ImageItemsRepository();
  final _searchTextController = TextEditingController();

  List<ImageModel> _imageItems = [];
  List<ImageModel> get imageItems => _imageItems;
  get searchTextController => _searchTextController;


  Future<void> searchImage(String query) async {

    _imageItems = await _repository.getImageModels(query);
    notifyListeners();
  }
}

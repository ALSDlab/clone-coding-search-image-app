import 'package:clone_coding_image_search_app/model/image_model.dart';
import 'package:clone_coding_image_search_app/repository/image_repository.dart';
import 'package:flutter/cupertino.dart';

class ImageViewModel extends ChangeNotifier {
  final ImageRepository _repository;

  ImageViewModel({
    required ImageRepository repository,
  }) : _repository = repository;

  List<ImageModel> _imageItems = [];
  bool _isLoading = false;

  List<ImageModel> get imageItems => List.unmodifiable(_imageItems);

  bool get isLoading => _isLoading;

  Future<void> searchImage(String query) async {
    _isLoading = true;
    _imageItems = await _repository.getImageModels(query);
    _isLoading = false;
    notifyListeners();
  }
}

import 'package:clone_coding_image_search_app/repository/image_repository.dart';
import 'package:clone_coding_image_search_app/viewmodel/image_state.dart';
import 'package:flutter/cupertino.dart';

class ImageViewModel extends ChangeNotifier {
  final ImageRepository _repository;

  ImageViewModel({
    required ImageRepository repository,
  }) : _repository = repository;

  ImageState _state = const ImageState();

  ImageState get state => _state;

  Future<void> searchImage(String query) async {
// 화면 갱신
    _state = state.copyWith(isLoading: true);
    notifyListeners();
// 다시 화면갱신
    _state = state.copyWith(
        isLoading: false,
        imageItems: List.unmodifiable(await _repository.getImageModels(query)));

    notifyListeners();
  }
}

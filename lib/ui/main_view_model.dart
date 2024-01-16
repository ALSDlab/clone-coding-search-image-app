import 'dart:async';

import 'package:clone_coding_image_search_app/core/result.dart';
import 'package:clone_coding_image_search_app/data/model/image_model.dart';
import 'package:clone_coding_image_search_app/data/repository/image_repository.dart';
import 'package:clone_coding_image_search_app/ui/main_state.dart';
import 'package:flutter/cupertino.dart';

import 'main_event.dart';

class MainViewModel extends ChangeNotifier {
  final ImageRepository _imageRepository;

  MainViewModel({
    required ImageRepository imageRepository,
  }) : _imageRepository = imageRepository;

  MainState _state = const MainState();
  final _eventController = StreamController<MainEvent>();

  Stream<MainEvent> get eventController => _eventController.stream;

  MainState get state => _state;

  Future<void> searchImages(String query) async {
    _state = state.copyWith(isLoading: true);
    notifyListeners();

    final result = await _imageRepository.getImageModels(query);
    switch (result) {
      case Success<List<ImageModel>>():
        _state = state.copyWith(isLoading: false, imageItems: result.data);
        _eventController.add(const MainEvent.showSnackBar('이미지 찾기 성공~!!'));
      case Error<List<ImageModel>>():
        _state = state.copyWith(isLoading: false);
        _eventController.add(const MainEvent.showSnackBar('이미지 찾기 실패~!!'));
    }
    notifyListeners();
  }
}

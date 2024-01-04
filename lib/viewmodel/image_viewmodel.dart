import 'dart:async';

import 'package:clone_coding_image_search_app/core/result.dart';
import 'package:clone_coding_image_search_app/data/model/image_model.dart';
import 'package:clone_coding_image_search_app/data/repository/image_repository.dart';
import 'package:clone_coding_image_search_app/ui/main_event.dart';
import 'package:clone_coding_image_search_app/viewmodel/image_state.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';

class ImageViewmodel extends ChangeNotifier {
  final ImageRepository _repository;

  ImageState _state = const ImageState();
  final _eventController = StreamController<MainEvent>();

  Stream<MainEvent> get eventController => _eventController.stream;

  ImageState get state => _state;

  ImageViewmodel({
    required ImageRepository repository,
  }) : _repository = repository;

  Future<void> searchImage(String query) async {
    // 화면갱신
    _state = state.copyWith(isLoading: true);
    notifyListeners();

    final result = await _repository.getImageModels(query);

//화면 다시갱신
    switch (result) {
      case Success<List<ImageModel>>():
        if (result.data.isEmpty) {
          _state = state.copyWith(isLoading: false);
          _eventController.add(const MainEvent.showDialog('검색 결과가 없습니다.'));
          notifyListeners();
        } else {
          _state = state.copyWith(isLoading: false, imageItems: result.data);

          _eventController.add(const MainEvent.showSnackBar('성공!!'));
          notifyListeners();
        }
      case Error<List<ImageModel>>():
        _state = state.copyWith(isLoading: false);
        _eventController.add(const MainEvent.showDialog('연결오류!!'));
        notifyListeners();
    }
  }
}

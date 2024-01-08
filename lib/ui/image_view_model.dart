import 'dart:async';

import 'package:clone_coding_image_search_app/core/result.dart';
import 'package:clone_coding_image_search_app/data/repository/image_repository.dart';
import 'package:clone_coding_image_search_app/ui/main_event.dart';
import 'package:clone_coding_image_search_app/ui/main_state.dart';
import 'package:flutter/cupertino.dart';

import '../data/model/image_model.dart';

class ImageViewModel extends ChangeNotifier {
  final ImageRepository _repository;
  final _eventController = StreamController<MainEvent>();

  Stream<MainEvent> get eventController => _eventController.stream;

  ImageViewModel({
    required ImageRepository repository,
  }) : _repository = repository;

  MainState _state = const MainState();

  MainState get state => _state;

  Future<void> searchImage(String query) async {
    _state = state.copyWith(
      isLoading: true,
    );
    notifyListeners();

    final result = await _repository.getImageModels(query);

    switch (result) {
      case Success<List<ImageModel>>():
        _state = state.copyWith(isLoading: false, imageModelLists: result.data);
        _eventController.add(const MainEvent.showSnackBar('Success!!'));
        break;
      case Error<List<ImageModel>>():
        _state = state.copyWith(
          isLoading: false,
        );
        _eventController.add(const MainEvent.showSnackBar('Failed!!'));
        break;
    }
    notifyListeners();
  }
}

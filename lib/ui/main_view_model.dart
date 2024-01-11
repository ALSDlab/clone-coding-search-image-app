import 'dart:async';

import 'package:clone_coding_image_search_app/data/model/image_model.dart';
import 'package:clone_coding_image_search_app/data/repository/image_repository.dart';
import 'package:clone_coding_image_search_app/ui/main_event.dart';
import 'package:clone_coding_image_search_app/ui/main_state.dart';
import 'package:flutter/cupertino.dart';

import '../core/result.dart';

class MainViewModel extends ChangeNotifier {
  ImageRepository _repository;
  final _eventController = StreamController<MainEvent>();

  MainViewModel({
    required ImageRepository repository,
  }) : _repository = repository;

  MainState _state = const MainState();

  Stream<MainEvent> get eventController => _eventController.stream;

  MainState get state => _state;

  Future<void> searchImage(String query) async {
    _state = state.copyWith(isLoading: true);
    notifyListeners();

    final result = await _repository.getImageModels(query);
    switch (result) {
      case Success<List<ImageModel>>():
        _state = state.copyWith(
          isLoading: false,
          imageModels: result.data,
        );
        _eventController.add(const MainEvent.showSnackBar('Success~!!!'));
      case Error<List<ImageModel>>():
        _state = state.copyWith(
          isLoading: false,
        );
        _eventController.add(const MainEvent.showSnackBar('Search Image Failed~!!!'));
    }
    notifyListeners();
  }
}

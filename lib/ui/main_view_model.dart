import 'dart:async';

import 'package:clone_coding_image_search_app/core/result.dart';
import 'package:clone_coding_image_search_app/data/model/image_model.dart';
import 'package:clone_coding_image_search_app/data/repository/image_repository.dart';
import 'package:clone_coding_image_search_app/ui/main_event.dart';
import 'package:clone_coding_image_search_app/ui/main_state.dart';
import 'package:flutter/cupertino.dart';

class MainViewModel extends ChangeNotifier {
  final ImageRepository _repository;

  MainViewModel({
    required ImageRepository repository,
  }) : _repository = repository;

  MainState _state = const MainState();

  final _eventController = StreamController<MainEvent>();

  MainState get state => _state;

  Stream<MainEvent> get eventController => _eventController.stream;

  Future<void> searchImages(String query) async {
    _state = state.copyWith(isLoading: true);
    notifyListeners();

    final result = await _repository.getImageModels(query);
    switch (result) {
      case Success<List<ImageModel>>():
        _state = state.copyWith(
          isLoading: false,
          imageItems: result.data,
        );
        _eventController.add(const MainEvent.showDialog('Success~~!!!'));
      case Error<List<ImageModel>>():
        _state = state.copyWith(
          isLoading: false,
        );
        _eventController.add(const MainEvent.showDialog('Failed~~!!!'));
    }
    notifyListeners();
  }
}

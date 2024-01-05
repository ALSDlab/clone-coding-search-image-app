import 'dart:async';

import 'package:clone_coding_image_search_app/core/result.dart';
import 'package:clone_coding_image_search_app/domain/model/image_model.dart';
import 'package:clone_coding_image_search_app/domain/repository/image_item_repository.dart';
import 'package:clone_coding_image_search_app/ui/main/main_event.dart';
import 'package:clone_coding_image_search_app/ui/main/main_state.dart';
import 'package:flutter/cupertino.dart';

class MainViewmodel extends ChangeNotifier{
  final ImageItemRepository _imageItemRepository;
  MainViewmodel({
    required ImageItemRepository imageItemRepository,
  }) : _imageItemRepository = imageItemRepository;

  MainState _state = MainState();

  final _eventController = StreamController<MainEvent>();

  MainState get state => _state;

  Stream<MainEvent> get eventController => _eventController.stream;

  Future<void> searchImage(String query) async{
    _state = state.copyWith(isLoading: true);
    notifyListeners();

    final result = await _imageItemRepository.getImageItems(query);

    switch(result){
      case Success<List<ImageModel>>():
  _state = state.copyWith(
    isLoading: false,
    imageItem: result.data,
  );
  notifyListeners();
      case Error<List<ImageModel>>():
        _state = state.copyWith(
          isLoading: false,
          imageItem: [],
        );
        notifyListeners();
        _eventController.add(const MainEvent.dataLoadingError());
    }
  }
}
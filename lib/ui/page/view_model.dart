import 'dart:async';

import 'package:clone_coding_image_search_app/image_model/image_model.dart';
import 'package:clone_coding_image_search_app/image_repository/image_repository.dart';

final class ViewModel {
  final _repository = PixabayImageItemsRepository();

  List<ImageModel> _imageItems = [];
  final _loadingController = StreamController<bool>();

  Stream<bool> get loadingController => _loadingController.stream;
  List<ImageModel> get imageItems => List.unmodifiable(_imageItems);


  Future<void> searchImage(String query) async{
    //화면갱신
    _loadingController.add(true);
    _imageItems = await _repository.getImageSource(query);

    //다시 화면갱신
    _loadingController.add(false);


  }
}
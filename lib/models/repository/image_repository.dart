import 'package:clone_coding_image_search_app/models/mapper/image_mapper.dart';
import 'package:clone_coding_image_search_app/models/model/image_model.dart';
import 'package:clone_coding_image_search_app/models/source/image_source.dart';

abstract interface class ImageRepository {
  Future<List<ImageModel>> getImageModels(String query);
}


class ImageItemsRepository implements ImageRepository {
  final _api = ImageApi();

  @override
  Future<List<ImageModel>> getImageModels(String query) async {
    final imageDto = await _api.getImageSource(query);

    if (imageDto.hits == null){
      return [];
    }
    return imageDto.hits!.map((e) => e.toImageModel()).toList();
  }



}
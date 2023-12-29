import 'package:clone_coding_image_search_app/image_dto/image_dto.dart';
import 'package:clone_coding_image_search_app/image_model/image_model.dart';
import 'package:clone_coding_image_search_app/image_source/source.dart';
import 'package:clone_coding_image_search_app/mapper/mapper.dart';

abstract interface class ImageItemsRepository {
  Future<List<ImageModel>> getImageSource(String query);
}

class PixabayImageItemsRepository implements ImageItemsRepository {
  final _api = ImageApi();

  @override
  Future<List<ImageModel>> getImageSource(String query) async {
    final dto = await _api.getImageSource(query);
    if (dto.hits == null) {
      return [];
    }

    return dto.hits!.map((e) => e.toImageItem()).toList();
  }
}

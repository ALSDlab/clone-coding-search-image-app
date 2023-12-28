import 'package:clone_coding_image_search_app/mapper/image_mapper.dart';
import 'package:clone_coding_image_search_app/model/image_item.dart';
import 'package:clone_coding_image_search_app/source/image_source.dart';

abstract interface class ImageItemRepository {
  Future<List<ImageItem>> getImageItems(String query);
}

class PixabayImageItemRepository implements ImageItemRepository {
  final _api = ImageApi();

  @override
  Future<List<ImageItem>> getImageItems(String query) async {
    final dto = await _api.getImageResult(query);

    if (dto == null) {
      return [];
    }

    return dto.hits!.map((e) => e.toImageItem()).toList();

    throw UnimplementedError();
  }
}

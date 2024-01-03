import 'package:clone_coding_image_search_app/mapper/image_mapper.dart';
import 'package:clone_coding_image_search_app/model/image_model.dart';
import 'package:clone_coding_image_search_app/repository/image_repository.dart';
import 'package:clone_coding_image_search_app/source/image_source.dart';

class ImageModelsRepositoryImpl implements ImageRepository {
  final _api = ImageApi();

  @override
  Future<List<ImageModel>> getImageModels(String query) async {
    final dto = await _api.getImageSource(query);
    if (dto.hits == null) {
      return [];
    }
    return dto.hits!.map((e) => e.toImageModel()).toList();
  }
}

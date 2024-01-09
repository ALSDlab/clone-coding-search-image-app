import 'package:clone_coding_image_search_app/data/mapper/image_mapper.dart';
import 'package:clone_coding_image_search_app/data/model/image_model.dart';
import 'package:clone_coding_image_search_app/data/repository/image_repository.dart';

import '../../core/result.dart';
import '../../data/source/image_source.dart';

class ImageRepositoryImpl implements ImageRepository {
  final _api = ImageApi();

  @override
  Future<Result<List<ImageModel>>> getImageModels(String query) async {
    try {
      final dto = await _api.getImageSource(query);
      if (dto.hits == null) {
        return const Result.success([]);
      } else {
        return Result.success(
            dto.hits!.map((e) => e.dtoToModel()).cast<ImageModel>().toList());
      }
    } catch (e) {
      return Result.error(Exception(e.toString()));
    }
  }
}

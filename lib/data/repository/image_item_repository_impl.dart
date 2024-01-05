import 'package:clone_coding_image_search_app/core/result.dart';
import 'package:clone_coding_image_search_app/data/data_source/image_api.dart';
import 'package:clone_coding_image_search_app/data/dto/image_dto.dart';
import 'package:clone_coding_image_search_app/data/mapper/image_mapper.dart';
import 'package:clone_coding_image_search_app/domain/model/image_model.dart';
import 'package:clone_coding_image_search_app/domain/repository/image_item_repository.dart';

class ImageItemRepositoryImpl implements ImageItemRepository {
  final ImageApi _api;

  const ImageItemRepositoryImpl({
    required ImageApi api,
  }) : _api = api;

  @override
  Future<Result<List<ImageModel>>> getImageItems(String query) async {
    try {
      final json = await _api.getImageSource(query);
      final dto = ImageDto.fromJson(json);

      if (dto.hits == null) {
        return Result.error(Exception('정보가 없습니다.').toString());
      }
      return Result.success(dto.hits!.map((e) => e.dtoToModel()).toList());
    } catch (e) {
      return Result.error(Exception(e).toString());
    }
  }

}
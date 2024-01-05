import 'package:clone_coding_image_search_app/core/result.dart';
import 'package:clone_coding_image_search_app/domain/model/image_model.dart';

abstract interface class ImageItemRepository{
  Future<Result<List<ImageModel>>> getImageItems(String query);
}
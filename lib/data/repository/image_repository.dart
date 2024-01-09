import 'package:clone_coding_image_search_app/data/model/image_model.dart';

import '../../core/result.dart';

abstract interface class ImageRepository {
  Future<Result<List<ImageModel>>> getImageModels(String query);
}

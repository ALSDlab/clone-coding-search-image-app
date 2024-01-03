import 'package:clone_coding_image_search_app/model/image_model.dart';

abstract interface class ImageRepository {
  Future<List<ImageModel>> getImageModels(String query);
}

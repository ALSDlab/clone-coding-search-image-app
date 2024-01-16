import '../../core/result.dart';
import '../model/image_model.dart';

abstract interface class ImageRepository {
  Future<Result<List<ImageModel>>> getImageModels(String query);
}
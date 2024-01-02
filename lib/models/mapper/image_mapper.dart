import 'package:clone_coding_image_search_app/models/dto/image_dto.dart';
import 'package:clone_coding_image_search_app/models/model/image_model.dart';

extension DtoToModel on Hits {
  ImageModel toImageModel() {
 return ImageModel(
     imageURL: previewURL ?? 'https://wallpaperswide.com/download/snowman_winter_tradition-wallpaper-1920x1080.jpg',
     tags: tags ?? '-');
}
}
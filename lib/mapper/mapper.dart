import 'package:clone_coding_image_search_app/image_dto/image_dto.dart';
import 'package:clone_coding_image_search_app/image_model/image_model.dart';

extension DtoToModel on Hits {
  ImageModel toImageItem() {
    return ImageModel(
        ImageUrl: previewURL ??
            'https://wallpaperswide.com/download/snowman_winter_tradition-wallpaper-1920x1080.jpg',
        tags: tags ?? '');
  }
}

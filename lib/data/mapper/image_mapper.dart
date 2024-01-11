import '../dto/image_dto.dart';
import '../model/image_model.dart';

extension DtoToModel on Hits {
  ImageModel dtoToModel() {
    return ImageModel(
        imageURL: previewURL ??
            'https://wallpaperswide.com/download/snowman_winter_tradition-wallpaper-1920x1080.jpg',
        tags: tags ?? '-');
  }
}

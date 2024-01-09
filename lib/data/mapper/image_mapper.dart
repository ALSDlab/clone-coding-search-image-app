import '../dto/image_dto.dart';
import '../model/image_model.dart';

extension DtoToModel on Hits {
  ImageModel dtoToModel() {
    return ImageModel(
        imageURL: previewURL ??
            'https://wallpaperswide.com/download/amazing_asiatic_landscape_art-wallpaper-1920x1080.jpg',
        tags: tags ?? '-');
  }
}

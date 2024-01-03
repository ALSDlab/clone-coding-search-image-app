import 'package:clone_coding_image_search_app/dto/image_dto.dart';
import 'package:clone_coding_image_search_app/model/image_model.dart';

extension DtoToModel on Hits {
  ImageModel toImageModel (){
    return ImageModel(
        imageURL: previewURL ?? 'https://wallpaperswide.com/download/amazing_asiatic_landscape_art-wallpaper-1920x1080.jpg',
        tags: tags ?? '-');
  }
}
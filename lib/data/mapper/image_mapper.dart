import 'package:clone_coding_image_search_app/data/model/image_model.dart';

import '../dto/image_dto.dart';

extension DtoToModel on Hits {
  ImageModel toModel() {
    return ImageModel(
        imageURL: previewURL ??
            'https://wallpaperswide.com/download/snowman_winter_tradition-wallpaper-1920x1080.jpg',
        tags: tags ?? '-');
  }
}

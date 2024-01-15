import 'package:clone_coding_image_search_app/data/dto/image_dto.dart';

import '../model/image_model.dart';

extension DtoToModel on Hits {
  ImageModel toModel() {
    return ImageModel(
      imageURL: previewURL ??
          'https://wallpaperswide.com/download/gta_6_muscle_car_video_game-wallpaper-1920x1080.jpg',
      tags: tags ?? '-',
    );
  }
}

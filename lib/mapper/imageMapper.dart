import 'package:clone_coding_image_search_app/dataDto/dataDto.dart';
import 'package:clone_coding_image_search_app/model/imageModel.dart';

extension DtoToModel on Hits {
  ImageItem toImageItem(){
    return ImageItem(
      imageUrl: previewURL ?? 'https://wallpaperswide.com/download/earth_southern_hemisphere-wallpaper-800x600.jpg',
      tags: tags ?? '',
    );
  }
}
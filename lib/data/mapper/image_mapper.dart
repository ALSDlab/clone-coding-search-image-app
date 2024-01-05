import 'package:clone_coding_image_search_app/data/dto/image_dto.dart';
import 'package:clone_coding_image_search_app/domain/model/image_model.dart';

extension DtoToModel on Hits {
  ImageModel dtoToModel() {
    return ImageModel(imageURL: previewURL ?? '', tags: tags ?? '');
  }
}

import 'package:clone_coding_image_search_app/data/dto/image_dto.dart';
import 'package:clone_coding_image_search_app/data/model/image_model.dart';

extension DtoToModel on Hits {
  ImageModel toModel() {
    return ImageModel(imageURL: previewURL ?? '-', tags: tags ?? '-');
  }
}

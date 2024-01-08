import '../dto/image_dto.dart';
import '../model/image_model.dart';

extension DtoToModel on Hits {
  ImageModel toModel() {
    return ImageModel(
      imageURL: previewURL ?? '',
      tags: tags ?? '-',
    );
  }
}

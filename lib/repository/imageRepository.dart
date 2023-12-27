import 'package:clone_coding_image_search_app/dataSource/sourceApi.dart';
import 'package:clone_coding_image_search_app/mapper/imageMapper.dart';
import 'package:clone_coding_image_search_app/model/imageModel.dart';



class ImageItemRepository  {
  final _api = SourceApi();


  Future<List<ImageItem>> getImageItems(String keyword) async {
    final dto = await _api.getImageSource(keyword);

    return dto.hits.map((e) => e.toImageItem()).toList();
  }
}
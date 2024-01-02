import 'dart:convert';

import 'package:clone_coding_image_search_app/models/dto/image_dto.dart';
import 'package:http/http.dart' as http;

class ImageApi {
  Future<ImageDto> getImageSource(String query) async{
    final response = await http.get(Uri.parse('https://pixabay.com/api/?key=10711147-dc41758b93b263957026bdadb&q=$query&image_type=photo'));
    return ImageDto.fromJson(jsonDecode(response.body));
  }
}
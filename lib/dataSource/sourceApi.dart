import 'dart:convert';

import 'package:clone_coding_image_search_app/dataDto/dataDto.dart';
import 'package:http/http.dart' as http;

class SourceApi {
  Future<dataDto> getImageSource(String keyword) async {
    final response = await http.get(Uri.parse(
        'https://pixabay.com/api/?key=10711147-dc41758b93b263957026bdadb&q=$keyword&image_type=photo'));
    return dataDto.fromJson(jsonDecode(response.body));
  }
}

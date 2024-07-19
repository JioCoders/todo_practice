import 'package:get/get.dart';

import '../photos_model.dart';

class PhotosProvider extends GetConnect {
  // static const baseUrl = 'https://jsonplaceholder.typicode.com/';
  // static const photoApi = 'photos/';
  // static const photoApiUrl = baseUrl + photoApi;
  @override
  void onInit() {
    // All request will pass to jsonEncode so CasesModel.fromJson()
    // httpClient.defaultDecoder = PhotoModel.listFromJson;
    // httpClient.addRequestModifier((request) {
    //   request.headers['Authorization'] = 'Bearer sdfsdfgsdfsdsdf12345678';
    //   return request;
    // });
    httpClient.defaultDecoder = (map) {
      if (map is Map<String, dynamic>) return PhotoModel.fromJson(map);
      if (map is List) {
        return map.map((item) => PhotoModel.fromJson(item)).toList();
      }
    };
    httpClient.baseUrl = 'https://jsonplaceholder.typicode.com/';
  }

  Future<PhotoModel?> getPhotos(int id) async {
    final response = await get('photos/$id');
    return response.body;
  }

  Future<List<PhotoModel>> getPhotoList() async {
    final response = await get('photos/');
    return response.body;
  }

  // A function that converts a response body into a List<Photo>.
  // static List<Photo> parsePhotos(String responseBody) {
  //   final parsed = jsonDecode(responseBody).cast<Map<String, dynamic>>();
  //   return parsed.map<Photo>((json) => Photo.fromJson(json)).toList();
  // }
  Future<Response<PhotoModel>> postPhotos(PhotoModel photos) async =>
      await post('photos', photos);
  Future<Response> deletePhotos(int id) async => await delete('photos/$id');
}

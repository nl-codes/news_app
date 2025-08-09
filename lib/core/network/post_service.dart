import 'package:dio/dio.dart';

class PostService {
  final Dio _dio = Dio();
  PostService() {
    _dio.options.baseUrl = 'https://jsonplaceholder.typicode.com/';
  }
  Future<Response> fetchJSONNews() async {
    try {
      final response = await _dio.get('posts');
      return response;
    } on DioException catch (e) {
      print("Dio error: ${e.response?.statusCode}, ${e.message}");
      rethrow;
    } catch (e) {
      throw Exception("Unknown error: $e");
    }
  }

  Future<Response> postJSONNews(Map<String, dynamic> data) async {
    try {
      final response = await _dio.post(
        'posts',
        data: data,
        options: Options(
          headers: {'Content-type': 'application/json; charset=UTF-8'},
        ),
      );
      return response;
    } on DioException catch (e) {
      print("Dio error: ${e.response?.statusCode}, ${e.message}");
      rethrow;
    } catch (e) {
      throw Exception("Unknown error during POST: $e");
    }
  }
}

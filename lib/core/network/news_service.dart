import 'package:dio/dio.dart';

class NewsService {
  final Dio _dio = Dio();
  NewsService() {
    _dio.options.baseUrl = 'https://api.thenewsapi.com/v1/';
    _dio.options.headers = {'Accept': 'application/json'};
  }

  Future<Response> fetchTopNews() async {
    try {
      final Response response = await _dio.get(
        'news/top',
        queryParameters: {
          'api_token': "xocqW1DjQ5vLuoUM16C91WOgwQAfs8VmLhJTmYvq",
          'locale': 'us',
          'limit': 3,
        },
      );
      return response;
    } catch (e) {
      throw Exception("Error fetching news: $e");
    }
  }

  Future<Response> fetchData(
    String endUrl,
    Map<String, dynamic> queryParams,
  ) async {
    try {
      final Response response = await _dio.get(
        endUrl,
        queryParameters: queryParams,
      );
      return response;
    } catch (e) {
      throw Exception("Error fetching news: $e");
    }
  }

  Future<Response> fetchNewsByUUID(String uuid) async {
    try {
      final Response response = await _dio.get(
        "news/uuid/$uuid?api_token=xocqW1DjQ5vLuoUM16C91WOgwQAfs8VmLhJTmYvq",
      );
      return response;
    } catch (e) {
      throw Exception("Error fetching news of uuid : $uuid");
    }
  }
}

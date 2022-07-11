import 'package:dio/dio.dart';
import 'package:flutter_app_development_test_solution_karan/data/api/api_constants.dart';

class GetNewsData {
  final Dio dio;
  GetNewsData({required this.dio});
  Future<Map> getTopicHeadline(String topic) async {
    try {
      var response = await dio.get(
        NewsAPI.newsHeadlineURL,
        queryParameters: {
          'topic': topic,
          'country': 'US',
          'lang': 'en',
          'limit': 100
        },
        options: Options(
          headers: {
            'X-RapidAPI-Key': NewsAPI.apiKey,
            'X-RapidAPI-Host': NewsAPI.apiHost,
          },
        ),
      );
      return response.data;
    } on DioError catch (e) {
      throw e.message;
    }
  }
}

import 'package:dio/dio.dart';
import 'package:flutter_app_development_test_solution_karan/data/api/api_constants.dart';
import 'package:flutter_app_development_test_solution_karan/data/model/news_information.dart';

class GetNewsData {
  final Dio dio;
  GetNewsData({required this.dio});
  Future<List> getTopicHeadline(String topic) async {
    late List<NewsInformation> newsArticles;
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
      var jsonArticles = response.data['articles'] as List;
      newsArticles = jsonArticles
          .map((article) => NewsInformation.fromJson(article))
          .toList();
      return newsArticles;
    } on DioError catch (e) {
      throw e.message;
    }
  }
}

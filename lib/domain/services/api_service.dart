import 'package:dio/dio.dart';
import 'package:sibcode_test/domain/entity/news_answer.dart';

class ApiService {
  final _dio = Dio();
  String url = 'https://webstripe.ru/list.json';

  Future<List<News>> fetchNews() async {
    Response response = await _dio.get(url);
    if (response.statusCode == 200) {
      final List<dynamic> data = response.data['news'];
      final List<News> newsList =
          data.map((json) => News.fromJson(json)).toList();
      return newsList;
    } else {
      throw Exception('Ошибка при загрузке новостей');
    }
  }
}

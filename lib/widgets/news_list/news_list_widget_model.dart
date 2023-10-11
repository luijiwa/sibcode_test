import 'package:flutter/material.dart';
import 'package:sibcode_test/domain/entity/news_answer.dart';
import 'package:sibcode_test/domain/services/api_service.dart';

class NewsListWidgetModel extends ChangeNotifier {
  List<News> _newsList = [];

  List<News> get newsList => _newsList;

  Future<void> loadNews() async {
    final news = await ApiService().fetchNews();
    _newsList = news;
    notifyListeners();
  }
}

import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:business_news_app/data/models/news.dart';

class NewsService {
  final String apiKey = "";
  final String baseUrl =
      'https://newsapi.org/v2/top-headlines?category=business';

  Future<List<News>> fetchBusinessNews() async {
    final response = await http.get(Uri.parse('$baseUrl&apiKey=$apiKey'));

    if (response.statusCode == 200) {
      List<dynamic> data = json.decode(response.body)['articles'];
      return data.map((json) => News.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load the news');
    }
  }
}

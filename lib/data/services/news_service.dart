import 'dart:convert';
import 'package:business_news_app/data/models/news.dart';
import 'package:http/http.dart' as http;

class NewsService {
  final String apiKey = 'a778dcab5a09497393e58183d7de68c4'; // Your API key
  final String baseUrl =
      'https://newsapi.org/v2/top-headlines?category=business';

  Future<List<News>> fetchBusinessNews() async {
    final response = await http.get(Uri.parse('$baseUrl&apiKey=$apiKey'));

    // Debugging the response
    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}'); // Print the response body

    if (response.statusCode == 200) {
      List<dynamic> data = json.decode(response.body)['articles'];
      print('Fetched news: $data'); // Debug print the news data
      return data.map((json) => News.fromJson(json)).toList();
    } else {
      print('Error fetching news: ${response.statusCode}');
      throw Exception('Failed to load news');
    }
  }
}

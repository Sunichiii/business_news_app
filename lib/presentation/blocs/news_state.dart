import 'package:business_news_app/data/models/news.dart';

abstract class NewsState {}

class NewsLoadingState extends NewsState {}

class NewsInitialState extends NewsState {}

class NewsErrorState extends NewsState {
  final String message;
  NewsErrorState(this.message);
}

class NewsLoadedState extends NewsState {
  final List<News> news;
  NewsLoadedState(this.news);
}

import 'package:business_news_app/data/models/news.dart';
import 'package:business_news_app/data/services/news_service.dart';

class FetchNewsUseCase {
  final NewsService newsService;
  FetchNewsUseCase(this.newsService);

  Future<List<News>> execute() async {
    return await newsService.fetchBusinessNews();
  }
}

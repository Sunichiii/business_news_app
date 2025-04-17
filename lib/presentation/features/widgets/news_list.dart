import 'package:business_news_app/data/models/news.dart';
import 'package:business_news_app/presentation/blocs/news_bloc.dart';
import 'package:business_news_app/presentation/blocs/news_state.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NewsListWidget extends StatelessWidget {
  const NewsListWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NewsBloc, NewsState>(
      builder: (context, state) {
        if (state is NewsLoadingState) {
          return Center(child: CircularProgressIndicator());
        } else if (state is NewsErrorState) {
          print('Error state: ${state.message}'); // Debugging log
          return Center(child: Text(state.message));
        } else if (state is NewsLoadedState) {
          List<News> news = state.news;
          print('Loaded news: $news'); // Debugging log to check the news list
          return ListView.builder(
            itemCount: news.length,
            itemBuilder: (context, index) {
              final item = news[index];
              return ListTile(
                leading: CachedNetworkImage(
                  imageUrl:
                      item.urlToImage ?? 'https://via.placeholder.com/150',
                  placeholder: (context, url) => CircularProgressIndicator(),
                  errorWidget: (context, url, error) => Icon(Icons.error),
                ),
                title: Text(item.title),
                subtitle: Text(item.description),
                onTap: () {},
              );
            },
          );
        }
        print('No news available'); // Debugging log if no news are loaded
        return Center(child: Text("No news available"));
      },
    );
  }
}

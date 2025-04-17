import 'package:business_news_app/data/services/news_service.dart';
import 'package:business_news_app/domain/use_cases/fetch_news_use_case.dart';
import 'package:business_news_app/presentation/blocs/news_bloc.dart';
import 'package:business_news_app/presentation/blocs/news_event.dart';
import 'package:business_news_app/presentation/features/widgets/news_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
        primaryColor: Colors.green,
        scaffoldBackgroundColor: Colors.grey,
        textTheme: TextTheme(bodyMedium: TextStyle(color: Colors.white)),
      ),
      home: BlocProvider(
        create: (context) => NewsBloc(FetchNewsUseCase(NewsService())),
        child: NewsHomePage(),
      ),
    );
  }
}

class NewsHomePage extends StatelessWidget {
  const NewsHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    BlocProvider.of<NewsBloc>(context).add(FetchNewsEvent());
    return Scaffold(
      appBar: AppBar(title: Text("Business News")),
      body: NewsListWidget(),
    );
  }
}

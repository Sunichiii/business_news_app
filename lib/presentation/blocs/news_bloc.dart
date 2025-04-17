// ignore_for_file: non_constant_identifier_names

import 'package:bloc/bloc.dart';
import 'package:business_news_app/domain/use_cases/fetch_news_use_case.dart';
import 'package:business_news_app/presentation/blocs/news_event.dart';
import 'package:business_news_app/presentation/blocs/news_state.dart';

class NewsBloc extends Bloc<NewsEvent, NewsState> {
  final FetchNewsUseCase fetchNewsUseCase;

  NewsBloc(this.fetchNewsUseCase) : super(NewsInitialState()) {
    on<FetchNewsEvent>(_onFetchNews);
  }
  Future<void> _onFetchNews(
    FetchNewsEvent event,
    Emitter<NewsState> emit,
  ) async {
    print('Fetching news...'); // Debugging log

    emit(NewsLoadingState());

    try {
      final news = await fetchNewsUseCase.execute();
      print('Fetched news from use case: $news'); // Debugging log
      emit(NewsLoadedState(news));
    } catch (e) {
      print('Error fetching news: $e'); // Debugging log for error
      emit(NewsErrorState("Failed to load news"));
    }
  }
}

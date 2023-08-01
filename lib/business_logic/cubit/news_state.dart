part of 'news_cubit.dart';

@immutable
abstract class NewsState {}

class NewsInitial extends NewsState {}

class ChangeNavState extends NewsState {}

class ToggleState extends NewsState {}

class NewsUsLoading extends NewsState {}

class NewsUsLoaded extends NewsState {}

class NewsUsError extends NewsState {
  final error;

  NewsUsError(this.error);
}

class NewsHealthLoading extends NewsState {}

class NewsHealthLoaded extends NewsState {}

class NewsHealthError extends NewsState {
  final error;

  NewsHealthError(this.error);
}

class NewsPoliticsLoading extends NewsState {}

class NewsPoliticsLoaded extends NewsState {}

class NewsPoliticsError extends NewsState {
  final error;

  NewsPoliticsError(this.error);
}

class NewsArtLoading extends NewsState {}

class NewsArtLoaded extends NewsState {}

class NewsArtError extends NewsState {
  final error;

  NewsArtError(this.error);
}

class NewsFoodLoading extends NewsState {}

class NewsFoodLoaded extends NewsState {}

class NewsFoodError extends NewsState {
  final error;

  NewsFoodError(this.error);
}

class NewsScienceLoading extends NewsState {}

class NewsScienceLoaded extends NewsState {}

class NewsScienceError extends NewsState {
  final error;

  NewsScienceError(this.error);
}

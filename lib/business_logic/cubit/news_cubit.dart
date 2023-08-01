// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:news_app/data_Layer/model/article_model.dart';

import 'package:news_app/data_Layer/repository/article_repository.dart';
import 'package:news_app/presentation/screens/discover_screen.dart';
import 'package:news_app/presentation/screens/home_screen.dart';
import 'package:news_app/presentation/screens/news_screen.dart';
import 'package:news_app/presentation/screens/profile_screen.dart';

part 'news_state.dart';

class NewsCubit extends Cubit<NewsState> {
  Articl_repository articl_repository;

  NewsCubit(
    this.articl_repository,
  ) : super(NewsInitial());

  static NewsCubit get(context) => BlocProvider.of(context);

  List<Widget> screens = [
    News_Screen(),
    Discover_Screen(),
    Profile_Screen(),
  ];

  int currentIndex = 0;

  void changeIndex(int index) {
    currentIndex = index;
    if (index == 0) {
      getUsData();
    }
    emit(ChangeNavState());
  }

  bool isToggle = false;

  void toggleNavIcon() {
    isToggle = !isToggle;
    emit(ToggleState());
  }

  List<ArticleModel> article_list = [];

  void getUsData() async {
    emit(NewsUsLoading());
    if (article_list.length == 0) {
      try {
        article_list = await articl_repository.fetch_news();
        emit(NewsUsLoaded());
      } catch (error) {
        emit(NewsUsError(error));
        print("---------------------- $error");
      }
    } else {
      emit(NewsUsLoaded());
    }
  }

  List<ArticleModel> health_list = [];

  void getHealthData() async {
    emit(NewsHealthLoading());
    try {
      health_list = await articl_repository.fetch_health();
      emit(NewsHealthLoaded());
    } catch (error) {
      emit(NewsHealthError(error));
      print("---------------------- $error");
    }
  }

  List<ArticleModel> politics_list = [];

  void getPoliticsData() async {
    emit(NewsPoliticsLoading());
    try {
      politics_list = await articl_repository.fetch_politics();
      emit(NewsPoliticsLoaded());
    } catch (error) {
      emit(NewsPoliticsError(error));
      print("---------------------- $error");
    }
  }

  List<ArticleModel> art_list = [];

  void getArtData() async {
    emit(NewsArtLoading());
    try {
      art_list = await articl_repository.fetch_art();
      emit(NewsArtLoaded());
    } catch (error) {
      emit(NewsArtError(error));
      print("---------------------- $error");
    }
  }

  List<ArticleModel> food_list = [];

  void getFoodData() async {
    emit(NewsFoodLoading());
    try {
      food_list = await articl_repository.fetch_food();
      emit(NewsFoodLoaded());
    } catch (error) {
      emit(NewsFoodError(error));
      print("---------------------- $error");
    }
  }

  List<ArticleModel> science_list = [];

  void getScienceData() async {
    emit(NewsScienceLoading());
    try {
      science_list = await articl_repository.fetch_science();
      emit(NewsScienceLoaded());
    } catch (error) {
      emit(NewsScienceError(error));
      print("---------------------- $error");
    }
  }
}

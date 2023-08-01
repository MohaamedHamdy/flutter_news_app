import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/data_Layer/repository/article_repository.dart';
import 'package:news_app/presentation/screens/article_screen.dart';
import 'package:news_app/presentation/screens/news_screen.dart';
import 'business_logic/cubit/news_cubit.dart';
import 'package:news_app/presentation/screens/home_screen.dart';

class App_router {
  Articl_repository _articl_repository = Articl_repository();

  Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case "/":
        return MaterialPageRoute(
          builder: ((_) => BlocProvider(
                create: (context) => NewsCubit(_articl_repository)
                  ..getUsData()
                  ..getHealthData(),
                child: Home_Screen(),
              )),
        );
      case "/home":
        return MaterialPageRoute(
          builder: ((_) => BlocProvider(
                create: (context) => NewsCubit(_articl_repository)
                  ..getUsData()
                  ..getHealthData(),
                child: News_Screen(),
              )),
        );
      case "/article":
        return MaterialPageRoute(
          builder: ((_) => BlocProvider(
                create: (context) => NewsCubit(_articl_repository),
                child: Article_Screen(),
              )),
        );
    }
    return null;
  }
}

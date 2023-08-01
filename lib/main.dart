import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/app_router.dart';

import 'package:news_app/presentation/screens/home_screen.dart';

void main() {
  runApp(MyApp(
    app_router: App_router(),
  ));
}

class MyApp extends StatelessWidget {
  final App_router app_router;

  MyApp({
    Key? key,
    required this.app_router,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      onGenerateRoute: app_router.generateRoute,
      theme: ThemeData(
        appBarTheme: AppBarTheme(
          color: Colors.transparent,
          elevation: 0.0,
        ),
      ),
    );
  }
}

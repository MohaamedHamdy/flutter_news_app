import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/business_logic/cubit/news_cubit.dart';
import 'package:news_app/presentation/screens/news_screen.dart';
import 'package:news_app/presentation/widgets/bottom_nav.dart';

class Home_Screen extends StatelessWidget {
  const Home_Screen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit, NewsState>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = NewsCubit.get(context);
        return Scaffold(
          bottomNavigationBar: const BottomNav(),
          body: cubit.screens[cubit.currentIndex],
        );
      },
    );
  }
}

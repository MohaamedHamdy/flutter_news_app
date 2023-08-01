import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/business_logic/cubit/news_cubit.dart';
import 'package:news_app/data_Layer/model/article_model.dart';
import 'package:news_app/presentation/widgets/breaking_news.dart';
import 'package:news_app/presentation/widgets/custom_tag.dart';
import 'package:news_app/presentation/widgets/image_container.dart';
import 'package:news_app/presentation/widgets/learn_more.dart';
import 'package:news_app/presentation/widgets/news_of_day.dart';

class News_Screen extends StatelessWidget {
  static const route_name = '/home';

  int randomNum = Random().nextInt(10);

  News_Screen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.menu,
            color: Colors.white,
          ),
        ),
      ),
      extendBodyBehindAppBar: true,
      body: BlocConsumer<NewsCubit, NewsState>(
        listener: (context, state) {},
        builder: (context, state) {
          var cubit = NewsCubit.get(context);
          List<ArticleModel> articleModel = cubit.article_list;
          if (articleModel.isNotEmpty) {
            return ListView(
              padding: EdgeInsets.zero,
              children: [
                NewsOfTheDayWidget(
                    article_model: articleModel, randomNum: randomNum),
                BreakingNewsWidget(article_model: articleModel),
              ],
            );
          } else {
            return const Center(
              child: CircularProgressIndicator(
                color: Colors.black,
              ),
            );
          }
          // if (state is NewsUsLoading) {
          //   return const Center(
          //     child: CircularProgressIndicator(
          //       color: Colors.black,
          //     ),
          //   );
          // } else if (state is NewsUsError) {
          //   return Text('error occured');
          // } else if (state is NewsUsLoaded) {
          //   List<ArticleModel> article_model = cubit.article_list;
          //   return ListView(
          //     padding: EdgeInsets.zero,
          //     children: [
          //       NewsOfTheDayWidget(
          //           article_model: article_model, randomNum: randomNum),
          //       BreakingNewsWidget(article_model: article_model),
          //     ],
          //   );
          // }
          // // List<ArticleModel> article_model = cubit.article_list;
          // // return ListView(
          // //   padding: EdgeInsets.zero,
          // //   children: [
          // //     NewsOfTheDayWidget(
          // //         article_model: article_model, randomNum: randomNum),
          // //     BreakingNewsWidget(article_model: article_model),
          // //   ],
          // // );
          // return const Center(
          //   child: CircularProgressIndicator(),
          // );
        },
      ),
    );
  }
}

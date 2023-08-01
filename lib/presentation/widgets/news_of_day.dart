import 'package:flutter/material.dart';
import 'package:news_app/data_Layer/model/article_model.dart';
import 'package:news_app/presentation/widgets/custom_tag.dart';
import 'package:news_app/presentation/widgets/image_container.dart';
import 'package:news_app/presentation/widgets/learn_more.dart';

class NewsOfTheDayWidget extends StatelessWidget {
  const NewsOfTheDayWidget({
    super.key,
    required this.article_model,
    required this.randomNum,
  });

  final List<ArticleModel> article_model;
  final int randomNum;

  @override
  Widget build(BuildContext context) {
    return ImageContainer(
      height: MediaQuery.of(context).size.height * 0.45,
      width: double.infinity,
      url: article_model[randomNum].urlToImage != null
          ? '${article_model[randomNum].urlToImage}'
          : "https://upload.wikimedia.org/wikipedia/commons/1/14/No_Image_Available.jpg?20200913095930",
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Custom_tag(
              color: Colors.grey.withAlpha(150),
              children: [
                Text(
                  'News of the day',
                  style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                        color: Colors.white,
                      ),
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              '${article_model[randomNum].description}',
              style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
            ),
            const SizedBox(
              height: 10,
            ),
            LearnMore(),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:news_app/data_Layer/model/article_model.dart';
import 'package:news_app/presentation/widgets/custom_tag.dart';
import 'package:news_app/presentation/widgets/image_container.dart';

class Article_Screen extends StatelessWidget {
  static const route_name = '/article';
  Article_Screen({super.key});

  @override
  Widget build(BuildContext context) {
    final article = ModalRoute.of(context)!.settings.arguments as ArticleModel;
    return ImageContainer(
      width: double.infinity,
      url:
          'https://static01.nyt.com/images/2023/03/13/multimedia/28Stocks-hp/28Stocks-hp-threeByTwoSmallAt2X-v2.jpg?format=pjpg&quality=75&auto=webp&disable=upscale',
      // url: article.urlToImage!,
      child: Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            iconTheme: const IconThemeData(
              color: Colors.white,
            ),
            elevation: 0.0,
          ),
          // extendBodyBehindAppBar: true,
          body: ListView(
            children: [
              UpperPartWidget(),
            ],
          )),
    );
  }
}

class UpperPartWidget extends StatelessWidget {
  const UpperPartWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Custom_tag(
            color: Colors.grey.withAlpha(150),
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Text(
                  'Politics',
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        color: Colors.white,
                      ),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 10.0,
          ),
          Text(
            'Wall St. Pessimists Are Getting Used to Being Wrong',
            style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
          ),
          const SizedBox(
            height: 10.0,
          ),
          Text(
            'The S&P 500 is up about 20 percent this year, but some still warn that the future may not be as rosy as that implies.',
            style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                  color: Colors.grey,
                  // fontWeight: FontWeight.bold,
                ),
          ),
          const SizedBox(
            height: 50.0,
          ),
        ],
      ),
    );
  }
}

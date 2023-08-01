import 'package:flutter/material.dart';
import 'package:news_app/data_Layer/model/article_model.dart';
import 'package:news_app/presentation/widgets/image_container.dart';

class BreakingNewsWidget extends StatelessWidget {
  const BreakingNewsWidget({
    super.key,
    required this.article_model,
  });

  final List<ArticleModel> article_model;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Breaking News',
                style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
              ),
              InkWell(
                onTap: () {
                  Navigator.pushNamed(context, '/article');
                },
                child: Text(
                  'More',
                  style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                        fontWeight: FontWeight.w600,
                      ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          SizedBox(
            height: 290,
            child: ListView.separated(
              separatorBuilder: (context, index) => const SizedBox(width: 10),
              scrollDirection: Axis.horizontal,
              itemCount: article_model.length,
              itemBuilder: (context, index) {
                return SizedBox(
                  width: 280,
                  child: InkWell(
                    onTap: () {},
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ImageContainer(
                          width: 280,
                          url: article_model[index].urlToImage != null
                              ? '${article_model[index].urlToImage}'
                              : 'https://upload.wikimedia.org/wikipedia/commons/1/14/No_Image_Available.jpg?20200913095930',
                        ),
                        const SizedBox(
                          height: 4,
                        ),
                        Text(
                          '${article_model[index].description}',
                          style:
                              Theme.of(context).textTheme.bodyLarge!.copyWith(
                                    fontWeight: FontWeight.w600,
                                  ),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                        SizedBox(
                          height: 4,
                        ),
                        Text(
                          '${article_model[index].publishedAt}',
                          style: Theme.of(context).textTheme.bodySmall!,
                        ),
                        SizedBox(
                          height: 4,
                        ),
                        article_model[index].author != null
                            ? Text(
                                'By ${article_model[index].author}',
                                style: Theme.of(context).textTheme.bodySmall!,
                              )
                            : const SizedBox(),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/app_router.dart';

import 'package:news_app/business_logic/cubit/news_cubit.dart';
import 'package:news_app/data_Layer/model/article_model.dart';
import 'package:news_app/presentation/widgets/custom_tag.dart';
import 'package:news_app/presentation/widgets/image_container.dart';

class Discover_Screen extends StatelessWidget {
  List<String> tabs = ['health', 'Politics', 'Art', 'Food', 'Science'];

  Discover_Screen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: tabs.length,
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            padding: const EdgeInsets.only(
              left: 5.0,
            ),
            iconSize: 30.0,
            onPressed: () {},
            icon: const Icon(
              Icons.menu,
              color: Colors.black,
            ),
          ),
        ),
        body: BlocConsumer<NewsCubit, NewsState>(
          listener: (context, state) {},
          builder: (context, state) {
            var cubit = NewsCubit.get(context)
              ..getHealthData()
              ..getPoliticsData()
              // ..getArtData()
              // ..getFoodData()
              ..getScienceData();
            List<ArticleModel> health_list = cubit.health_list;
            List<ArticleModel> politics_list = cubit.politics_list;
            // List<ArticleModel> art_list = cubit.art_list;
            // List<ArticleModel> food_list = cubit.food_list;
            List<ArticleModel> science_list = cubit.science_list;
            return ListView(
              children: [
                const DicoverWidget(),
                CategoryNews(
                  tabs: tabs,
                  health_list: health_list,
                  politics_list: politics_list,
                  science_list: science_list,
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}

class CategoryNews extends StatelessWidget {
  const CategoryNews({
    super.key,
    required this.tabs,
    required this.health_list,
    required this.politics_list,
    required this.science_list,
  });

  final List<String> tabs;
  final List<ArticleModel> health_list;
  final List<ArticleModel> politics_list;
  final List<ArticleModel> science_list;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        children: [
          TabBar(
            isScrollable: true,
            indicatorColor: Colors.black,
            tabs: tabs
                .map(
                  (tab) => Tab(
                    icon: Text(
                      tab,
                      style:
                          Theme.of(context).textTheme.headlineSmall!.copyWith(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                              ),
                    ),
                  ),
                )
                .toList(),
          ),
          const SizedBox(
            height: 10.0,
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height,
            child: TabBarView(
              // children: tabs
              //     .map(
              //       (tab) => Text('data'),
              //     )
              //     .toList(),
              children: [
                ListView.separated(
                  itemCount: health_list.length,
                  scrollDirection: Axis.vertical,
                  separatorBuilder: (context, index) => const SizedBox(
                    height: 10.0,
                  ),
                  itemBuilder: (context, indx) {
                    return _buildListItem(
                      article_list: health_list,
                      index: indx,
                    );
                  },
                ),
                ListView.separated(
                  itemCount: politics_list.length,
                  scrollDirection: Axis.vertical,
                  separatorBuilder: (context, index) => const SizedBox(
                    height: 10.0,
                  ),
                  itemBuilder: (context, indx) {
                    return _buildListItem(
                      article_list: politics_list,
                      index: indx,
                    );
                  },
                ),
                // ListView.separated(
                //   itemCount: 10,
                //   scrollDirection: Axis.vertical,
                //   separatorBuilder: (context, index) =>
                //       const SizedBox(
                //     height: 10.0,
                //   ),
                //   itemBuilder: (context, indx) {
                //     return _buildListItem(
                //       article_list: art_list,
                //       index: indx,
                //     );
                //   },
                // ),
                Center(child: Text('no art data')),
                // ListView.separated(
                //   itemCount: 10,
                //   scrollDirection: Axis.vertical,
                //   separatorBuilder: (context, index) =>
                //       const SizedBox(
                //     height: 10.0,
                //   ),
                //   itemBuilder: (context, indx) {
                //     return _buildListItem(
                //       article_list: food_list,
                //       index: indx,
                //     );
                //   },
                // ),
                Center(child: Text('no food data')),
                ListView.separated(
                  itemCount: science_list.length,
                  scrollDirection: Axis.vertical,
                  separatorBuilder: (context, index) => const SizedBox(
                    height: 10.0,
                  ),
                  itemBuilder: (context, indx) {
                    return _buildListItem(
                      article_list: science_list,
                      index: indx,
                    );
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _buildListItem extends StatelessWidget {
  _buildListItem({
    Key? key,
    required this.article_list,
    required this.index,
  }) : super(key: key);

  final List<ArticleModel> article_list;
  int index = 0;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        // Navigator.pushNamed(
        //   context,
        //   '/article',
        //   // arguments: article_list[index],
        // );
      },
      child: Row(
        children: [
          ImageContainer(
            url: article_list[index].urlToImage != null
                ? '${article_list[index].urlToImage}'
                : 'https://upload.wikimedia.org/wikipedia/commons/1/14/No_Image_Available.jpg?20200913095930',

            // url:
            //     'https://cdn.dribbble.com/users/1998175/screenshots/15193792/media/298264c1ce856398c313dde0398ba00c.jpg?resize=1600x1200&vertical=center',
            width: 80,
            height: 80,
          ),
          const SizedBox(
            width: 10.0,
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: 250,
                  child: Text(
                    '${article_list[index].description}',
                    // 'fsaklnfklasfgandsngkl;andsgnkadsngklnasdlknglkadsnlkgnalsdknglkdnslkflmslkfm;lasgl;asmg;lmsa;lflkashgkjkbajnklfdslakmglsmdg;lmal;gf',
                    maxLines: 2,
                    overflow: TextOverflow.clip,
                    style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                          fontWeight: FontWeight.bold,
                          fontSize: 18.0,
                        ),
                  ),
                ),
                const SizedBox(
                  height: 10.0,
                ),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Icon(
                      Icons.watch_later_outlined,
                      color: Colors.grey,
                      size: 18.0,
                    ),
                    SizedBox(
                      width: 5.0,
                    ),
                    Text(
                      '02:40 hours ago',
                    ),
                    SizedBox(
                      width: 20.0,
                    ),
                    Icon(
                      Icons.visibility_outlined,
                      color: Colors.grey,
                      size: 18.0,
                    ),
                    SizedBox(
                      width: 5.0,
                    ),
                    Text(
                      '3245',
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class DicoverWidget extends StatelessWidget {
  const DicoverWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Discover',
            style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                  color: Colors.black,
                  fontWeight: FontWeight.w900,
                ),
          ),
          const SizedBox(
            height: 5.0,
          ),
          Text(
            'News from all over the world',
            style: Theme.of(context)
                .textTheme
                .bodyMedium!
                .copyWith(color: Colors.grey),
          ),
          const SizedBox(
            height: 30.0,
          ),
          TextFormField(
            keyboardType: TextInputType.text,
            decoration: InputDecoration(
              fillColor: Colors.grey.shade200,
              filled: true,
              labelText: 'Search',
              labelStyle: Theme.of(context)
                  .textTheme
                  .headlineSmall!
                  .copyWith(color: Colors.grey, fontSize: 23.0),
              prefixIcon: const Icon(
                Icons.search,
                color: Colors.grey,
                size: 30.0,
              ),
              suffixIcon: const RotatedBox(
                quarterTurns: 1,
                child: Icon(
                  Icons.tune,
                  color: Colors.grey,
                  size: 30.0,
                ),
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(
                  20.0,
                ),
                borderSide: BorderSide.none,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:news_app/data_Layer/model/article_model.dart';

class Articl_repository {
  Future<List<ArticleModel>> fetch_news() async {
    var response = await http.get(
      Uri.parse(
          'https://newsapi.org/v2/top-headlines?country=us&category=sports&apiKey=7750c7c52d564961988e41770456485a'),
    );

    var data = jsonDecode(response.body);

    List<ArticleModel> _articlelist = [];

    if (response.statusCode == 200) {
      for (var item in data['articles']) {
        ArticleModel articleModel = ArticleModel.fromJson(item);
        _articlelist.add(articleModel);
      }
      return _articlelist;
    } else {
      return [];
    }
  }

  Future<List<ArticleModel>> fetch_health() async {
    var response = await http.get(
      Uri.parse(
          'https://newsapi.org/v2/top-headlines?country=us&category=health&apiKey=7750c7c52d564961988e41770456485a'),
    );

    var data = jsonDecode(response.body);

    List<ArticleModel> articlelist = [];

    if (response.statusCode == 200) {
      for (var item in data['articles']) {
        ArticleModel articleModel = ArticleModel.fromJson(item);
        articlelist.add(articleModel);
      }
      return articlelist;
    } else {
      return [];
    }
  }

  Future<List<ArticleModel>> fetch_politics() async {
    var response = await http.get(
      Uri.parse(
          'https://newsapi.org/v2/top-headlines?country=us&category=politics&apiKey=7750c7c52d564961988e41770456485a'),
    );

    var data = jsonDecode(response.body);

    List<ArticleModel> articlelist = [];

    if (response.statusCode == 200) {
      for (var item in data['articles']) {
        ArticleModel articleModel = ArticleModel.fromJson(item);
        articlelist.add(articleModel);
      }
      return articlelist;
    } else {
      return [];
    }
  }

  Future<List<ArticleModel>> fetch_art() async {
    var response = await http.get(
      Uri.parse(
          'https://newsapi.org/v2/top-headlines?country=us&category=art&apiKey=7750c7c52d564961988e41770456485a'),
    );

    var data = jsonDecode(response.body);

    List<ArticleModel> articlelist = [];

    if (response.statusCode == 200) {
      for (var item in data['articles']) {
        ArticleModel articleModel = ArticleModel.fromJson(item);
        articlelist.add(articleModel);
      }
      return articlelist;
    } else {
      return [];
    }
  }

  Future<List<ArticleModel>> fetch_food() async {
    var response = await http.get(
      Uri.parse(
          'https://newsapi.org/v2/top-headlines?country=us&category=food&apiKey=7750c7c52d564961988e41770456485a'),
    );

    var data = jsonDecode(response.body);

    List<ArticleModel> articlelist = [];

    if (response.statusCode == 200) {
      for (var item in data['articles']) {
        ArticleModel articleModel = ArticleModel.fromJson(item);
        articlelist.add(articleModel);
      }
      return articlelist;
    } else {
      return [];
    }
  }

  Future<List<ArticleModel>> fetch_science() async {
    var response = await http.get(
      Uri.parse(
          'https://newsapi.org/v2/top-headlines?country=us&category=science&apiKey=7750c7c52d564961988e41770456485a'),
    );

    var data = jsonDecode(response.body);

    List<ArticleModel> articlelist = [];

    if (response.statusCode == 200) {
      for (var item in data['articles']) {
        ArticleModel articleModel = ArticleModel.fromJson(item);
        articlelist.add(articleModel);
      }
      return articlelist;
    } else {
      return [];
    }
  }
}

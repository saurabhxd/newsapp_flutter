import 'dart:convert';

import 'package:newsapp_flutter/models/article_model.dart';
import 'package:http/http.dart' as http;

class News {
  List<ArticleModel> news = [];

  Future<void> getNews() async {

    var  url = Uri.parse('https://newsapi.org/v2/top-headlines?country=in&apiKey=565f6c63f8ae4dc8adbc2869423006f6');

    var response = await http.get(url);

    var jsonData = jsonDecode(response.body);

    if(jsonData['status'] == 'ok'){
      jsonData['articles'].forEach((element){

        if(element['urlToImage'] != null && element['description'] != null){

        ArticleModel articleModel = ArticleModel(
          title: element['title'],
          author: element['author'],
          description: element['description'],
          url: element['url'],
          urlToImage: element['urlToImage'],
          content: element['content'],
        );

        news.add(articleModel);

        }
      });
    }
  }
}

class CategoryNewsClass {
  List<ArticleModel> news = [];

  Future<void> getNews(String category) async {

    var  url = Uri.parse('https://newsapi.org/v2/top-headlines?country=in&category=$category&apiKey=565f6c63f8ae4dc8adbc2869423006f6');

    var response = await http.get(url);

    var jsonData = jsonDecode(response.body);

    if(jsonData['status'] == 'ok'){
      jsonData['articles'].forEach((element){

        if(element['urlToImage'] != null && element['description'] != null){

          ArticleModel articleModel = ArticleModel(
            title: element['title'],
            author: element['author'],
            description: element['description'],
            url: element['url'],
            urlToImage: element['urlToImage'],
            content: element['content'],
          );

          news.add(articleModel);

        }
      });
    }
  }
}
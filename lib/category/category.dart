import 'package:flutter/material.dart';
import 'package:untitled5/my_theme.dart';

class Categorys {
  String id;
  String title;
  String imageUrl;
  Color color;

  Categorys(
      {required this.color,
      required this.id,
      required this.imageUrl,
      required this.title});

/*
business
entertainment
general
health
science
sports
technology
 */
  static List<Categorys> getCategories() {
    return [
      Categorys(
          color: MyTheme.redColor,
          id: 'sports',
          imageUrl: "assets/images/ball.png",
          title: 'Sports'),
      Categorys(
          color: MyTheme.blueColor,
          id: 'general',
          imageUrl: "assets/images/Politics.png",
          title: 'General'),
      Categorys(
          color: MyTheme.pinkColor,
          id: 'health',
          imageUrl: "assets/images/health.png",
          title: 'Health'),
      Categorys(
          color: MyTheme.brownColor,
          id: 'business',
          imageUrl: "assets/images/bussines.png",
          title: 'Business'),
      Categorys(
          color: MyTheme.envirColor,
          id: 'entertainment',
          imageUrl: "assets/images/environment.png",
          title: 'Entertainment'),
      Categorys(
          color: MyTheme.yellowColor,
          id: 'science',
          imageUrl: "assets/images/science.png",
          title: 'Science')
    ];
  }
}

import 'package:flutter/material.dart';
import 'package:untitled5/model/New_details.dart';
import 'package:untitled5/model/newsResponse.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:untitled5/my_theme.dart';

class NewsItem extends StatelessWidget {
  News news;

  NewsItem({required this.news});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => NewDetails(news: news),
            ));
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            clipBehavior: Clip.antiAlias,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(19),
            ),
            child: CachedNetworkImage(
              imageUrl: news.urlToImage ?? "",
              placeholder: (context, url) =>
                  Center(child: CircularProgressIndicator()),
              errorWidget: (context, url, error) => Icon(Icons.error),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            news.author ?? "",
            style: Theme.of(context)
                .textTheme
                .titleSmall!
                .copyWith(color: MyTheme.greyColor),
          ),
          SizedBox(
            height: 10,
          ),
          Text(news.title ?? "",
              style: Theme.of(context).textTheme.titleMedium),
          Text(
            news.publishedAt ?? "",
            style: Theme.of(context)
                .textTheme
                .titleSmall!
                .copyWith(color: MyTheme.greyColor),
            textAlign: TextAlign.end,
          ),
          SizedBox(
            height: 10,
          ),
        ],
      ),
    );
  }
}

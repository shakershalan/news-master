import 'package:flutter/material.dart';
import 'package:untitled5/api/api_manager.dart';

import 'package:untitled5/category/tap_item.dart';
import 'package:untitled5/model/newsResponse.dart';
import 'package:untitled5/model/news_item.dart';
import 'package:untitled5/my_theme.dart';

import '../model/SourceResponse.dart';

class NewsContainer extends StatefulWidget {
  Source source;

  NewsContainer({
    required this.source,
  });

  @override
  State<NewsContainer> createState() => _NewsContainerState();
}

class _NewsContainerState extends State<NewsContainer> {
  final scrollController = ScrollController();
  int pageNumber = 1;
  List<News> news = [];
  bool shouldLodNextPage = false;

  @override
  void initState() {
    super.initState();

    // Setup the listener.
    scrollController.addListener(() {
      if (scrollController.position.atEdge) {
        bool isTop = scrollController.position.pixels == 0;
        if (!isTop) {
          shouldLodNextPage = true;
          setState(() {});
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    if (shouldLodNextPage) {
      ApiManager.getNewsBySourceId(
              sourceId: widget.source.id ?? "", pageNumber: ++pageNumber)
          .then((newsResponse) => news.addAll(newsResponse!.articles ?? []));
      shouldLodNextPage = false;
      setState(() {});
    }
    return FutureBuilder<NewsResponse?>(
      future: ApiManager.getNewsBySourceId(sourceId: widget.source.id ?? ""),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting &&
            news.isEmpty) {
          return Center(
            child: CircularProgressIndicator(
              color: MyTheme.greenColor,
            ),
          );
        } else if (snapshot.hasError) {
          return Column(
            children: [
              Text("Something went wrong"),
              ElevatedButton(
                onPressed: () {},
                child: Text("Try Again"),
              )
            ],
          );
        }
        if (snapshot.data!.status != "ok") {
          return Column(
            children: [
              Text(snapshot.data!.massage ?? ""),
              ElevatedButton(
                onPressed: () {},
                child: Text("Try Again"),
              )
            ],
          );
        }

        var newList = snapshot.data?.articles ?? [];
        if (news.isEmpty) {
          news = newList;
        } else if (news.first.title != newList.first.title) {
          news = newList;
          scrollController.jumpTo(0);
        }
        return ListView.builder(
          controller: scrollController,
          itemBuilder: (context, index) {
            return NewsItem(news: news[index]);
          },
          itemCount: news.length,
        );
      },
    );
  }

  void dispose() {
    scrollController.dispose();
    super.dispose();
  }
}

import 'package:flutter/material.dart';
import 'package:untitled5/api/api_manager.dart';
import 'package:untitled5/model/newsResponse.dart';
import 'package:untitled5/model/news_item.dart';
import 'package:untitled5/my_theme.dart';

class NewsSearchDelegate extends SearchDelegate {
  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
          onPressed: () {
            showResults(context);
          },
          icon: Icon(Icons.search))
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
        onPressed: () {
          Navigator.of(context).pop();
        },
        icon: Icon(Icons.close));
  }

  @override
  Widget buildResults(BuildContext context) {
    if (query.isEmpty) {
      return Center(child: Text("Suggestions"));
    }
    return FutureBuilder<NewsResponse?>(
      future: ApiManager.getNewsSearch(query),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
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
        return ListView.builder(
          itemBuilder: (context, index) {
            return NewsItem(news: newList[index]);
          },
          itemCount: newList.length,
        );
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    if (query.isEmpty) {
      return Center(child: Text("Suggestions"));
    }
    return FutureBuilder<NewsResponse?>(
      future: ApiManager.getNewsSearch(query),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
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
        return ListView.builder(
          itemBuilder: (context, index) {
            return NewsItem(news: newList[index]);
          },
          itemCount: newList.length,
        );
      },
    );
  }

  ThemeData appBarTheme(BuildContext context) {
    return MyTheme.lightTheme;
  }
}

import 'package:flutter/material.dart';

import 'package:untitled5/my_theme.dart';
import 'package:url_launcher/url_launcher.dart';
import 'newsResponse.dart';

class NewDetails extends StatelessWidget {
  static const String routeName = "news";
  News news;

  NewDetails({required this.news});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          color: MyTheme.witheColor,
          child: Image.asset(
            'assets/images/pattern.png',
            width: double.infinity,
            height: double.infinity,
            fit: BoxFit.cover,
          ),
        ),
        Scaffold(
            backgroundColor: Colors.transparent,
            appBar: AppBar(
              title: Text(
                news.title ?? "",
                style: Theme.of(context).textTheme.titleLarge,
              ),
            ),
            body: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Container(
                      padding:
                          EdgeInsets.symmetric(vertical: 10, horizontal: 1),
                      child: Image(image: NetworkImage(news.urlToImage ?? ''))),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      news.source!.name ?? "",
                      style: TextStyle(
                          color: MyTheme.greyColor,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      news.description ?? "",
                      style: Theme.of(context)
                          .textTheme
                          .titleMedium!
                          .copyWith(fontWeight: FontWeight.w500),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      news.publishedAt ?? "",
                      textAlign: TextAlign.end,
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * .03,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      news.content ?? "",
                      style: Theme.of(context).textTheme.titleSmall,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: InkWell(
                        onTap: () {
                          _launchUrl(news.url ?? "");
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text(
                              "View Full Article",
                              style: Theme.of(context)
                                  .textTheme
                                  .titleMedium!
                                  .copyWith(fontSize: 18),
                              textAlign: TextAlign.end,
                            ),
                            Icon(
                              Icons.arrow_forward_ios,
                              size: 15,
                            ),
                          ],
                        )),
                  ),
                ],
              ),
            ))
      ],
    );
  }

  Future<void> _launchUrl(String url) async {
    var uri = Uri.parse(url);

    if (!await launchUrl(uri)) {
      throw Exception('Could not launch $uri');
    }
  }
}

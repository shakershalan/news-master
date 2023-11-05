import 'package:flutter/material.dart';
import 'package:untitled5/my_theme.dart';

class HomeDrawer extends StatelessWidget {
  static const int categories = 1;
  static const int settings = 2;
  Function onDrawerItemClick;

  HomeDrawer({required this.onDrawerItemClick});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: MediaQuery.of(context).size.height * .2,
          width: double.infinity,
          color: MyTheme.greenColor,
          child: Center(
            child: Text(
              "setting",
              style: Theme.of(context).textTheme.titleLarge,
            ),
          ),
        ),
        SizedBox(
          height: 10,
        ),
        InkWell(
          onTap: () {
            onDrawerItemClick(HomeDrawer.categories);
          },
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Row(
              children: [
                Icon(
                  Icons.list,
                  size: 40,
                ),
                SizedBox(
                  width: 10,
                ),
                Text(
                  "categories",
                  style: Theme.of(context).textTheme.titleMedium,
                ),
              ],
            ),
          ),
        ),
        InkWell(
          onTap: () {
            onDrawerItemClick(HomeDrawer.settings);
          },
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Row(
              children: [
                Icon(
                  Icons.settings,
                  size: 40,
                ),
                SizedBox(
                  width: 10,
                ),
                Text(
                  "settings",
                  style: Theme.of(context).textTheme.titleMedium,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:untitled5/Home/home_drawar.dart';
import 'package:untitled5/category/category_fragment.dart';
import 'package:untitled5/search/news_search_%20delegate.dart';
import 'package:untitled5/settings/setting_tap.dart';

import '../category/category.dart';
import '../category/category_deatils.dart';
import '../my_theme.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = "Home_screen";

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
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
                selectedDrawerItem == HomeDrawer.settings
                    ? "Settings"
                    : selectedCategory == null
                        ? "News App!"
                        : selectedCategory!.title,
                style: Theme.of(context).textTheme.titleLarge,
              ),
              actions: [
                IconButton(
                    onPressed: () {
                      showSearch(
                          context: context, delegate: NewsSearchDelegate());
                    },
                    icon: Icon(
                      Icons.search,
                      size: 32,
                    ))
              ],
            ),
            drawer: Drawer(
              child: HomeDrawer(
                onDrawerItemClick: onDrawerItemClick,
              ),
            ),
            body: selectedDrawerItem == HomeDrawer.settings
                ? SettingsTap()
                : selectedCategory == null
                    ? CategoryFragment(
                        onCategoryClick: onCategoryClick,
                      )
                    : CategoryDeatils(category: selectedCategory!))
      ],
    );
  }

  Categorys? selectedCategory;

  void onCategoryClick(Categorys newSelectedCategory) {
    selectedCategory = newSelectedCategory;
    setState(() {});
  }

  int? selectedDrawerItem;

  void onDrawerItemClick(int newSelectedDrawerItem) {
    selectedDrawerItem = newSelectedDrawerItem;
    selectedCategory = null;
    Navigator.pop(context);
    setState(() {});
  }
}

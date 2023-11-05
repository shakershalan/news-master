import 'package:flutter/material.dart';
import 'package:untitled5/category/category.dart';
import 'package:untitled5/category/category_item.dart';

class CategoryFragment extends StatelessWidget {
  var categoriesList = Categorys.getCategories();
  Function onCategoryClick;

  CategoryFragment({required this.onCategoryClick});

  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            "pick your category \n of interest ",
            style: Theme.of(context).textTheme.titleMedium,
          ),
          SizedBox(
            height: 20,
          ),
          Expanded(
            child: GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, mainAxisSpacing: 18, crossAxisSpacing: 18),
              itemBuilder: (context, index) {
                return InkWell(
                    onTap: () {
                      onCategoryClick(categoriesList[index]);
                    },
                    child: CategoryItem(
                        category: categoriesList[index], index: index));
              },
              itemCount: categoriesList.length,
            ),
          )
        ],
      ),
    );
  }
}

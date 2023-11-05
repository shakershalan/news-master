import 'package:flutter/material.dart';

import '../model/SourceResponse.dart';
import '../my_theme.dart';

class TapItem extends StatelessWidget {
  bool isSelected;

  Source source;

  TapItem({required this.isSelected, required this.source});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 10),
      padding: EdgeInsets.symmetric(vertical: 8, horizontal: 24),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color: Theme.of(context).primaryColor,
          ),
          color: isSelected ? MyTheme.greenColor : Colors.transparent),
      child: Text(
        source.name ?? "",
        style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 18,
            color: isSelected ? MyTheme.witheColor : MyTheme.greenColor),
      ),
    );
  }
}

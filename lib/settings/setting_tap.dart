import 'package:flutter/material.dart';
import 'package:untitled5/my_theme.dart';

class SettingsTap extends StatefulWidget {
  @override
  State<SettingsTap> createState() => _SettingsTapState();
}

class _SettingsTapState extends State<SettingsTap> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Padding(
          padding: EdgeInsets.all(10),
          child: Text(
            "Language",
            style: Theme.of(context).textTheme.titleMedium,
          ),
        ),
        Container(
          padding: EdgeInsets.all(12),
          margin: EdgeInsets.all(12),
          decoration: BoxDecoration(
              color: MyTheme.witheColor,
              borderRadius: BorderRadius.circular(4),
              border: Border.all(color: MyTheme.greenColor)),
          child: InkWell(
            onTap: () {},
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "English",
                  style: TextStyle(color: MyTheme.greenColor),
                ),
                Icon(
                  Icons.arrow_drop_down,
                  color: MyTheme.greenColor,
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}

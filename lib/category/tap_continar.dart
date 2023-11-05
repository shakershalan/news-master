import 'package:flutter/material.dart';
import 'package:untitled5/category/tap_item.dart';
import 'package:untitled5/model/news_containar.dart';

import '../model/SourceResponse.dart';

class TapContainer extends StatefulWidget {
  List<Source> sourceList;

  TapContainer({required this.sourceList});

  @override
  State<TapContainer> createState() => _TapContainerState();
}

class _TapContainerState extends State<TapContainer> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: widget.sourceList.length,
        child: Column(
          children: [
            TabBar(
                onTap: (index) {
                  selectedIndex = index;
                  setState(() {});
                },
                isScrollable: true,
                indicatorColor: Colors.transparent,
                tabs: widget.sourceList
                    .map((source) => TapItem(
                        isSelected:
                            selectedIndex == widget.sourceList.indexOf(source),
                        source: source))
                    .toList()),
            Expanded(
                child: NewsContainer(source: widget.sourceList[selectedIndex]))
          ],
        ));
  }
}

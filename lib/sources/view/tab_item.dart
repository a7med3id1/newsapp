import 'package:flutter/material.dart';
import 'package:news/app_theme.dart';
import 'package:news/models/source_response/source.dart';

class TabItem extends StatelessWidget {
  final Source source;
  final bool isSelected;

  const TabItem({
    required this.source,
    required this.isSelected,
  });
  @override
  Widget build(BuildContext context) {
    final primaryColor = Theme.of(context).primaryColor;
    return Container(
      padding: EdgeInsets.all(8),
      margin: EdgeInsets.all(6),
      decoration: BoxDecoration(
        color: isSelected ? primaryColor : Colors.transparent,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        source.name ?? '',
        style:
            TextStyle(color: isSelected ? AppTheme.whiteColor : primaryColor),
      ),
    );
  }
}

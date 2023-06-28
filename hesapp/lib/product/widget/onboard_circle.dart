import 'package:flutter/material.dart';
import 'package:hesapp/core/extension/contex_extension.dart';

class OnBoardCircle extends StatelessWidget {
  const OnBoardCircle({super.key, required this.isSelected});
  final bool isSelected;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: context.paddingLow,
      child: CircleAvatar(
        backgroundColor: Colors.yellow.withOpacity(isSelected ? 1 : 0.2),
        radius: isSelected ? context.normalWidthValue  : context.lowWidthValue, // it will change
      ),
    );
  }
}

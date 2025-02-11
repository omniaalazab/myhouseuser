import 'package:flutter/material.dart';
import 'package:housemanuser/helper/color_helper.dart';
import 'package:housemanuser/helper/text_style_helper.dart';

class CountContainer extends StatelessWidget {
  const CountContainer({
    super.key,
    required this.countSign,
  });

  final String countSign;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      height: 30,
      width: 30,
      decoration:
          BoxDecoration(shape: BoxShape.circle, color: ColorHelper.purple),
      child: Text(countSign, style: TextStyleHelper.textStylefontSize18),
    );
  }
}

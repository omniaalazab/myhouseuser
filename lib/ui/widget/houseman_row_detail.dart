import 'package:flutter/material.dart';
import 'package:housemanuser/helper/text_style_helper.dart';

@immutable
class HousemanRowDetails extends StatelessWidget {
 const HousemanRowDetails({
    required this.imagePath,
    required this.housemanDetail,
    super.key,
  });
 final String imagePath;
 final String housemanDetail;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Image(
          image: AssetImage(imagePath),
        ),
        Text(housemanDetail, style: TextStyleHelper.textStylefontSize14),
      ],
    );
  }
}

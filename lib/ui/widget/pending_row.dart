import 'package:flutter/material.dart';
import 'package:housemanuser/helper/text_style_helper.dart';


// ignore: must_be_immutable
class PendingRowInfo extends StatelessWidget {
  PendingRowInfo({
    required this.rowText,
    required this.imagePath,
    super.key,
  });
  String imagePath;
  String rowText;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Image(
          image: AssetImage(imagePath),
        ),
        const SizedBox(
          width: 8,
        ),
        Text(rowText,
            style: TextStyleHelper.textStylefontSize13
                .copyWith(fontWeight: FontWeight.bold))
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:housemanuser/helper/color_helper.dart';

class DivideRRow extends StatelessWidget {
  const DivideRRow({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Divider(
      endIndent: 25,
      indent: 25,
      color: ColorHelper.darkgrey.withOpacity(.1),
    );
  }
}

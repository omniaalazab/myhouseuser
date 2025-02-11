import 'package:flutter/material.dart';
import 'package:housemanuser/helper/color_helper.dart';
import 'package:housemanuser/helper/text_style_helper.dart';
@immutable
class SignUpOrSignInRow extends StatelessWidget {
 const SignUpOrSignInRow({
    required this.textRow,
    required this.textButtonText,
    required this.onPressedFunction,
    super.key,
  });
 final String textRow;
 final String textButtonText;
 final void Function()? onPressedFunction;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(textRow, style: TextStyleHelper.textStylefontSize14),
        TextButton(
            onPressed: onPressedFunction,
            child: Text(textButtonText,
                style: TextStyleHelper.textStylefontSize14
                    .copyWith(color: ColorHelper.purple))),
      ],
    );
  }
}

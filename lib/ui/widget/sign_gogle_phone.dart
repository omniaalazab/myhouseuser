import 'package:flutter/material.dart';
@immutable
class SignWithGooglePhoneSizedBox extends StatelessWidget {
 const SignWithGooglePhoneSizedBox({
    super.key,
    required this.imagePath,
    required this.onTapFunction,
  });
 final String imagePath;
 final void Function()? onTapFunction;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 30,
      width: 30,
      child: InkWell(
        onTap: onTapFunction,
        child: Image(
          image: AssetImage(imagePath),
        ),
      ),
    );
  }
}

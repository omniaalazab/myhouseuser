import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:housemanuser/controller/localization/localization_cubit.dart';
import 'package:housemanuser/generated/l10n.dart';
import 'package:housemanuser/helper/color_helper.dart';
import 'package:housemanuser/helper/text_style_helper.dart';



class AppLanguage extends StatelessWidget {
  const AppLanguage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: ColorHelper.purple,
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.arrow_back_ios_new_rounded,
              color: Colors.white,
            ),
          ),
          title: Text(S.of(context).AppLanguage,
              style: TextStyleHelper.textStylefontSize20
                  .copyWith(fontWeight: FontWeight.bold, color: Colors.white)),
        ),
        body: Center(
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.center,
            // crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(
                height: 40,
              ),
              AppLanguageRow(
                imagePath: "assets/images/enflag1.png",
                text: S.of(context).English,
                onTapFunction: () {
                  context.read<LocalizationCubit>().switchToEnglish();
                },
              ),
              AppLanguageRow(
                imagePath: "assets/images/arflag.png",
                text: S.of(context).Arabic,
                onTapFunction: () {
                  context.read<LocalizationCubit>().switchToArabic();
                },
              ),
            ],
          ),
        ));
  }
}

// ignore: must_be_immutable
class AppLanguageRow extends StatelessWidget {
  AppLanguageRow(
      {super.key,
      required this.imagePath,
      required this.text,
      required this.onTapFunction});
  String imagePath;
  String text;
  void Function()? onTapFunction;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTapFunction,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            SizedBox(
              height: 30,
              width: 50,
              child: Image(
                fit: BoxFit.cover,
                image: AssetImage(
                  imagePath,
                ),
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            Text(
              text,
              style: TextStyleHelper.textStylefontSize18,
            )
          ],
        ),
      ),
    );
  }
}

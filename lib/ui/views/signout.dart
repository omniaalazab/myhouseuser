import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:housemanuser/controller/signout/signout_cubit.dart';
import 'package:housemanuser/controller/signout/signout_state.dart';
import 'package:housemanuser/generated/l10n.dart';
import 'package:housemanuser/helper/color_helper.dart';
import 'package:housemanuser/helper/text_style_helper.dart';
import 'package:housemanuser/ui/views/login.dart';
import 'package:housemanuser/ui/widget/shared_widget/custom_elevated_button.dart';
import 'package:housemanuser/ui/widget/shared_widget/dialog.dart';

class SignOut extends StatelessWidget {
  const SignOut({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<SignOutCubit, SignoutStatus>(
        listener: (context, state) {
          if (state is Unauthenticated) {
            // Navigate to the login page when the user is unauthenticated
            Navigator.of(context).pushReplacement(
                MaterialPageRoute(builder: (_) => const Login()));
          } else if (state is AuthError) {
            // Show an error message if sign out fails
            CreateDialogToaster.showErrorToast(state.error);
          }
        },
        child: Scaffold(
            body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Image(image: AssetImage("assets/images/Image (5).png")),
            const SizedBox(
              height: 15,
            ),
            Text(S.of(context).OhNoYourareleaving,
                style: TextStyleHelper.textStylefontSize16),
            Text(S.of(context).Areyousureyouwanttologout,
                style: TextStyleHelper.textStylefontSize12),
            const SizedBox(
              height: 15,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CustomElevatedButton(
                    widthButton: 50,
                    buttonText: S.of(context).No,
                    onPressedFunction: () {
                      Navigator.pop(context);
                    },
                    backColor: Colors.white,
                    fontColor: Colors.black),
                const SizedBox(
                  width: 10,
                ),
                CustomElevatedButton(
                    widthButton: 50,
                    buttonText: S.of(context).Yes,
                    onPressedFunction: () {
                      context.read<SignOutCubit>().signOut();
                      log("signout");
                    },
                    backColor: ColorHelper.purple,
                    fontColor: Colors.white)
              ],
            )
          ],
        )));
  }
}

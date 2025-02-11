import 'package:flutter/material.dart';
import 'package:housemanuser/generated/l10n.dart';
import 'package:housemanuser/helper/color_helper.dart';
import 'package:housemanuser/helper/text_style_helper.dart';
import 'package:housemanuser/ui/views/login.dart';
import 'package:housemanuser/ui/widget/shared_widget/custom_elevated_button.dart';

class SendMailToReset extends StatelessWidget {
  const SendMailToReset({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: ColorHelper.darkpurple,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Center(
            child: Column(
              children: [
                const Image(
                  image: AssetImage(
                    'assets/images/image 4.png',
                  ),
                  height: 150,
                  width: 70,
                ),
                Text(
                  S.of(context).WesendyouanEmailtoresetyourpassword,
                  style: TextStyleHelper.textStylefontSize16
                      .copyWith(fontWeight: FontWeight.w700),
                ),
                CustomElevatedButton(
                    widthButton: 80,
                    backColor: ColorHelper.purple,
                    //  sideColor: HexColor('8E6CEF').withOpacity(.5),
                    fontColor: Colors.white,
                    fontWeight: FontWeight.bold,
                    buttonText: S.of(context).ReturntoLogin,
                    onPressedFunction: () {
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const Login()));
                    }),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

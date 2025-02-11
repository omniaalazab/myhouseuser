import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:housemanuser/controller/check_empty_text_feild.dart';
import 'package:housemanuser/controller/login/login_cubit.dart';
import 'package:housemanuser/controller/login/login_state.dart';
import 'package:housemanuser/generated/l10n.dart';
import 'package:housemanuser/helper/color_helper.dart';
import 'package:housemanuser/ui/views/home.dart';
import 'package:housemanuser/ui/widget/shared_widget/custom_elevated_button.dart';
import 'package:housemanuser/ui/widget/shared_widget/dialog.dart';
import 'package:housemanuser/ui/widget/shared_widget/text_field.dart';

class SignPhone extends StatefulWidget {
  const SignPhone({super.key});

  @override
  State<SignPhone> createState() => _LoginState();
}

class _LoginState extends State<SignPhone> {
  TextEditingController phoneController = TextEditingController();
  TextEditingController otpController = TextEditingController();
  GlobalKey<FormState> formState = GlobalKey<FormState>();

  bool isObsecurePass = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorHelper.background,
      body: MultiBlocProvider(
        providers: [
          BlocProvider<LoginCubit>(
            create: (_) => LoginCubit(),
          ),
        ],
        child: BlocConsumer<LoginCubit, LoginStatus>(
          listener: (context, state) {
            if (state is LoginSuccess) {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => const Home()),
              );
            } else if (state is LoginFailure) {
              CreateDialogToaster.showErrorToast(state.errorMessage);
            }
            //  else if (state is LoginLoading) {
            //   CreateDialogToaster.showErrorDialogDefult(
            //     "loading",
            //     "Please wait...",
            //     context,
            //   );
            // }
            else if (state is AuthCodeSent) {
              CreateDialogToaster.showSucessToast(
                  S.of(context).OTPsenttoyourphone);
            }
          },
          builder: (context, state) {
            return SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(10, 40, 10, 20),
                child: Center(
                    child: Column(children: [
                  const SizedBox(height: 50),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Form(
                      key: formState,
                      child: Column(
                        children: [
                          CustomTextField(
                            textController: phoneController,
                            textLabel: S.of(context).PhoneNumber,
                            textFieldSuffix: Icon(
                              Icons.phone_in_talk_rounded,
                              color: ColorHelper.darkgrey,
                            ),
                            validatorFunction: (value) {
                              CheckEmptyValidationTextField.checkIsEmpty(value);

                              return null;
                            },
                          ),
                          const SizedBox(height: 10),
                          const SizedBox(height: 30),
                          CustomElevatedButton(
                            textSize: 18,
                            buttonWidget: const Image(
                                image: AssetImage("assets/images/Calling.png")),
                            buttonText: S.of(context).LOGINwithphone,
                            onPressedFunction: () {
                              log("*********");
                              if (formState.currentState!.validate()) {
                                log("*********");
                                context.read<LoginCubit>().verifyPhoneNumber(
                                    phoneController.text, context);
                              }
                            },
                            backColor: ColorHelper.purple,
                            fontColor: Colors.white,
                          ),
                          const SizedBox(height: 10),
                          CustomTextField(
                            textController: otpController,
                            textLabel: S.of(context).OTP,
                            textFieldSuffix: Icon(
                              Icons.phone_in_talk_rounded,
                              color: ColorHelper.darkgrey,
                            ),
                            validatorFunction: (value) {
                              CheckEmptyValidationTextField.checkIsEmpty(value);

                              return null;
                            },
                          ),
                          CustomElevatedButton(
                            textSize: 18,
                            buttonWidget: const Image(
                                image: AssetImage("assets/images/Calling.png")),
                            buttonText: S.of(context).Verify,
                            onPressedFunction: () {
                              log("*********");
                              if (formState.currentState!.validate()) {
                                log("*********");
                                context
                                    .read<LoginCubit>()
                                    .signInWithPhoneNumber(
                                        otpController.text, context);
                              }
                            },
                            backColor: ColorHelper.purple,
                            fontColor: Colors.white,
                          ),
                        ],
                      ),
                    ),
                  ),
                ])),
              ),
            );
          },
        ),
      ),
    );
  }
}

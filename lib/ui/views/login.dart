import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:housemanuser/controller/check_empty_text_feild.dart';
import 'package:housemanuser/controller/login/login_cubit.dart';
import 'package:housemanuser/controller/login/login_state.dart';
import 'package:housemanuser/controller/remember_me/remember_cubit.dart';
import 'package:housemanuser/generated/l10n.dart';
import 'package:housemanuser/helper/color_helper.dart';
import 'package:housemanuser/helper/text_style_helper.dart';
import 'package:housemanuser/ui/views/forget_password.dart';
import 'package:housemanuser/ui/views/home.dart';
import 'package:housemanuser/ui/views/registartion.dart';
import 'package:housemanuser/ui/views/sign_phone.dart';
import 'package:housemanuser/ui/widget/shared_widget/custom_elevated_button.dart';
import 'package:housemanuser/ui/widget/shared_widget/dialog.dart';
import 'package:housemanuser/ui/widget/shared_widget/text_field.dart';
import 'package:housemanuser/ui/widget/sign_gogle_phone.dart';
import 'package:housemanuser/ui/widget/signin_signout.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController mailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  GlobalKey<FormState> formState = GlobalKey<FormState>();
  bool isRemembered = false;
  bool isObsecurePass = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // backgroundColor: ColorHelper.background,
        body: MultiBlocProvider(
      providers: [
        BlocProvider<LoginCubit>(
          create: (_) => LoginCubit(),
        ),
        BlocProvider<RememberCubit>(
          create: (_) => RememberCubit(),
        ),
      ],
      child: BlocListener<RememberCubit, RememberState>(
        listener: (context, state) {
          if (state is InitialRemember) {
            setState(() {
              isRemembered = state.isRemember;
              mailController.text = state.email;
              passwordController.text = state.password;
            });
            log("InitialRemember state: email=${state.email}, password=${state.password}");
          } else if (state is ChangeRemmber) {
            setState(() {
              isRemembered = state.isRemember;
            });
            log("ChangeRemember state: isRemember=${state.isRemember}");
          }
        },
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
          },
          builder: (context, state) {
            return SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(10, 40, 10, 20),
                child: Center(
                  child: Column(
                    children: [
                      const SizedBox(height: 50),
                      Text(
                        S.of(context).Hello,
                        style: TextStyleHelper.textStylefontSize22
                            .copyWith(color: Colors.black),
                      ),
                      const SizedBox(height: 10),
                      Container(
                        alignment: Alignment.center,
                        height: 70,
                        width: 230,
                        child: Text(
                          S.of(context).loginmessage,
                          style: TextStyleHelper.textStylefontSize18,
                        ),
                      ),
                      const SizedBox(height: 30),
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Form(
                          key: formState,
                          child: Column(
                            children: [
                              CustomTextField(
                                textController: mailController,
                                textLabel: isRemembered
                                    ? ""
                                    : S.of(context).EmailAddress,
                                textFieldSuffix: Icon(
                                  Icons.mail_outlined,
                                  color: ColorHelper.darkgrey,
                                ),
                                validatorFunction: (value) {
                                  CheckEmptyValidationTextField.checkIsEmpty(
                                      value);
                                  return null;
                                },
                              ),
                              CustomTextField(
                                textController: passwordController,
                                textLabel:
                                    isRemembered ? "" : S.of(context).Password,
                                isObsecure: isObsecurePass,
                                textFieldSuffix: IconButton(
                                  icon: isObsecurePass
                                      ? Icon(
                                          Icons.visibility_off,
                                          color: ColorHelper.darkgrey,
                                        )
                                      : Icon(
                                          Icons.visibility,
                                          color: ColorHelper.darkgrey,
                                        ),
                                  onPressed: () {
                                    setState(() {
                                      isObsecurePass = !isObsecurePass;
                                    });
                                  },
                                ),
                                validatorFunction: (value) {
                                  CheckEmptyValidationTextField.checkIsEmpty(
                                      value);
                                  return null;
                                },
                              ),
                              const SizedBox(height: 10),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      Checkbox(
                                        value: isRemembered,
                                        onChanged: (value) {
                                          BlocProvider.of<RememberCubit>(
                                                  context)
                                              .changeRememberMe(
                                            value!,
                                            mailController.text,
                                            passwordController.text,
                                          );
                                        },
                                        activeColor: ColorHelper.purple,
                                        checkColor: Colors.white,
                                      ),
                                      Text(
                                        S.of(context).Rememberme,
                                        style:
                                            TextStyleHelper.textStylefontSize15,
                                      ),
                                    ],
                                  ),
                                  TextButton(
                                    onPressed: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (_) =>
                                                const ForgetPassword()),
                                      );
                                    },
                                    child: Text(
                                      S.of(context).Forgetpassword,
                                      style: TextStyleHelper.textStylefontSize15
                                          .copyWith(color: ColorHelper.purple),
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 30),
                              CustomElevatedButton(
                                textSize: 18,
                                buttonText: S.of(context).LogIn,
                                onPressedFunction: () {
                                  if (formState.currentState!.validate()) {
                                    context
                                        .read<LoginCubit>()
                                        .loginwithEmailAndPassword(
                                            email: mailController.text,
                                            password: passwordController.text,
                                            context: context);
                                  }
                                },
                                backColor: ColorHelper.purple,
                                fontColor: Colors.white,
                              ),
                              const SizedBox(height: 10),
                              SignUpOrSignInRow(
                                textRow: S.of(context).Donthaveanaccount,
                                textButtonText: S.of(context).SignUp,
                                onPressedFunction: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (_) => const Registration()),
                                  );
                                },
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(height: 30),
                      Text(
                        S.of(context).OrContinueWith,
                        style: TextStyleHelper.textStylefontSize14,
                      ),
                      const SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SignWithGooglePhoneSizedBox(
                            imagePath: "assets/images/Group.png",
                            onTapFunction: () {
                              context.read<LoginCubit>().loginWithGoogle();
                            },
                          ),
                          const SizedBox(width: 10),
                          SignWithGooglePhoneSizedBox(
                            imagePath: "assets/images/Calling.png",
                            onTapFunction: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (_) => const SignPhone()));
                            },
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    ));
  }
}

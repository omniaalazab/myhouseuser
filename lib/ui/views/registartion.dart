import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:housemanuser/controller/check_empty_text_feild.dart';
import 'package:housemanuser/controller/registration/registration_cubit.dart';
import 'package:housemanuser/controller/registration/registration_state.dart';
import 'package:housemanuser/controller/user/user_cubit.dart';
import 'package:housemanuser/generated/l10n.dart';
import 'package:housemanuser/helper/color_helper.dart';
import 'package:housemanuser/helper/text_style_helper.dart';
import 'package:housemanuser/ui/views/login.dart';
import 'package:housemanuser/ui/widget/shared_widget/custom_elevated_button.dart';
import 'package:housemanuser/ui/widget/shared_widget/dialog.dart';
import 'package:housemanuser/ui/widget/shared_widget/text_field.dart';
import 'package:housemanuser/ui/widget/signin_signout.dart';

class Registration extends StatefulWidget {
  const Registration({super.key});

  @override
  State<Registration> createState() => _RegistrationState();
}

class _RegistrationState extends State<Registration> {
  TextEditingController fullNameController = TextEditingController();

  TextEditingController userNameController = TextEditingController();

  TextEditingController mailController = TextEditingController();

  TextEditingController passwordController = TextEditingController();

  TextEditingController phoneController = TextEditingController();
  GlobalKey<FormState> formState = GlobalKey<FormState>();
  bool isObsecurePass = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        //backgroundColor: ColorHelper.background,
        body: BlocConsumer<RegistrationCubit, RegistrationStatus>(
            listener: (context, state) {
      if (state is RegistrationSuccess) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const Login()),
        );
      } else if (state is RegistrationLoading) {
        CreateDialogToaster.showErrorDialogDefult(
            S.of(context).loading, S.of(context).waitPlease, context);
      } else if (state is RegistrationFailure) {
        if (state.error == 'weak-password') {
          CreateDialogToaster.showErrorToast(S.of(context).Passwordisweak);
        } else if (state.error == 'email-already-in-use') {
          CreateDialogToaster.showErrorToast(S
              .of(context)
              .Thismailaccountisalreadyusedpleaseuseanotheraccount);
        } else {
          CreateDialogToaster.showErrorToast(state.error);
        }
      }
    }, builder: (context, state) {
      return SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Center(
            child: Column(
              children: [
                const SizedBox(
                  height: 50,
                ),
                CircleAvatar(
                  backgroundColor: ColorHelper.purple,
                  radius: 35,
                  child: const Image(
                      image: AssetImage("assets/images/Profile.png")),
                ),
                const SizedBox(
                  height: 20,
                ),
                Text(S.of(context).HelloUser,
                    style: TextStyleHelper.textStylefontSize22
                        .copyWith(color: Colors.black)),
                const SizedBox(
                  height: 10,
                ),
                Container(
                  alignment: Alignment.center,
                  height: 50,
                  width: 230,
                  child: Text(S.of(context).registermessage,
                      style: TextStyleHelper.textStylefontSize18),
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Form(
                    key: formState,
                    child: Column(
                      children: [
                        CustomTextField(
                          textController: fullNameController,
                          textLabel: (S.of(context).FullName),
                          textFieldSuffix: Icon(
                            Icons.person_outline_rounded,
                            color: ColorHelper.darkgrey,
                          ),
                          validatorFunction: (value) {
                            CheckEmptyValidationTextField.checkIsEmpty(value);
                            return null;
                          },
                        ),
                        CustomTextField(
                          textController: userNameController,
                          textLabel: S.of(context).UserName,
                          textFieldSuffix: Icon(
                            Icons.person_outline_rounded,
                            color: ColorHelper.darkgrey,
                          ),
                          validatorFunction: (value) {
                            CheckEmptyValidationTextField.checkIsEmpty(value);
                            return null;
                          },
                        ),
                        CustomTextField(
                          textController: mailController,
                          textLabel: S.of(context).EmailAddress,
                          textFieldSuffix: Icon(
                            Icons.mail_outlined,
                            color: ColorHelper.darkgrey,
                          ),
                          validatorFunction: (value) {
                            CheckEmptyValidationTextField.checkIsEmpty(value);
                            return null;
                          },
                        ),
                        CustomTextField(
                          textController: phoneController,
                          textLabel: S.of(context).PhoneNumber,
                          textFieldSuffix: Icon(
                            Icons.phone_in_talk_rounded,
                            color: ColorHelper.darkgrey,
                          ),
                          validatorFunction: (value) {
                            CheckEmptyValidationTextField.checkIsEmpty(value);
                            if (value!.length != 11) {
                              return S.of(context).phonenumberisnotcorrect;
                            }
                            return null;
                          },
                        ),
                        CustomTextField(
                          textController: passwordController,
                          textLabel: S.of(context).Password,
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
                            CheckEmptyValidationTextField.checkIsEmpty(value);
                            if (value!.length < 8) {
                              return S.of(context).Passwordisweak;
                            }
                            return null;
                          },
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        CustomElevatedButton(
                            textSize: 18,
                            buttonText: S.of(context).SignUp,
                            onPressedFunction: () async {
                              if (formState.currentState!.validate()) {
                                await context
                                    .read<RegistrationCubit>()
                                    .registerWithEmailAndPassword(
                                        email: mailController.text,
                                        password: passwordController.text)
                                    .then((v) {
                                  context.read<UserCubit>().addUser(
                                        userMail: mailController.text,
                                        userFullName: fullNameController.text,
                                        userName: userNameController.text,
                                        userPassword: passwordController.text,
                                        phoneNumber: phoneController.text,
                                      );
                                });
                              }
                            },
                            backColor: ColorHelper.purple,
                            fontColor: Colors.black),
                      ],
                    ),
                  ),
                ),
                SignUpOrSignInRow(
                  textRow: S.of(context).Alreadyhaveanaccount,
                  textButtonText: S.of(context).SignIn,
                  onPressedFunction: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (_) => const Login()));
                  },
                ),
              ],
            ),
          ),
        ),
      );
    }));
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:housemanuser/controller/check_empty_text_feild.dart';
import 'package:housemanuser/controller/reset_password/reset_cubit.dart';
import 'package:housemanuser/controller/reset_password/reset_state.dart';
import 'package:housemanuser/generated/l10n.dart';
import 'package:housemanuser/helper/color_helper.dart';
import 'package:housemanuser/helper/text_style_helper.dart';
import 'package:housemanuser/ui/views/sendmail_reset.dart';
import 'package:housemanuser/ui/widget/shared_widget/custom_elevated_button.dart';
import 'package:housemanuser/ui/widget/shared_widget/dialog.dart';
import 'package:housemanuser/ui/widget/shared_widget/text_field.dart';

class ForgetPassword extends StatefulWidget {
  const ForgetPassword({super.key});

  @override
  State<ForgetPassword> createState() => _FordgetPasswordState();
}

class _FordgetPasswordState extends State<ForgetPassword> {
  TextEditingController passwordController = TextEditingController();

  TextEditingController mailController = TextEditingController();
  GlobalKey<FormState> formState = GlobalKey<FormState>();

  bool isObsecurePass = true;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => ResetCubit(),
      child: Scaffold(
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
            title: Text(S.of(context).Forgetpassword,
                style: TextStyleHelper.textStylefontSize20.copyWith(
                    fontWeight: FontWeight.bold, color: Colors.white)),
          ),
          //   backgroundColor: ColorHelper.darkpurple,
          body:
              BlocConsumer<ResetCubit, ResetStatus>(listener: (context, state) {
            if (state is ResetSuccess) {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                    builder: (context) => const SendMailToReset()),
              );
            } else if (state is ResetFailure) {
              CreateDialogToaster.showErrorToast(state.errorMessage);
            } else if (state is ResetLoading) {
              CreateDialogToaster.showErrorDialogDefult(
                  S.of(context).loading, S.of(context).waitPlease, context);
            }
          }, builder: (context, state) {
            return Scaffold(
                body: Center(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
                child: Column(
                  children: [
                    const SizedBox(
                      height: 30,
                    ),
                    Form(
                      key: formState,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          CustomTextField(
                              textLabel: S.of(context).EmailAddress,
                              textFieldSuffix: Icon(
                                Icons.mail_outlined,
                                color: ColorHelper.darkgrey,
                              ),
                              keyboardType: TextInputType.emailAddress,
                              textController: mailController,
                              validatorFunction: (value) {
                                CheckEmptyValidationTextField.checkIsEmpty(
                                    value);
                                return null;
                              }),
                          const SizedBox(
                            height: 20,
                          ),
                          CustomElevatedButton(
                            backColor: ColorHelper.purple,
                            fontColor: Colors.white,
                            fontWeight: FontWeight.bold,
                            buttonText: S.of(context).Continue,
                            onPressedFunction: () async {
                              if (formState.currentState!.validate()) {
                                context
                                    .read<ResetCubit>()
                                    .resetPassword(mailController.text);
                              }
                            },
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ));
          })),
    );
  }
}

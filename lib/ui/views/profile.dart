import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:housemanuser/controller/profile/profile_cubit.dart';
import 'package:housemanuser/controller/user/user_cubit.dart';
import 'package:housemanuser/controller/user/user_state.dart';
import 'package:housemanuser/generated/l10n.dart';
import 'package:housemanuser/helper/text_style_helper.dart';
import 'package:housemanuser/ui/views/app_language.dart';
import 'package:housemanuser/ui/views/earning_list.dart';
import 'package:housemanuser/ui/views/edit_profile.dart';
import 'package:housemanuser/ui/views/forget_password.dart';
import 'package:housemanuser/ui/views/houseman_list.dart';
import 'package:housemanuser/ui/views/signout.dart';
import 'package:housemanuser/ui/views/taxes.dart';
import 'package:housemanuser/ui/widget/divider_row.dart';
import 'package:housemanuser/ui/widget/shared_widget/dialog.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  User? user = FirebaseAuth.instance.currentUser;

  @override
  void initState() {
    context.read<UserCubit>().fetchUserData();
    context.read<ProfileCubit>().fetchProfileImage(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 40,
            ),
            BlocBuilder<UserCubit, UserState>(
              builder: (context, state) {
                if (state.user.isNotEmpty) {
                  return Column(children: [
                    const SizedBox(height: 50),
                    Stack(children: [
                      InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (_) => const EditProfile()));
                          context
                              .read<ProfileCubit>()
                              .changeProfileImage(context);
                        },
                        child: CircleAvatar(
                          backgroundImage: NetworkImage((state
                                  .user[0].profileImage) 
                              //     ??
                              // "https://louisville.edu/enrollmentmanagement/images/person-icon/image"
                              ),
                          radius: 50,
                        ),
                      ),
                      Positioned(
                          left: 60,
                          bottom: 0,
                          child: InkWell(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (_) => const EditProfile()));

                              // context
                              //     .read<ProfileCubit>()
                              //     .changeProfileImage(context);
                            },
                            child: const CircleAvatar(
                              radius: 20,
                              child: Icon(Icons.edit),
                            ),
                          ))
                    ]),
                    const SizedBox(height: 10),
                    Text(
                      state.user[0].userName,
                      style: TextStyleHelper.textStylefontSize22.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 5),
                    Text(
                      state.user[0].userMail,
                      style: TextStyleHelper.textStylefontSize18.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 20),
                    Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          RowProfileOptions(
                            imagePath: "assets/images/Profile1.png",
                            optionText: S.of(context).Houseman,
                            onTapFunction: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (_) => const HousemanList()));
                            },
                          ),
                          const DivideRRow(),
                          RowProfileOptions(
                            imagePath: "assets/images/Discount1.png",
                            optionText: S.of(context).Taxes,
                            onTapFunction: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (_) => const Taxes()));
                            },
                          ),
                          const DivideRRow(),
                          // RowProfileOptions(
                          //   imagePath: "assets/images/Location.png",
                          //   optionText: S.of(context).ServiceAddress,
                          //   onTapFunction: () {
                          //     Navigator.push(
                          //         context,
                          //         MaterialPageRoute(
                          //             builder: (_) => const ServiceAddress()));
                          //   },
                          // ),
                          // const DivideRRow(),
                          RowProfileOptions(
                            imagePath: "assets/images/Icon (1).png",
                            optionText: S.of(context).AppLanguage,
                            onTapFunction: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (_) => const AppLanguage()));
                            },
                          ),
                          const DivideRRow(),
                          RowProfileOptions(
                            imagePath: "assets/images/Icon (2).png",
                            optionText: S.of(context).AppTheme,
                            onTapFunction: () {
                              CreateDialogToaster.dialogAppTheme(context);
                            },
                          ),
                          const DivideRRow(),
                          RowProfileOptions(
                            imagePath: "assets/images/Icon (3).png",
                            optionText: S.of(context).ChangePassword,
                            onTapFunction: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (_) => const ForgetPassword()));
                            },
                          ),
                          const DivideRRow(),
                          RowProfileOptions(
                            imagePath: "assets/images/Icon (1).png",
                            optionText: S.of(context).EarningList,
                            onTapFunction: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (_) => const EarningList()));
                            },
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          TextButton(
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (_) => const SignOut()));
                              },
                              child: Text(S.of(context).Logout,
                                  style: TextStyleHelper.textStylefontSize16))
                        ],
                      ),
                    ),
                  ]);
                } else {
                  return const CircularProgressIndicator();
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}

// ignore: must_be_immutable
class RowProfileOptions extends StatelessWidget {
  RowProfileOptions({
    required this.imagePath,
    required this.optionText,
    required this.onTapFunction,
    super.key,
  });
  String imagePath;
  String optionText;
  void Function()? onTapFunction;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Image(image: AssetImage(imagePath)),
            const SizedBox(
              width: 20,
            ),
            Text(
              optionText,
              style: TextStyleHelper.textStylefontSize16.copyWith(),
            ),
            const DivideRRow(),
          ],
        ),
        IconButton(
          onPressed: onTapFunction,
          icon: const Icon(Icons.arrow_forward_ios_rounded),
        ),
      ],
    );
  }
}

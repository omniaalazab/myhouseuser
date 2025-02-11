
import 'package:flutter/material.dart';
import 'package:housemanuser/generated/l10n.dart';
import 'package:housemanuser/helper/color_helper.dart';
import 'package:housemanuser/helper/text_style_helper.dart';
import 'package:housemanuser/models/onboard_model.dart';

import 'package:housemanuser/ui/views/login.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnBoardView extends StatefulWidget {
  const OnBoardView({super.key});

  @override
  State<OnBoardView> createState() => _OnBoardViewState();
}

class _OnBoardViewState extends State<OnBoardView> {
  List<OnBoardingModel> onboardingModels = [];
  @override
  void initState() {
    onboardingModels = [
      OnBoardingModel(
          title: "Welcome To Houseman",
          // title: S.of(context).WelcomeToHouseman,
          image: 'assets/images/Group (1).png'),
      OnBoardingModel(
          title: "Find Your Service",
          //S.of(context).FindYourService,
          image: 'assets/images/Group (2).png'),
      OnBoardingModel(
          title: "Book The Appointment",
          // title: S.of(context).BookTheAppointment,
          image: 'assets/images/Group (3).png'),
      OnBoardingModel(
          title: "Payment Gateway",
          // title: S.of(context).PaymentGateway,
          image: 'assets/images/Group (4).png'),
    ];
    super.initState();
  }

  var onboardingcontroller = PageController();

  bool islastPage = false;
  _onDone() {
    Navigator.push(context, MaterialPageRoute(builder: (_) => const Login()));
  }

  _nextPage() {
    onboardingcontroller.nextPage(
        duration: const Duration(microseconds: 900),
        curve: Curves.fastLinearToSlowEaseIn);
  }

  _skip() {
    onboardingcontroller.jumpToPage(onboardingModels.length - 1);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          TextButton(
              onPressed: () {
                _skip();
              },
              child: Text(S.of(context).Skip,
                  style: TextStyleHelper.textStylefontSize14))
        ],
      ),
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(8),
        child: Column(
          children: [
            Expanded(
              child: PageView.builder(
                controller: onboardingcontroller,
                physics: const BouncingScrollPhysics(),
                itemCount: onboardingModels.length,
                itemBuilder: (context, index) {
                  return OnBoardingItem(
                      onBoardingModel: onboardingModels[index]);
                },
                onPageChanged: (value) {
                  if (value == onboardingModels.length - 1) {
                    setState(() {
                      islastPage = true;
                    });
                  } else {
                    setState(() {
                      islastPage = false;
                    });
                  }
                },
              ),
            ),
            Row(
              children: [
                SmoothPageIndicator(
                  onDotClicked: (index) {
                    onboardingcontroller.jumpToPage(index);
                  },
                  controller: onboardingcontroller,
                  count: onboardingModels.length,
                  effect: ExpandingDotsEffect(
                    dotHeight: 10,
                    dotColor: ColorHelper.purple,
                  ),
                ),
                const Spacer(),
                TextButton(
                    onPressed: () {
                      if (islastPage) {
                        setState(() {
                          _onDone();
                        });
                      } else {
                        setState(() {
                          _nextPage();
                        });
                      }
                    },
                    child: islastPage
                        ? Text(S.of(context).GetStrated,
                            style: TextStyleHelper.textStylefontSize14)
                        : Text(S.of(context).Skip,
                            style: TextStyleHelper.textStylefontSize14))
              ],
            ),
          ],
        ),
      )),
    );
  }
}
@immutable
class OnBoardingItem extends StatelessWidget {
 const OnBoardingItem({super.key, required this.onBoardingModel});
 final OnBoardingModel onBoardingModel;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          alignment: Alignment.center,
          padding: const EdgeInsets.all(50),
          margin: const EdgeInsets.fromLTRB(0, 0, 0, 20),
          child: Image.asset(onBoardingModel.image),
        ),
        const SizedBox(
          height: 10,
        ),
        Text(onBoardingModel.title,
            style: TextStyleHelper.textStylefontSize18
                .copyWith(fontWeight: FontWeight.bold)),
        const SizedBox(
          height: 10,
        ),
      ],
    );
  }
}

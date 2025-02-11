import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:housemanuser/controller/provider/provider_cubit.dart';
import 'package:housemanuser/controller/provider/provider_state.dart';
import 'package:housemanuser/controller/services/services_cubit.dart';
import 'package:housemanuser/controller/services/services_states.dart';
import 'package:housemanuser/generated/l10n.dart';
import 'package:housemanuser/helper/color_helper.dart';
import 'package:housemanuser/helper/text_style_helper.dart';
import 'package:housemanuser/models/onboard_model.dart';
import 'package:housemanuser/ui/views/all_provider.dart';
import 'package:housemanuser/ui/views/all_service_list.dart';
import 'package:housemanuser/ui/views/notification.dart';
import 'package:housemanuser/ui/views/provider_details.dart';
import 'package:housemanuser/ui/views/serrvice_list.dart';
import 'package:housemanuser/ui/views/service_details.dart';
import 'package:housemanuser/ui/widget/shared_widget/custom_elevated_button.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class MainView extends StatefulWidget {
  const MainView({super.key});

  @override
  State<MainView> createState() => _MainViewState();
}

class _MainViewState extends State<MainView> {
  List<OnBoardingModel> onboardingModels = [
    OnBoardingModel(
        title: 'Mansoura , Samia el Gaml',
        image: 'assets/images/Image (6).png'),
    OnBoardingModel(
        title: 'Mansoura , Galaa', image: 'assets/images/Image (7).png'),
    OnBoardingModel(
        title: 'Mansoura , Salah Salim', image: 'assets/images/Image (8).png'),
    OnBoardingModel(
        title: 'Mansoura , Toril', image: 'assets/images/Image (3).png'),
  ];

  var onboardingcontroller = PageController();

  nextPage() {
    onboardingcontroller.nextPage(
        duration: const Duration(microseconds: 900),
        curve: Curves.fastLinearToSlowEaseIn);
  }

  skip() {
    onboardingcontroller.jumpToPage(onboardingModels.length - 1);
  }

  @override
  void initState() {
    context.read<ServicesCubit>().getAllservices();
    context.read<ProviderCubit>().getAllProvider();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Locale currentLocale = Localizations.localeOf(context);
    return Scaffold(
        body: SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(10, 0, 10, 10),
        child: Column(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * .4,
              width: double.infinity,
              child: Stack(
                children: [
                  PageView.builder(
                    controller: onboardingcontroller,
                    physics: const BouncingScrollPhysics(),
                    itemCount: onboardingModels.length,
                    itemBuilder: (context, index) {
                      return Stack(
                        children: [
                          OnBoardingItemStack(
                              onBoardingModel: onboardingModels[index]),
                          Positioned(
                            left: 70,
                            bottom: 0,
                            child: Card(
                              color: Colors.white.withOpacity(0.8),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  children: [
                                    Image.asset("assets/images/Location.png"),
                                    Text(
                                      onboardingModels[index].title,
                                      style: TextStyleHelper.textStylefontSize18
                                          .copyWith(
                                        fontWeight: FontWeight.bold,
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      );
                    },
                  ),
                  Positioned(
                    right: 30,
                    top: 80,
                    child: CircleAvatar(
                      radius: 20,
                      child: IconButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (_) => const NotificationPage()));
                        },
                        icon: const Icon(
                          Icons.notifications_active_outlined,
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 70,
                    left: 130,
                    child: Row(
                      children: [
                        SmoothPageIndicator(
                          onDotClicked: (index) {
                            onboardingcontroller.jumpToPage(index);
                          },
                          controller: onboardingcontroller,
                          count: onboardingModels.length,
                          effect: ExpandingDotsEffect(
                            dotHeight: 5,
                            dotColor: ColorHelper.purple,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      S.of(context).Category,
                      style: TextStyleHelper.textStylefontSize16,
                    ),
                    TextButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (_) => const AllProvider()));
                        },
                        child: Text(
                          S.of(context).ViewAll,
                          style: TextStyleHelper.textStylefontSize16,
                        ))
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                SizedBox(
                  height: 500,
                  width: MediaQuery.of(context).size.width,
                  child: BlocBuilder<ProviderCubit, ProviderStatus>(
                    builder: (context, state) {
                      if (state is ProviderLoading) {
                        return const Center(child: CircularProgressIndicator());
                      } else if (state is Providerloaded) {
                        final providers = (state).providerList;
                        return GridView.builder(
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              // childAspectRatio: 1.0,
                              childAspectRatio: 2.5 / 3,
                              mainAxisSpacing: 5,
                              crossAxisSpacing: 5,
                            ),
                            itemCount: providers.length - 2,
                            itemBuilder: (context, index) {
                              return InkWell(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (_) => ProviderDetails(
                                              provider: providers[index])));
                                },
                                child: Column(
                                  children: [
                                    ClipRRect(
                                      borderRadius: const BorderRadius.only(
                                          topLeft: Radius.circular(10),
                                          topRight: Radius.circular(10)),
                                      child: Image.network(
                                        providers[index].imagePath,
                                        height: 100,
                                        width: 100,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                    Text(
                                      (currentLocale.languageCode == 'ar')
                                          ? providers[index].serviceNameAr
                                          : providers[index].serviceNameEn,
                                    )
                                  ],
                                ),
                              );
                            });
                      } else if (state is ProviderFailure) {
                        return Center(child: Text(state.errorMessage));
                      } else {
                        return Container();
                      }
                    },
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      S.of(context).Services,
                      style: TextStyleHelper.textStylefontSize16,
                    ),
                    TextButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (_) => const AllServiceList()));
                        },
                        child: Text(
                          S.of(context).ViewAll,
                          style: TextStyleHelper.textStylefontSize16,
                        ))
                  ],
                ),
                SizedBox(
                  height: 500,
                  width: MediaQuery.of(context).size.width,
                  child: BlocBuilder<ServicesCubit, ServicesStatus>(
                    builder: (context, state) {
                      if (state is ServicesLoading) {
                        return const Center(child: CircularProgressIndicator());
                      } else if (state is Servicesloaded) {
                        final services = (state).servicesList;
                        return GridView.builder(
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              // childAspectRatio: 1.0,
                              childAspectRatio: 2.5 / 3,
                              mainAxisSpacing: 20,
                              crossAxisSpacing: 10,
                            ),
                            itemCount: services.length - 2,
                            itemBuilder: (context, index) {
                              return ServicesList(
                                onTapFunction: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (_) => ServicesDetails(
                                                index: index,
                                              )));
                                },
                                serviceImagePath:
                                    services[index].imagePathService,
                                price: services[index].price,
                                rating: services[index].houseman.rate,
                                serviceName:
                                    (currentLocale.languageCode == 'ar')
                                        ? services[index].nameServiceAr
                                        : services[index].nameServiceEn,
                                housemanName: services[index].houseman.name,
                                housemanImagePath:
                                    services[index].houseman.imagePath,
                              );
                            });
                      } else if (state is ServicesFailure) {
                        return Center(child: Text(state.errorMessage));
                      } else {
                        return Container();
                      }
                    },
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Container(
                    width: MediaQuery.of(context).size.width,
                    height: 200,
                    color: ColorHelper.purple,
                    child: Center(
                        child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Image.asset("assets/images/Stars.png"),
                        const SizedBox(
                          height: 20,
                        ),
                        Text(S.of(context).IntroducingCustomerRating,
                            style: TextStyleHelper.textStylefontSize14
                                .copyWith(color: Colors.white)),
                        const SizedBox(
                          height: 20,
                        ),
                        CustomElevatedButton(
                            widthButton: 50,
                            buttonText: S.of(context).SeeYourRating,
                            onPressedFunction: () {},
                            backColor: Colors.white,
                            fontColor: ColorHelper.purple),
                      ],
                    )))
              ],
            )
          ],
        ),
      ),
    ));
  }
}

class OnBoardingItemStack extends StatelessWidget {
  const OnBoardingItemStack({super.key, required this.onBoardingModel});

  final OnBoardingModel onBoardingModel;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * .4,
      width: double.infinity,
      child: Image.asset(
        onBoardingModel.image,
        fit: BoxFit.cover,
      ),
    );
  }
}

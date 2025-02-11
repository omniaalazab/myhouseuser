import 'dart:developer';

import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:housemanuser/controller/reviews/review_cubit.dart';
import 'package:housemanuser/controller/reviews/review_state.dart';
import 'package:housemanuser/controller/services/services_cubit.dart';
import 'package:housemanuser/controller/services/services_states.dart';
import 'package:housemanuser/generated/l10n.dart';
import 'package:housemanuser/helper/color_helper.dart';
import 'package:housemanuser/helper/text_style_helper.dart';
import 'package:housemanuser/models/services_models.dart';
import 'package:housemanuser/ui/views/add_booking.dart';
import 'package:housemanuser/ui/views/all_service_list.dart';
import 'package:housemanuser/ui/views/review.dart';
import 'package:housemanuser/ui/widget/rating_bar.dart';
import 'package:housemanuser/ui/widget/review_listtile.dart';

class ServicesDetails extends StatefulWidget {
  const ServicesDetails({
    super.key,
    required this.index,
  });

  final int index;

  @override
  State<ServicesDetails> createState() => _ServicesDetailsState();
}

class _ServicesDetailsState extends State<ServicesDetails> {
  late List<ServicesModel> services; // Declare services list here

  @override
  void initState() {
    context.read<ReviewCubit>().getAllReview();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Locale currentLocale = Localizations.localeOf(context);

    return Scaffold(
      floatingActionButton: BlocBuilder<ServicesCubit, ServicesStatus>(
        builder: (context, state) {
          if (state is Servicesloaded) {
            services = state.servicesList; // Initialize services list here

            return InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => AddBooking(
                      price: services[widget.index].price,
                      imagePath: services[widget.index].imagePathService,
                      serviceName: (currentLocale.languageCode == 'ar')
                          ? services[widget.index].nameServiceAr
                          : services[widget.index].nameServiceEn,
                    ),
                  ),
                );
              },
              child: const Image(
                  image: AssetImage("assets/images/Featured Icon.png")),
            );
          } else {
            return Container(); // Return empty container if the state is not loaded
          }
        },
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            BlocBuilder<ServicesCubit, ServicesStatus>(
              builder: (context, state) {
                if (state is ServicesLoading) {
                  return const Center(child: CircularProgressIndicator());
                } else if (state is Servicesloaded) {
                  services =
                      state.servicesList; // Initialize services list here

                  return Column(
                    children: [
                      // Your existing UI code for showing service details
                      SizedBox(
                        height: MediaQuery.of(context).size.height * .5,
                        width: double.infinity,
                        child: Stack(
                          children: [
                            SizedBox(
                              height: MediaQuery.of(context).size.height * .7,
                              width: MediaQuery.of(context).size.width,
                              child: Image.network(
                                services[widget.index].imagePathService,
                                fit: BoxFit.cover,
                              ),
                            ),
                            Positioned(
                              left: 60,
                              top: 30,
                              child: IconButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                icon: Icon(
                                  Icons.arrow_back_ios_new_rounded,
                                  color: ColorHelper.purple,
                                ),
                              ),
                            ),
                            Positioned(
                              left: 50,
                              bottom: 0,
                              child: Container(
                                margin:
                                    const EdgeInsets.symmetric(horizontal: 8.0),
                                padding: const EdgeInsets.all(12.0),
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(12.0),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey.withOpacity(0.2),
                                      spreadRadius: 3,
                                      blurRadius: 7,
                                      offset: const Offset(0, 3),
                                    ),
                                  ],
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      (currentLocale.languageCode == 'ar')
                                          ? services[widget.index].nameServiceAr
                                          : services[widget.index]
                                              .nameServiceEn,
                                      style:
                                          TextStyleHelper.textStylefontSize22,
                                    ),
                                    const SizedBox(height: 5),
                                    Text(
                                      "${services[widget.index].price}",
                                      style:
                                          TextStyleHelper.textStylefontSize14,
                                    ),
                                    const SizedBox(height: 10),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(S.of(context).Duration,
                                            style: TextStyleHelper
                                                .textStylefontSize16),
                                        const SizedBox(width: 80),
                                        Text(services[widget.index].duration),
                                      ],
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(S.of(context).Rate,
                                            style: TextStyleHelper
                                                .textStylefontSize16),
                                        const SizedBox(width: 80),
                                        CustomRatingBar(
                                          rating: services[widget.index]
                                              .houseman
                                              .rate,
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 20),
                      Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(S.of(context).Description,
                                style: TextStyleHelper.textStylefontSize18),
                            const SizedBox(height: 10),
                            Text(
                              (currentLocale.languageCode == 'ar')
                                  ? services[widget.index].descriptionAr
                                  : services[widget.index].descriptionEn,
                              style: TextStyleHelper.textStylefontSize15,
                              maxLines: 3,
                              overflow: TextOverflow.visible,
                            ),
                            const SizedBox(height: 10),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(S.of(context).Gallery,
                                    style: TextStyleHelper.textStylefontSize18),
                                TextButton(
                                  onPressed: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (_) => const AllServiceList(),
                                      ),
                                    );
                                  },
                                  child: Text(S.of(context).ViewAll,
                                      style:
                                          TextStyleHelper.textStylefontSize16),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 90,
                              child: ListView.builder(
                                scrollDirection: Axis.horizontal,
                                itemCount: services.length - 2,
                                itemBuilder: (context, index) {
                                  return Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 4.0),
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(10),
                                      child: Image.network(
                                        services[index].imagePathService,
                                        height: 90,
                                        width: 200,
                                        fit: BoxFit.cover,
                                        errorBuilder:
                                            (context, error, stackTrace) {
                                          return const Icon(Icons.error);
                                        },
                                      ),
                                    ),
                                  );
                                },
                              ),
                            ),
                            const SizedBox(height: 20),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(S.of(context).Reviews,
                                    style: TextStyleHelper.textStylefontSize20),
                                TextButton(
                                  onPressed: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (_) => const Reviews(),
                                      ),
                                    );
                                  },
                                  child: Text(S.of(context).ViewAll,
                                      style:
                                          TextStyleHelper.textStylefontSize16),
                                ),
                              ],
                            ),
                            BlocBuilder<ReviewCubit, ReviewStatus>(
                              builder: (context, state) {
                                if (state is ReviewLoading) {
                                  return const Center(
                                      child: CircularProgressIndicator());
                                } else if (state is ReviewSuccess) {
                                  final reviews = state.review;
                                  log("${reviews.length}********////*******");
                                  return ListView.builder(
                                    physics:
                                        const NeverScrollableScrollPhysics(),
                                    shrinkWrap: true,
                                    itemCount: reviews.length,
                                    itemBuilder: (context, index) {
                                      return ReviewListTile(
                                        listTileTitle: reviews[index].userName,
                                        listTileSubtitle: reviews[index].review,
                                        imagePath: reviews[index].imagePath,
                                        rating: reviews[index].rate,
                                        dateReview: reviews[index].date,
                                      );
                                    },
                                  );
                                } else if (state is ReviewFailure) {
                                  return Center(
                                      child: Text(state.errorMessage));
                                } else {
                                  return Container();
                                }
                              },
                            ),
                          ],
                        ),
                      ),
                    ],
                  );
                } else if (state is ServicesFailure) {
                  return Center(child: Text(state.errorMessage));
                } else {
                  return Container();
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}

import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:housemanuser/controller/login/login_cubit.dart';
import 'package:housemanuser/controller/reviews/review_cubit.dart';
import 'package:housemanuser/controller/reviews/review_state.dart';
import 'package:housemanuser/controller/search_chat/search_chat_cubit.dart';
import 'package:housemanuser/generated/l10n.dart';
import 'package:housemanuser/helper/color_helper.dart';
import 'package:housemanuser/helper/text_style_helper.dart';
import 'package:housemanuser/models/booking_model.dart';
import 'package:housemanuser/ui/views/review.dart';
import 'package:housemanuser/ui/views/search_chat.dart';
import 'package:housemanuser/ui/widget/booking_timeline_history.dart';
import 'package:housemanuser/ui/widget/custom_row.dart';
import 'package:housemanuser/ui/widget/dialog_rating.dart';
import 'package:housemanuser/ui/widget/divider_row.dart';
import 'package:housemanuser/ui/widget/rating_bar.dart';
import 'package:housemanuser/ui/widget/review_listtile.dart';
import 'package:housemanuser/ui/widget/shared_widget/custom_elevated_button.dart';

// ignore: must_be_immutable
class CheckServiceStatus extends StatefulWidget {
  CheckServiceStatus({
    required this.booking,
    super.key,
  });
  BookingModel booking;

  @override
  State<CheckServiceStatus> createState() => _CheckServiceStatusState();
}

class _CheckServiceStatusState extends State<CheckServiceStatus> {
  @override
  void initState() {
    (context.read<ReviewCubit>().getAllReview());
    super.initState();
  }

  // BookingHistory bookHistory;
  @override
  Widget build(BuildContext context) {
    Locale currentLocale = Localizations.localeOf(context);
    // initState
    return Scaffold(
      // backgroundColor: ColorHelper.background,
      appBar: AppBar(
        title: Text(S.of(context).Pending,
            style: TextStyleHelper.textStylefontSize19
                .copyWith(color: Colors.white)),
        backgroundColor: ColorHelper.purple,
        actions: [
          Row(
            children: [
              SizedBox(
                  height: 16,
                  width: 100,
                  child: Text(S.of(context).CheckStatus,
                      style: TextStyleHelper.textStylefontSize14
                          .copyWith(color: Colors.white))),
              const SizedBox(
                width: 10,
              ),
            ],
          )
        ],
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back_ios_new_rounded,
            color: Colors.white,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(20, 30, 20, 30),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(S.of(context).BookingID,
                      style: TextStyleHelper.textStylefontSize19),
                  TextButton(
                      onPressed: () {
                        showModalBottomSheet(
                          context: context,
                          builder: (_) {
                            return BookingHistoryTimeline(
                              bookingId: widget.booking.bookingId,
                            ); // Assuming BookingHistoryTimeline is a widget
                          },
                        );
                      },
                      child: Text(widget.booking.bookingId,
                          style: TextStyleHelper.textStylefontSize19
                              .copyWith(color: ColorHelper.purple))),
                ],
              ),
              const SizedBox(
                height: 15,
              ),
              const DivideRRow(),
              const SizedBox(
                height: 15,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                          currentLocale.languageCode == 'ar'
                              ? widget.booking.textBooking_ar
                              : widget.booking.textBooking_en,
                          style: TextStyleHelper.textStylefontSize19.copyWith(
                              // color: Colors.black,
                              fontWeight: FontWeight.normal)),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(S.of(context).Datee(widget.booking.date)),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(S.of(context).Timee(widget.booking.time)),
                      const SizedBox(
                        height: 10,
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      SizedBox(
                          width: MediaQuery.of(context).size.width * .3,
                          child: Image(
                              image: NetworkImage(widget.booking.imagePath)))
                    ],
                  )
                ],
              ),

              Card(
                elevation: 0,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(S.of(context).AboutHouseman,
                          style: TextStyleHelper.textStylefontSize19
                              .copyWith(fontWeight: FontWeight.bold)),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            children: [
                              CircleAvatar(
                                  radius: 40,
                                  backgroundImage: NetworkImage(
                                      widget.booking.houseman.imagePath)),
                            ],
                          ),
                          // const SizedBox(
                          //   width: 10,
                          // ),
                          SizedBox(
                            width: MediaQuery.of(context).size.width * .6,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(widget.booking.houseman.name,
                                    style: TextStyleHelper.textStylefontSize16
                                        .copyWith(fontWeight: FontWeight.bold)),
                                const SizedBox(
                                  height: 15,
                                ),
                                Row(
                                  children: [
                                    CustomRatingBar(
                                      rating: widget.booking.houseman.rate,
                                    ),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    Text('${widget.booking.houseman.rate}',
                                        style: TextStyleHelper
                                            .textStylefontSize16
                                            .copyWith(
                                                fontWeight: FontWeight.bold)),
                                  ],
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                TextButton(
                                  onPressed: () {
                                    setState(() {
                                      DialogRating.showRatingDialog(
                                          context,
                                          widget.booking.houseman.name,
                                          widget.booking.houseman.rate);
                                    });
                                  },
                                  child: Text(
                                    S.of(context).RateHouseman,
                                    style: TextStyleHelper.textStylefontSize15,
                                  ),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: CustomElevatedButton(
                                buttonWidget: const Image(
                                    color: Colors.white,
                                    image: AssetImage(
                                        "assets/images/Calling.png")),
                                buttonText: S.of(context).Call,
                                onPressedFunction: () {
                                  context.read<LoginCubit>().callNumberPhone();
                                },
                                backColor: ColorHelper.purple,
                                fontColor: Colors.white),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Expanded(
                            child: CustomElevatedButton(
                                buttonWidget: const Image(
                                    image:
                                        AssetImage("assets/images/Chat.png")),
                                buttonText: S.of(context).Chat,
                                onPressedFunction: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (_) => SearchChatView(
                                              customerMail: widget.booking
                                                  .customer.customerMail)));
                                  context
                                      .read<WrittenSearchCubit>()
                                      .getFirestoreDocuments();
                                },
                                backColor:
                                    const Color.fromARGB(255, 214, 212, 212),
                                fontColor: Colors.black),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ),

              const SizedBox(
                height: 30,
              ),
              /////////////////////////////
              Card(
                elevation: 0,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(S.of(context).AboutCustomer,
                          style: TextStyleHelper.textStylefontSize19
                              .copyWith(fontWeight: FontWeight.bold)),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            children: [
                              CircleAvatar(
                                  radius: 40,
                                  backgroundImage: NetworkImage(widget
                                      .booking.customer.customerImagePath)),
                            ],
                          ),
                          // const SizedBox(
                          //   width: 10,
                          // ),
                          SizedBox(
                            width: MediaQuery.of(context).size.width * .6,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(widget.booking.customer.customerName,
                                    style: TextStyleHelper.textStylefontSize16
                                        .copyWith(fontWeight: FontWeight.bold)),
                                const SizedBox(
                                  height: 15,
                                ),
                                Row(
                                  children: [
                                    const Image(
                                      image: AssetImage(
                                        "assets/images/Message.png",
                                      ),
                                      width: 20,
                                    ),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    Text(widget.booking.customer.customerMail,
                                        style: TextStyleHelper
                                            .textStylefontSize14),
                                  ],
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Row(
                                  children: [
                                    const Image(
                                        image: AssetImage(
                                            "assets/images/Location.png")),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    Expanded(
                                      child: Text(
                                          widget.booking.customer
                                              .customerLocation,
                                          style: TextStyleHelper
                                              .textStylefontSize14,
                                          overflow: TextOverflow.ellipsis),
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  height: 40,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: CustomElevatedButton(
                                buttonWidget: const Image(
                                    color: Colors.white,
                                    image: AssetImage(
                                        "assets/images/Calling.png")),
                                buttonText: S.of(context).Call,
                                onPressedFunction: () {
                                  context.read<LoginCubit>().callNumberPhone();
                                },
                                backColor: ColorHelper.purple,
                                fontColor: Colors.white),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Expanded(
                            child: CustomElevatedButton(
                                buttonWidget: const Image(
                                    image:
                                        AssetImage("assets/images/Chat.png")),
                                buttonText: S.of(context).Chat,
                                onPressedFunction: () {
                                  // Navigator.push(
                                  //     context,
                                  //     MaterialPageRoute(
                                  //         builder: (_) => SearchChatView(
                                  //             customerMail: booking
                                  //                 .customer.customerMail)));
                                  // context
                                  //     .read<WrittenSearchCubit>()
                                  //     .getFirestoreDocuments();
                                },
                                backColor:
                                    const Color.fromARGB(255, 214, 212, 212),
                                fontColor: Colors.black),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(S.of(context).PaymentDetails,
                      style: TextStyleHelper.textStylefontSize19.copyWith(
                        fontWeight: FontWeight.normal,
                        // color: Colors.black
                      )),
                  const SizedBox(
                    height: 15,
                  ),
                  PaymentRow(
                    bookingId: widget.booking.bookingId,
                    paymentRowText: S.of(context).ID,
                    rowColor: ColorHelper.purple,
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  const DivideRRow(),
                  PaymentRow(
                    bookingId: widget.booking.payment.method,
                    paymentRowText: S.of(context).Method,
                    rowColor: ColorHelper.darkgrey,
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  const DivideRRow(),
                  PaymentRow(
                    bookingId: widget.booking.payment.paymentStatus,
                    paymentRowText: S.of(context).Status,
                    rowColor: Colors.green,
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  const DivideRRow(),
                  CustomElevatedButton(
                      alignButton: MainAxisAlignment.center,
                      buttonText: S.of(context).CancleBooking,
                      onPressedFunction: () {},
                      backColor: ColorHelper.purple,
                      fontColor: Colors.white)
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(S.of(context).PriceDetail,
                      style: TextStyleHelper.textStylefontSize19.copyWith(
                          fontWeight: FontWeight.normal, color: Colors.black)),
                  const SizedBox(
                    height: 15,
                  ),
                  PaymentRow(
                    bookingId: '${widget.booking.payment.rate}',
                    paymentRowText: S.of(context).Rate,
                    rowColor: ColorHelper.darkgrey,
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  const DivideRRow(),
                  PaymentRow(
                    bookingId: '${widget.booking.payment.amount}',
                    paymentRowText: S.of(context).Quantity,
                    rowColor: ColorHelper.darkgrey,
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  const DivideRRow(),
                  PaymentRow(
                    bookingId: "${widget.booking.payment.amount}",
                    paymentRowText: S.of(context).Discount,
                    rowColor: Colors.green,
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  const DivideRRow(),
                  PaymentRow(
                    bookingId: widget.booking.payment.coupon,
                    paymentRowText: S.of(context).Coupon,
                    rowColor: Colors.green,
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  const DivideRRow(),
                  PaymentRow(
                    bookingId: "${widget.booking.payment.subtotal}",
                    paymentRowText: S.of(context).Subtotal,
                    rowColor: Colors.green,
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  const DivideRRow(),
                  PaymentRow(
                    bookingId: "${widget.booking.payment.totalAmount}",
                    paymentRowText: S.of(context).TotalAmount,
                    rowColor: ColorHelper.purple,
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  const DivideRRow(),
                  CustomElevatedButton(
                      alignButton: MainAxisAlignment.center,
                      buttonText: S.of(context).CancleBooking,
                      onPressedFunction: () {},
                      backColor: ColorHelper.purple,
                      fontColor: Colors.white)
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(S.of(context).Reviews,
                          style: TextStyleHelper.textStylefontSize20
                              .copyWith(color: Colors.black)),
                      TextButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (_) => const Reviews()));
                        },
                        child: Text(S.of(context).ViewAll),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      SizedBox(
                        height: 500,
                        child: BlocBuilder<ReviewCubit, ReviewStatus>(
                          builder: (context, state) {
                            if (state is ReviewLoading) {
                              return const Center(
                                  child: CircularProgressIndicator());
                            } else if (state is ReviewSuccess) {
                              final rewiews = (state).review;
                              log("${rewiews.length}********////*******");
                              return ListView.builder(
                                itemCount: rewiews.length,
                                itemBuilder: (context, index) {
                                  return ReviewListTile(
                                    listTileTitle: rewiews[index].userName,
                                    listTileSubtitle: rewiews[index].review,
                                    imagePath: rewiews[index].imagePath,
                                    rating: rewiews[index].rate,
                                    dateReview: rewiews[index].date,
                                  );
                                },
                              );
                            } else if (state is ReviewFailure) {
                              return Center(child: Text(state.errorMessage));
                            } else {
                              return Container();
                            }
                          },
                        ),
                      ),
                    ],
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

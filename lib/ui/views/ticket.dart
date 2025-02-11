import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:housemanuser/controller/booking/booking_cubit.dart';
import 'package:housemanuser/controller/booking/booking_states.dart';
import 'package:housemanuser/controller/color_state.dart';
import 'package:housemanuser/generated/l10n.dart';
import 'package:housemanuser/helper/color_helper.dart';
import 'package:housemanuser/helper/text_style_helper.dart';
import 'package:housemanuser/models/booking_model.dart';
import 'package:housemanuser/ui/widget/check_service.dart';
import 'package:housemanuser/ui/widget/drop_down_menu.dart';
import 'package:housemanuser/ui/widget/pending_row.dart';
import 'package:housemanuser/ui/widget/shared_widget/custom_elevated_button.dart';


class Ticket extends StatefulWidget {
  const Ticket({super.key});

  @override
  State<Ticket> createState() => _TicketState();
}

class _TicketState extends State<Ticket> {
  @override
  void initState() {
    context.read<BookingCubit>().getAllBookingList();
    super.initState();
  }

  int selectedBookingId = 0;

  TextEditingController selectedDropmenuController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    // Locale currentLocale = Localizations.localeOf(context);
    return Scaffold(
      // backgroundColor: ColorHelper.background,
      appBar: AppBar(
        title: Text(S.of(context).Houseman,
            style: TextStyleHelper.textStylefontSize19
                .copyWith(color: Colors.white)),
        backgroundColor: ColorHelper.purple,
        actions: [
          Row(
            children: [
              InkWell(
                  onTap: () {},
                  child: const SizedBox(
                      height: 16,
                      width: 16,
                      child:
                          Image(image: AssetImage("assets/images/Chat.png")))),
              const SizedBox(
                width: 10,
              ),
            ],
          )
        ],
        automaticallyImplyLeading: false,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(15.0, 20, 10, 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(S.of(context).BookingList,
                  style: TextStyleHelper.textStylefontSize20),
              const SizedBox(
                height: 25,
              ),
              CustomDropDownMenu(
                controller: selectedDropmenuController,
                onSelectedFunction: (value) {
                  setState(() {
                    selectedBookingId = int.tryParse(value!) ?? -1;
                    log('$selectedBookingId');
                  });
                },
              ),
              const SizedBox(
                height: 15,
              ),
              selectedBookingId == 0
                  ? SizedBox(
                      height: 500,
                      child: BlocBuilder<BookingCubit, BookingStatus>(
                        builder: (context, state) {
                          if (state is BookingLoading) {
                            return const Center(
                                child: CircularProgressIndicator());
                          } else if (state is Bookingloaded) {
                            final booking = (state).bookingList;
                            log('${booking.length}');
                            return ListView.builder(
                              itemCount: booking.length,
                              itemBuilder: (context, index) {
                                if (booking[index].state_en ==
                                        S.of(context).Pending ||
                                    booking[index].state_ar ==
                                        S.of(context).Pending) {
                                  return PendingColumnDetails(
                                    bookingList: booking,
                                    index: index,
                                    selectedBookingId: selectedBookingId,
                                  );
                                }
                                return null;
                              },
                            );
                          } else if (state is BookingFailure) {
                            return Center(child: Text(state.errorMessage));
                          } else {
                            return Container();
                          }
                        },
                      ),
                    )
                  : SizedBox(
                      height: 500,
                      child: BlocBuilder<BookingCubit, BookingStatus>(
                        builder: (context, state) {
                          if (state is BookingLoading) {
                            return const Center(
                                child: CircularProgressIndicator());
                          } else if (state is Bookingloaded) {
                            final booking = (state).bookingList;
                            return ListView.builder(
                              itemCount: booking.length,
                              itemBuilder: (context, index) {
                                return PendingColumnDetails(
                                  bookingList: booking,
                                  index: index,
                                  selectedBookingId: selectedBookingId,
                                );
                              },
                            );
                          } else if (state is BookingFailure) {
                            return Center(child: Text(state.errorMessage));
                          } else {
                            return Container();
                          }
                        },
                      ),
                    )
            ],
          ),
        ),
      ),
    );
  }
}

// ignore: must_be_immutable
class PendingColumnDetails extends StatelessWidget {
  PendingColumnDetails({
    required this.bookingList,
    required this.index,
    required this.selectedBookingId,
    super.key,
  });
  List<BookingModel> bookingList;
  int index;

  int selectedBookingId;

  @override
  Widget build(BuildContext context) {
    Locale currentLocale = Localizations.localeOf(context);
    final stateColor =
        StateColorFactory.getStateColor(bookingList[index].state_en).getColor();
    return Column(children: [
      InkWell(
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (_) => CheckServiceStatus(
                        booking: bookingList[index],
                      )));
        },
        child: Container(
          alignment: Alignment.center,
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
          width: MediaQuery.of(context).size.width,
          child: selectedBookingId == 0
              ? Image(
                  width: MediaQuery.of(context).size.width,
                  image: NetworkImage(
                    bookingList[index].imagePath,
                  ),
                )
              : Stack(
                  children: [
                    Image(
                      image: NetworkImage(
                        bookingList[index].imagePath,
                      ),
                    ),
                    Positioned(
                        left: 20,
                        top: 10,
                        child: Container(
                          alignment: Alignment.center,
                          width: 70,
                          height: 30,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              color: stateColor),
                          child: Text(
                              currentLocale.languageCode == 'ar'
                                  ? bookingList[index].state_ar
                                  : bookingList[index].state_en,
                              style: TextStyleHelper.textStylefontSize14),
                        ))
                  ],
                ),
        ),
      ),
      const SizedBox(
        height: 20,
      ),
      Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                currentLocale.languageCode == 'ar'
                    ? bookingList[index].textBooking_ar
                    : bookingList[index].textBooking_en,
                style: TextStyleHelper.textStylefontSize20
                    .copyWith(color: Colors.black),
              ),
              Container(
                alignment: Alignment.center,
                height: 25,
                width: 50,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: ColorHelper.purple),
                child: Text(
                  bookingList[index].bookingId,
                  style: TextStyleHelper.textStylefontSize12
                      .copyWith(color: Colors.white),
                ),
              )
            ],
          ),
          const SizedBox(
            height: 25,
          ),
          Row(
            children: [
              Text(
                '\$${bookingList[index].price}',
                style: TextStyleHelper.textStylefontSize24.copyWith(
                    color: ColorHelper.purple, fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                width: 8,
              ),
              Text(
                '${bookingList[index].offer}',
                style: TextStyleHelper.textStylefontSize14
                    .copyWith(color: Colors.green, fontWeight: FontWeight.bold),
              ),
            ],
          ),
          const SizedBox(
            height: 25,
          ),
          PendingRowInfo(
            imagePath: "assets/images/Location.png",
            rowText: bookingList[index].houseLocation,
          ),
          const SizedBox(
            height: 10,
          ),
          PendingRowInfo(
            imagePath: "assets/images/Calendar.png",
            rowText: '${bookingList[index].date}at ${bookingList[index].time}',
          ),
          const SizedBox(
            height: 10,
          ),
          PendingRowInfo(
            imagePath: "assets/images/Profile1.png",
            rowText: bookingList[index].customer.customerName,
          ),
          const SizedBox(
            height: 25,
          ),
          Row(
            children: [
              Expanded(
                child: CustomElevatedButton(
                    buttonText: S.of(context).Accept,
                    onPressedFunction: () {},
                    backColor: ColorHelper.purple,
                    fontColor: Colors.white),
              ),
              const SizedBox(
                width: 8,
              ),
              Expanded(
                child: CustomElevatedButton(
                    buttonText: S.of(context).Decline,
                    onPressedFunction: () {},
                    backColor: const Color.fromARGB(255, 228, 227, 227),
                    fontColor: Colors.black),
              )
            ],
          ),
          const SizedBox(
            height: 40,
          ),
        ],
      )
    ]);
  }
}

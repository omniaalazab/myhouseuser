import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:housemanuser/controller/booking/booking_cubit.dart';
import 'package:housemanuser/controller/booking/booking_states.dart';
import 'package:housemanuser/generated/l10n.dart';
import 'package:housemanuser/helper/color_helper.dart';
import 'package:housemanuser/helper/text_style_helper.dart';


class EarningList extends StatelessWidget {
  const EarningList({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
        title: Text(S.of(context).EarningList,
            style: TextStyleHelper.textStylefontSize20
                .copyWith(fontWeight: FontWeight.bold, color: Colors.white)),
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(20, 40, 20, 20),
        child: SizedBox(
          height: 700,
          child: BlocBuilder<BookingCubit, BookingStatus>(
            builder: (context, state) {
              if (state is BookingLoading) {
                return const Center(child: CircularProgressIndicator());
              } else if (state is Bookingloaded) {
                final booking = (state).bookingList;
                return ListView.builder(
                  itemCount: booking.length,
                  itemBuilder: (context, index) {
                    return Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(S.of(context).PaymentMethod,
                                style: TextStyleHelper.textStylefontSize16),
                            Text(booking[index].payment.method,
                                style: TextStyleHelper.textStylefontSize16),
                          ],
                        ),
                        Text(
                            booking[index]
                                .history
                                .acceptedbooking
                                .description_en!,
                            style: TextStyleHelper.textStylefontSize16
                                .copyWith(color: ColorHelper.purple)),
                        Card(
                          color: ColorHelper.darkgrey.withOpacity(.1),
                          child: Padding(
                            padding: const EdgeInsets.all(13.0),
                            child: Column(
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(S.of(context).amount,
                                        style: TextStyleHelper
                                            .textStylefontSize16),
                                    Text(
                                      '${booking[index].payment.amount}',
                                      style: TextStyleHelper.textStylefontSize16
                                          .copyWith(color: ColorHelper.purple),
                                    ),
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(S.of(context).date,
                                        style: TextStyleHelper
                                            .textStylefontSize16),
                                    Text(
                                      '${booking[index].history.acceptedbooking.dateTime}',
                                      style: TextStyleHelper.textStylefontSize16
                                          .copyWith(color: ColorHelper.purple),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
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
        ),
      ),
    );
  }
}

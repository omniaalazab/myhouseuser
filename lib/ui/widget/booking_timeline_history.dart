import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:housemanuser/controller/booking/booking_cubit.dart';
import 'package:housemanuser/controller/booking/booking_states.dart';
import 'package:housemanuser/generated/l10n.dart';
import 'package:housemanuser/helper/color_helper.dart';
import 'package:housemanuser/helper/text_style_helper.dart';
import 'package:housemanuser/ui/widget/booking_history_indicator.dart';



@immutable
class BookingHistoryTimeline extends StatelessWidget {
 const BookingHistoryTimeline({
    super.key,
    required this.bookingId,
  });
 final String bookingId;

  @override

  // final List<BookingHistory> bookingHistory = [
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15),
      child: SizedBox(
        height: 350,
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(S.of(context).BookingHistory,
                    style: TextStyleHelper.textStylefontSize18),
                Text(bookingId,
                    style: TextStyleHelper.textStylefontSize16.copyWith(
                        color: ColorHelper.purple,
                        fontWeight: FontWeight.bold)),
              ],
            ),
            SizedBox(
              height: 300,
              child: BlocBuilder<BookingCubit, BookingStatus>(
                builder: (context, state) {
                  if (state is BookingLoading) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (state is Bookingloaded) {
                    final booking = (state).bookingList;

                    return ListView(children: [
                      BookingHistoryEntryWidget(
                        bookingList: booking,
                        index: 0,
                      ),
                    ]);

                    // ListView.builder(
                    //   itemCount: booking.length,
                    //   itemBuilder: (context, index) {
                    //     if (booking[index].bookingId == bookingId) {
                    //       return BookingHistoryEntryWidget(
                    //         bookingList: booking,
                    //         index: index,
                    //       );
                    //     }
                    //     return null;
                    //   },
                    // );
                  } else if (state is BookingFailure) {
                    return Center(child: Text(state.errorMessage));
                  } else {
                    return Container();
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

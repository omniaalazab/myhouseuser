import 'package:flutter/material.dart';


import '../../models/booking_model.dart';
@immutable
class BookingHistoryEntryWidget extends StatelessWidget {
 final List<BookingModel> bookingList;
 final int index;

const BookingHistoryEntryWidget({
    super.key,
    required this.index,
    required this.bookingList,
  });

  @override
  Widget build(BuildContext context) {
    Locale currentLocale = Localizations.localeOf(context);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Column(
        children: [
          BookingHistoryIndicator(
            bookingList: bookingList,
            textTime: (bookingList[index].history.newbooking.dateTime == null)
                ? ""
                : "${bookingList[index].history.newbooking.dateTime!.hour}:${bookingList[index].history.newbooking.dateTime!.minute} ",
            textDate: (bookingList[index].history.newbooking.dateTime == null)
                ? ""
                : "${bookingList[index].history.newbooking.dateTime!.day} /${bookingList[index].history.newbooking.dateTime!.month} /${bookingList[index].history.newbooking.dateTime!.year}",
            textDescription: (currentLocale.languageCode == 'ar'
                    ? bookingList[index].history.newbooking.description_ar
                    : bookingList[index].history.newbooking.description_en) ??
                "",
            textTitle: (currentLocale.languageCode == 'ar'
                    ? bookingList[index].history.newbooking.title_ar
                    : bookingList[index].history.newbooking.title_en) ??
                "",
            color: Colors.red,
          ),
          BookingHistoryIndicator(
            bookingList: bookingList,
            textTime: (bookingList[index].history.acceptedbooking.dateTime ==
                    null)
                ? ""
                : "${bookingList[index].history.acceptedbooking.dateTime!.hour}:${bookingList[index].history.acceptedbooking.dateTime!.minute} ",
            textDate: (bookingList[index].history.acceptedbooking.dateTime ==
                    null)
                ? ""
                : "${bookingList[index].history.acceptedbooking.dateTime!.day}/ ${bookingList[index].history.acceptedbooking.dateTime!.month}/ ${bookingList[index].history.acceptedbooking.dateTime!.year}",
            textDescription: (currentLocale.languageCode == 'ar'
                    ? bookingList[index].history.acceptedbooking.description_ar
                    : bookingList[index]
                        .history
                        .acceptedbooking
                        .description_en) ??
                "",
            textTitle: (currentLocale.languageCode == 'ar'
                    ? bookingList[index].history.acceptedbooking.title_ar
                    : bookingList[index].history.acceptedbooking.title_en) ??
                "",
            color: Colors.blue,
          ),
          BookingHistoryIndicator(
            bookingList: bookingList,
            textTime: (bookingList[index].history.assignedbooking.dateTime ==
                    null)
                ? ""
                : "${bookingList[index].history.assignedbooking.dateTime!.hour}:${bookingList[index].history.assignedbooking.dateTime!.minute} ",
            textDate: (bookingList[index].history.assignedbooking.dateTime ==
                    null)
                ? ""
                : "${bookingList[index].history.assignedbooking.dateTime!.day}/ ${bookingList[index].history.assignedbooking.dateTime!.month} /${bookingList[index].history.assignedbooking.dateTime!.year}",
            textDescription: (currentLocale.languageCode == 'ar'
                    ? bookingList[index].history.assignedbooking.description_ar
                    : bookingList[index]
                        .history
                        .assignedbooking
                        .description_en) ??
                "",
            textTitle: (currentLocale.languageCode == 'ar'
                    ? bookingList[index].history.assignedbooking.title_ar
                    : bookingList[index].history.assignedbooking.title_en) ??
                "",
            color: Colors.orange,
          ),
        ],
      ),
    );
  }
}

// ignore: must_be_immutable
class BookingHistoryIndicator extends StatelessWidget {
  BookingHistoryIndicator({
    super.key,
    required this.bookingList,
    // required this.index,
    required this.textTime,
    required this.textDate,
    required this.textTitle,
    required this.textDescription,
    required this.color,
  });

  final List<BookingModel> bookingList;
  // final int index;
  String textTime;
  String textDate;
  String textTitle;
  String textDescription;
  Color color;
  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Column(
          children: [
            const SizedBox(
              height: 30,
            ),
            Text(
              textTime,
              style: const TextStyle(fontSize: 12, color: Colors.grey),
            ),
            Text(
              textDate,
              style: const TextStyle(fontSize: 12, color: Colors.grey),
            ),
          ],
        ),
        Column(
          children: [
            const SizedBox(
              height: 30,
            ),
            Container(
              width: 12,
              height: 12,
              decoration: BoxDecoration(
                color: color,
                shape: BoxShape.circle,
              ),
            ),
            Container(
              width: 2,
              height: 50,
              color: Colors.grey.shade400,
            ),
          ],
        ),
        const SizedBox(width: 10),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 30,
              ),
              const SizedBox(height: 4),
              Text(
                textTitle,
                style:
                    const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 4),
              Text(
                textDescription,
                style: TextStyle(fontSize: 14, color: Colors.grey.shade600),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:housemanuser/controller/booking/booking_cubit.dart';

import 'package:housemanuser/generated/l10n.dart';
import 'package:housemanuser/helper/color_helper.dart';
import 'package:housemanuser/helper/text_style_helper.dart';
import 'package:housemanuser/models/booking_model.dart';
import 'package:housemanuser/models/customer_model.dart';
import 'package:housemanuser/models/history_model.dart';
import 'package:housemanuser/models/houseman_model.dart';
import 'package:housemanuser/models/payment_model.dart';

import 'package:housemanuser/ui/widget/count_container.dart';
import 'package:housemanuser/ui/widget/custom_row.dart';
import 'package:housemanuser/ui/widget/shared_widget/custom_elevated_button.dart';
import 'package:housemanuser/ui/widget/shared_widget/dialog.dart';

@immutable
class AddBooking2 extends StatefulWidget {
  const AddBooking2(
      {super.key,
      required this.addressController,
      required this.dateController,
      required this.price,
      required this.imagePath,
      required this.serviceName});
  final String imagePath;
  final String serviceName;
  final double price;
  final TextEditingController dateController;
  final TextEditingController addressController;

  @override
  State<AddBooking2> createState() => _AddBooking2State();
}

class _AddBooking2State extends State<AddBooking2> {
  double countQuantity = 1;
  double total = 0;

  void onQuantityChanged(double quantity) {
    setState(() {
      countQuantity = quantity;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(S.of(context).BookService,
            style: TextStyleHelper.textStylefontSize16
                .copyWith(color: Colors.white)),
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
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(15, 20, 15, 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Column(
                  children: [
                    CircleAvatar(
                      child: Icon(Icons.check, color: ColorHelper.purple),
                    ),
                    Text(S.of(context).Step1,
                        style: TextStyleHelper.textStylefontSize15),
                  ],
                ),
                Column(
                  children: [
                    CircleAvatar(
                      backgroundColor: ColorHelper.purple,
                      child: Text(
                        "02",
                        style: TextStyleHelper.textStylefontSize14
                            .copyWith(color: Colors.white),
                      ),
                    ),
                    Text(S.of(context).Step2,
                        style: TextStyleHelper.textStylefontSize15),
                  ],
                )
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Card(
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: Row(
                    children: [
                      Column(
                        children: [
                          Row(
                            children: [
                              Text(
                                widget.serviceName,
                                style: TextStyleHelper.textStylefontSize18
                                    .copyWith(fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 50,
                            width: MediaQuery.of(context).size.width * .3,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                InkWell(
                                    onTap: () {
                                      setState(() {
                                        countQuantity = countQuantity + 1;
                                        onQuantityChanged(countQuantity);
                                      });
                                    },
                                    child:
                                        const CountContainer(countSign: "+")),
                                const SizedBox(
                                  width: 10,
                                ),
                                Text(
                                  '$countQuantity',
                                  style: TextStyleHelper.textStylefontSize14,
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                InkWell(
                                    onTap: () {
                                      //   widget.onDecrease;
                                      // },
                                      // {
                                      if (countQuantity <= 1) {
                                        countQuantity = 1;
                                      } else {
                                        setState(() {
                                          countQuantity = countQuantity - 1;
                                          onQuantityChanged(countQuantity);
                                        });
                                      }
                                    },
                                    child:
                                        const CountContainer(countSign: "-")),
                              ],
                            ),
                          )
                        ],
                      ),
                      Column(
                        children: [
                          Image(
                              height: 80,
                              width: 130,
                              image: NetworkImage(
                                widget.imagePath,
                              ))
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
            Text(S.of(context).PriceDetail,
                style: TextStyleHelper.textStylefontSize16),
            const SizedBox(
              height: 20,
            ),
            Column(
              children: [
                PaymentRow(
                  bookingId: "${widget.price}",
                  paymentRowText: S.of(context).Price,
                  rowColor: ColorHelper.darkgrey,
                ),
                const SizedBox(
                  height: 10,
                ),
                PaymentRow(
                  bookingId: "${widget.price * countQuantity}",
                  paymentRowText: S.of(context).Subtotal,
                  rowColor: ColorHelper.darkgrey,
                ),
                const SizedBox(
                  height: 10,
                ),
                PaymentRow(
                  bookingId: "-10%",
                  paymentRowText: S.of(context).Discount,
                  rowColor: ColorHelper.darkgrey,
                ),
                const SizedBox(
                  height: 10,
                ),
                PaymentRow(
                  bookingId: "15",
                  paymentRowText: S.of(context).Taxes,
                  rowColor: ColorHelper.darkgrey,
                ),
                const SizedBox(
                  height: 10,
                ),
                PaymentRow(
                  bookingId:
                      "${((widget.price * countQuantity) + 15) * 10 / 100}",
                  paymentRowText: S.of(context).TotalAmount,
                  rowColor: ColorHelper.darkgrey,
                ),
              ],
            ),
            const SizedBox(
              height: 50,
            ),
            Row(
              children: [
                Expanded(
                    child: CustomElevatedButton(
                        buttonText: S.of(context).Booking,
                        onPressedFunction: () {
                          context.read<BookingCubit>().addBooking(
                                BookingModel(
                                    bookingId: "#432",
                                    date: "14 march 2023",
                                    price: widget.price,
                                    imagePath: widget.imagePath,
                                    offer: 10,
                                    textBooking_ar: widget.serviceName,
                                    textBooking_en: widget.serviceName,
                                    state_ar: "معلق",
                                    state_en: "Pending",
                                    time: "11 pm",
                                    houseLocation:
                                        widget.addressController.text,
                                    history: BookingHistory(
                                        acceptedbooking: Acceptedbooking(
                                            title_en: "Accepted booking",
                                            title_ar: "قبول الحجز",
                                            description_en:
                                                "Status changed From pending to accept",
                                            description_ar:
                                                "م تغيير الحالة من معلق إلى مقبول",
                                            dateTime: DateTime.now()),
                                        assignedbooking: AssignedBooking(
                                            title_en: "Assigned Booking",
                                            title_ar: "الحجز المخصص",
                                            description_en:
                                                "Booking has assigned to Naomie Hackett",
                                            description_ar:
                                                "تم تخصيص الحجز لناعومي هاكيت",
                                            dateTime: DateTime.now()),
                                        newbooking: Newbooking(
                                            title_en: "حجز جديد",
                                            title_ar: "new booking",
                                            description_en:
                                                "New Booking Added by customer ",
                                            description_ar:
                                                "حجز جديد ضأافه العميل",
                                            dateTime: DateTime.now())),
                                    houseman: HousemanModel(
                                        imagePath:
                                            "https://img.freepik.com/free-photo/young-bearded-man-with-striped-shirt_273609-5677.jpg",
                                        name: "Walid",
                                        rate: 4.5,
                                        address: "Mansoura",
                                        housemanMail: "Walid.gmail.com",
                                        housemanPhone: "0108855036"),
                                    payment: PaymentModel(
                                        method: "cash",
                                        amount: countQuantity,
                                        discount: 10,
                                        subtotal: widget.price * countQuantity,
                                        coupon: "#5547",
                                        paymentStatus: "Pending",
                                        totalAmount:
                                            ((widget.price * countQuantity) +
                                                    15) *
                                                10 /
                                                100,
                                        rate: 4.5),
                                    customer: CustomerModel(
                                        customerName: "Aliaa",
                                        customerMail: "Aliaa.gmail.com",
                                        customerLocation: "Mansoura",
                                        customerImagePath:
                                            "https://img.freepik.com/free-photo/human-face-expressions-emotions-positive-joyful-young-beautiful-female-with-fair-straight-hair-casual-clothing_176420-15188.jpg")),
                              );
                          CreateDialogToaster.showErrorDialogDefult(
                              S.of(context).ConfirmBooking,
                              S
                                  .of(context)
                                  .Areyousureyouwanttoconfirmthebooking,
                              context);
                        },
                        backColor: ColorHelper.purple,
                        fontColor: Colors.white)),
                Expanded(
                    child: CustomElevatedButton(
                        buttonText: S.of(context).CancleBooking,
                        onPressedFunction: () {
                          Navigator.pop(context);
                        },
                        backColor: const Color.fromARGB(255, 226, 221, 221),
                        fontColor: Colors.black))
              ],
            )
          ],
        ),
      ),
    );
  }
}

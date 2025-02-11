import 'package:flutter/material.dart';
import 'package:housemanuser/controller/adddate_function.dart';
import 'package:housemanuser/controller/check_empty_text_feild.dart';
import 'package:housemanuser/generated/l10n.dart';
import 'package:housemanuser/helper/color_helper.dart';
import 'package:housemanuser/helper/text_style_helper.dart';
import 'package:housemanuser/ui/views/add_booking2.dart';
import 'package:housemanuser/ui/widget/shared_widget/custom_elevated_button.dart';
import 'package:housemanuser/ui/widget/shared_widget/text_field.dart';
@immutable
class AddBooking extends StatefulWidget {

const  AddBooking(
      {super.key,
      required this.imagePath,
      required this.price,
      required this.serviceName});
 final String imagePath;
final  String serviceName;
 final double price;
  @override
  State<AddBooking> createState() => _AddBookingState();
}

class _AddBookingState extends State<AddBooking> {
  TextEditingController dateController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  @override
  void dispose() {
    dateController.dispose();
    super.dispose();
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
      body: SingleChildScrollView(
        child: Padding(
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
                        backgroundColor: ColorHelper.purple,
                        child: Text(
                          "01",
                          style: TextStyleHelper.textStylefontSize14
                              .copyWith(color: Colors.white),
                        ),
                      ),
                      Text(S.of(context).Step1,
                          style: TextStyleHelper.textStylefontSize15),
                    ],
                  ),
                  Column(
                    children: [
                      CircleAvatar(
                        backgroundColor: ColorHelper.darkgrey,
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
              Text(
                S.of(context).EnterDetailInformation,
                style: TextStyleHelper.textStylefontSize14
                    .copyWith(fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 20,
              ),
              Text(S.of(context).DateAndTime,
                  style: TextStyleHelper.textStylefontSize16),
              const SizedBox(
                height: 10,
              ),
              TextFormField(
                controller: dateController,
                readOnly: true,
                decoration: InputDecoration(
                  labelText: S.of(context).DateAndTime,
                  suffixIcon: const Icon
                  (Icons.calendar_today),
                ),
                validator: (value) {
                  CheckEmptyValidationTextField.checkIsEmpty(value);
                  return null;
                },
                onTap: () =>
                    AddDateAndTime.selectDateTime(context, dateController),
              ),
              const SizedBox(
                height: 20,
              ),
              Text(S.of(context).YourAddress,
                  style: TextStyleHelper.textStylefontSize16),
              CustomTextField(
                  textLabel: S.of(context).YourAddress,
                  textController: addressController,
                  textFieldSuffix: const Icon(Icons.location_on),
                  validatorFunction: (value) {
                    CheckEmptyValidationTextField.checkIsEmpty(value);
                    return null;
                  }),
              const SizedBox(
                height: 50,
              ),
              CustomElevatedButton(
                  buttonText: S.of(context).Next,
                  onPressedFunction: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (_) => AddBooking2(
                                  price: widget.price,
                                  addressController: addressController,
                                  dateController: dateController,
                                  imagePath: widget.imagePath,
                                  serviceName: widget.serviceName,
                                )));
                  },
                  backColor: ColorHelper.purple,
                  fontColor: Colors.white)
            ],
          ),
        ),
      ),
    );
  }
}

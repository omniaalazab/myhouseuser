import 'package:flutter/material.dart';
import 'package:housemanuser/generated/l10n.dart';
import 'package:housemanuser/helper/color_helper.dart';
import 'package:housemanuser/helper/text_style_helper.dart';

class CustomDropDownMenu extends StatelessWidget {
  const CustomDropDownMenu(
      {super.key, required this.controller, required this.onSelectedFunction});
  final void Function(String?)? onSelectedFunction;
  final TextEditingController? controller;

  @override
  Widget build(BuildContext context) {
    String initialSelection = "0";
    return DropdownMenu(
      menuStyle: MenuStyle(
        backgroundColor: WidgetStateProperty.all(Colors.white),
      ),
      dropdownMenuEntries: <DropdownMenuEntry<String>>[
        DropdownMenuEntry(
            style: ButtonStyle(
                textStyle: WidgetStateProperty.all(
                    TextStyleHelper.textStylefontSize13),
                side: const WidgetStatePropertyAll(
                    BorderSide(color: Colors.white)),
                backgroundColor: const WidgetStatePropertyAll(Colors.white)),
            value: "0",
            label: S.of(context).Pending),
        DropdownMenuEntry(
          value: "1",
          label: S.of(context).All,
          style: ButtonStyle(
              textStyle:
                  WidgetStateProperty.all(TextStyleHelper.textStylefontSize13),
              side:
                  const WidgetStatePropertyAll(BorderSide(color: Colors.white)),
              backgroundColor: const WidgetStatePropertyAll(Colors.white)),
        ),
        // DropdownMenuEntry(
        //   value: "2",
        //   label: "Completed",
        //   style: ButtonStyle(
        //       textStyle:
        //           WidgetStateProperty.all(TextStyleHelper.textStylefontSize13),
        //       backgroundColor: const WidgetStatePropertyAll(Colors.white)),
        // ),
      ],
      controller: controller,
      onSelected: onSelectedFunction,
      width: 350,
      enableSearch: true,
      menuHeight: 330,
      textStyle: TextStyleHelper.textStylefontSize13,
      initialSelection: initialSelection,
      // hintText:"Booking list",
      //  Text(
      //   "Booking list",
      //   style: TextStyleHelper.textStylefontSize13.copyWith(
      //     color: ColorHelper.,
      //   ),
      // ),
      trailingIcon: Icon(
        Icons.keyboard_arrow_down_rounded,
        color: ColorHelper.darkgrey,
      ),
      selectedTrailingIcon: Icon(
        Icons.keyboard_arrow_up_rounded,
        color: ColorHelper.darkgrey,
      ),
      inputDecorationTheme: InputDecorationTheme(
          iconColor: Colors.white,
          filled: true,
          fillColor: Colors.white,
          hintStyle: TextStyleHelper.textStylefontSize13.copyWith(
            color: Colors.white,
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(
              // color: ColorHelper.darkgrey.withOpacity(.3),
              width: 1,
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(
              color: ColorHelper.darkgrey.withOpacity(.1),
              width: 1,
            ),
          )),
    );
  }
}

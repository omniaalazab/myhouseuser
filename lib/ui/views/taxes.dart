import 'package:flutter/material.dart';
import 'package:housemanuser/generated/l10n.dart';
import 'package:housemanuser/helper/color_helper.dart';
import 'package:housemanuser/helper/text_style_helper.dart';

class Taxes extends StatelessWidget {
  const Taxes({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(S.of(context).Taxes,
              style: TextStyleHelper.textStylefontSize19
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
          padding: const EdgeInsets.fromLTRB(10, 20, 10, 10),
          child: Column(
            children: [
              Expanded(
                child: ListView.builder(
                    itemCount: 2,
                    itemBuilder: (context, index) {
                      return Card(
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(15.0, 10, 15, 5),
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(S.of(context).TaxName,
                                      style:
                                          TextStyleHelper.textStylefontSize16),
                                  Text("GST",
                                      style:
                                          TextStyleHelper.textStylefontSize14),
                                ],
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(S.of(context).MyTax,
                                      style:
                                          TextStyleHelper.textStylefontSize16),
                                  Text("10 %",
                                      style:
                                          TextStyleHelper.textStylefontSize14),
                                ],
                              ),
                            ],
                          ),
                        ),
                      );
                    }),
              )
            ],
          ),
        ));
  }
}

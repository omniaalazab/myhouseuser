import 'package:flutter/material.dart';
import 'package:housemanuser/helper/color_helper.dart';
import 'package:housemanuser/helper/text_style_helper.dart';
import 'package:housemanuser/models/provider.dart';
import 'package:housemanuser/ui/widget/rating_bar.dart';
@immutable
class ProviderDetails extends StatelessWidget {
 const ProviderDetails({super.key, required this.provider});
 final ProviderModel provider;
  @override
  Widget build(BuildContext context) {
    Locale currentLocale = Localizations.localeOf(context);
    return Scaffold(
        appBar: AppBar(
          title: Text(
              (currentLocale.languageCode == 'ar')
                  ? provider.serviceNameAr
                  : provider.serviceNameEn,
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
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              SizedBox(
                height: 300,
                width: MediaQuery.of(context).size.width,
                child: Stack(children: [
                  ClipRRect(
                    borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(10),
                        topRight: Radius.circular(10)),
                    child: Image.network(
                      provider.serviceImage,
                      height: 300,
                      width: MediaQuery.of(context).size.width,
                      fit: BoxFit.contain,
                    ),
                  ),
                  Positioned(
                      left: 200,
                      bottom: 0,
                      child: Container(
                        alignment: Alignment.center,
                        height: 50,
                        width: 80,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: ColorHelper.purple),
                        child: Text('${provider.price}',
                            style: TextStyleHelper.textStylefontSize14
                                .copyWith(color: Colors.white)),
                      ))
                ]),
              ),
              Row(
                children: [
                  CustomRatingBar(
                    rating: provider.rate,
                  ),
                  Text("${provider.rate}")
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                (currentLocale.languageCode == 'ar')
                    ? provider.serviceDescriptionAr
                    : provider.serviceDescriptionEn,
                style: TextStyleHelper.textStylefontSize16,
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  CircleAvatar(
                    radius: 20,
                    backgroundImage: NetworkImage(provider.providerImage),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  Text(provider.providerName,
                      style: TextStyleHelper.textStylefontSize14)
                ],
              )
            ],
          ),
        ));
  }
}

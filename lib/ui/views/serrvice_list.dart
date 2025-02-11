import 'package:flutter/material.dart';
import 'package:housemanuser/helper/color_helper.dart';
import 'package:housemanuser/helper/text_style_helper.dart';
import 'package:housemanuser/ui/widget/rating_bar.dart';

@immutable
class ServicesList extends StatelessWidget {
  const ServicesList(
      {super.key,
      required this.serviceImagePath,
      required this.rating,
      required this.serviceName,
      required this.housemanName,
      required this.price,
      required this.housemanImagePath,
      required this.onTapFunction});

  final String serviceImagePath;
  final double rating;
  final String serviceName;
  final String housemanImagePath;
  final String housemanName;
  final double price;
  final void Function()? onTapFunction;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.45,
      child: InkWell(
        onTap: onTapFunction,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                ClipRRect(
                  borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(10),
                      topRight: Radius.circular(10)),
                  child: Image.network(
                    serviceImagePath,
                    height: 100,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                  left: 90,
                  bottom: 10,
                  child: Container(
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: ColorHelper.purple,
                    ),
                    padding:
                        const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                    child: Text(
                      "$price",
                      style: TextStyleHelper.textStylefontSize14.copyWith(
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            Row(
              children: [
                CustomRatingBar(rating: rating),
                const SizedBox(width: 5),
                Text("$rating", style: TextStyleHelper.textStylefontSize14),
              ],
            ),
            const SizedBox(height: 5),
            Text(
              serviceName,
              style: TextStyleHelper.textStylefontSize14,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
            const SizedBox(height: 10),
            Row(
              children: [
                CircleAvatar(
                  radius: 20,
                  backgroundImage: NetworkImage(
                    housemanImagePath,
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: Text(
                    housemanName,
                    style: TextStyleHelper.textStylefontSize14,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

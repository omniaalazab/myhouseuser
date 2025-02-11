import 'package:flutter/material.dart';
import 'package:housemanuser/helper/text_style_helper.dart';
import 'package:housemanuser/ui/widget/rating_bar.dart';

@immutable
class ReviewListTile extends StatelessWidget {
   const ReviewListTile({
    super.key,
    required this.imagePath,
    required this.listTileTitle,
    required this.rating,
    required this.dateReview,
    required this.listTileSubtitle,
  
  });
 final String imagePath;
 final String listTileTitle;
 final double rating;
 final String dateReview;
 final String listTileSubtitle;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading:
          CircleAvatar(radius: 35, backgroundImage: NetworkImage(imagePath)),
      title: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(listTileTitle,
              style: TextStyleHelper.textStylefontSize15
                  .copyWith(color: Colors.black)),
          // CustomTextField(
          //     textLabel: "Your comment",
          //     textController: reviewCntroller,
          //     textFieldSuffix:
          //         IconButton(onPressed: () {}, icon: const Icon(Icons.edit)),
          //     validatorFunction: (value) {
          //       return null;
          //     }),
          CustomRatingBar(rating: rating),
        ],
      ),
      subtitle:
          Text(listTileSubtitle, style: TextStyleHelper.textStylefontSize12),
      trailing: Text(dateReview, style: TextStyleHelper.textStylefontSize14),
    );
  }
}

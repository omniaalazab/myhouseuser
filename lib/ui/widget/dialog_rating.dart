import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:housemanuser/controller/rating.dart';

class DialogRating {
  static void showRatingDialog(
      BuildContext context, String houseName, double rate) {
    double currentRating = rate; // Initially set to the existing rating
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Rate houseman'),
          content: RatingBar.builder(
            initialRating: currentRating,
            minRating: 1,
            direction: Axis.horizontal,
            allowHalfRating: true,
            itemCount: 5,
            itemBuilder: (context, _) => const Icon(
              Icons.star,
              color: Colors.amber,
            ),
            onRatingUpdate: (rating) {
              currentRating = rating;
            },
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                context
                    .read<RatingCubit>()
                    .updateRating(houseName, currentRating);

                Navigator.of(context).pop();
              },
              child: const Text('Submit'),
            ),
          ],
        );
      },
    );
  }
}

import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RatingState {
  final double rating;
  final bool isLoading;
  final String? errorMessage;

  RatingState({
    this.rating = 0.0,
    this.isLoading = false,
    this.errorMessage,
  });

  RatingState copyWith({
    double? rating,
    bool? isLoading,
    String? errorMessage,
  }) {
    return RatingState(
      rating: rating ?? this.rating,
      isLoading: isLoading ?? this.isLoading,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }
}

class RatingCubit extends Cubit<RatingState> {
  RatingCubit() : super(RatingState());

  Future<void> updateRating(String name, double rating) async {
    emit(state.copyWith(isLoading: true));
    try {
      final querySnapshot = await FirebaseFirestore.instance
          .collection('booking')
          .where('name', isEqualTo: name)
          .get();
      if (querySnapshot.docs.isNotEmpty) {
        final docId = querySnapshot.docs.first.id;
        await FirebaseFirestore.instance
            .collection('houseman')
            .doc(docId)
            .update({'rate': rating});
        emit(state.copyWith(rating: rating, isLoading: false));
        log('Rating updated to $rating');
      } else {
        emit(state.copyWith(
            isLoading: false,
            errorMessage: 'No document found with name $name'));
        log('No document found with name $name');
      }
    } catch (error) {
      emit(state.copyWith(isLoading: false, errorMessage: error.toString()));
      log('Failed to update rating: $error');
    }
  }
}

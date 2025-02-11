import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:housemanuser/controller/reviews/review_state.dart';
import 'package:housemanuser/models/review.dart';

class ReviewCubit extends Cubit<ReviewStatus> {
  ReviewCubit() : super(ReviewInitial());
  List<ReviewsModel> review = [];
  Future<void> getAllReview() async {
    emit(ReviewLoading());
    try {
      final queryReview =
          await FirebaseFirestore.instance.collection('reviews').get();
      review = queryReview.docs
          .map((doc) => ReviewsModel.fromSnapshot(doc))
          .toList();
      emit(ReviewSuccess(review));
    } catch (e) {
      emit(ReviewFailure(e.toString()));
    }
  }

  Future<void> updateHousemanRate(double rate, String housemanName) async {
    emit(ReviewLoading());
    try {
      QuerySnapshot querySnapshot = await FirebaseFirestore.instance
          .collection('houseman')
          .where(
            "name",
            isEqualTo: housemanName,
          )
          .get();
      if (querySnapshot.docs.isNotEmpty) {
        DocumentReference documentReference =
            querySnapshot.docs.first.reference;
        await documentReference.update({'rate': rate});
        //  emit(ReviewSuccess(review))
      }
    } catch (e) {
      emit(ReviewFailure(e.toString()));
    }
  }
}

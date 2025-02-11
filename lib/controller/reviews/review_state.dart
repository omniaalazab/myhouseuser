import 'package:housemanuser/models/review.dart';

class ReviewStatus {}

class ReviewInitial extends ReviewStatus {}

class ReviewLoading extends ReviewStatus {}

class ReviewSuccess extends ReviewStatus {
  final List<ReviewsModel> review;
  ReviewSuccess(this.review);
}

class ReviewFailure extends ReviewStatus {
  final String errorMessage;

  ReviewFailure(this.errorMessage);
}

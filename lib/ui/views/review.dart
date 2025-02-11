import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:housemanuser/controller/reviews/review_cubit.dart';
import 'package:housemanuser/controller/reviews/review_state.dart';
import 'package:housemanuser/generated/l10n.dart';
import 'package:housemanuser/helper/color_helper.dart';
import 'package:housemanuser/helper/text_style_helper.dart';
import 'package:housemanuser/ui/widget/review_listtile.dart';

class Reviews extends StatelessWidget {
  const Reviews({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: ColorHelper.background,
      appBar: AppBar(
        title: Text(S.of(context).ReviewOnServices,
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
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: SizedBox(
            height: 700,
            child: BlocBuilder<ReviewCubit, ReviewStatus>(
              builder: (context, state) {
                if (state is ReviewLoading) {
                  return const Center(child: CircularProgressIndicator());
                } else if (state is ReviewSuccess) {
                  final rewiews = (state).review;
                  return ListView.builder(
                    itemCount: rewiews.length,
                    itemBuilder: (context, index) {
                      return ReviewListTile(
                        listTileTitle: rewiews[index].userName,
                        listTileSubtitle: rewiews[index].review,
                        imagePath: rewiews[index].imagePath,
                        rating: rewiews[index].rate,
                        dateReview: rewiews[index].date,
                      );
                    },
                  );
                } else if (state is ReviewFailure) {
                  return Center(child: Text(state.errorMessage));
                } else {
                  return Container();
                }
              },
            ),
          ),
        ),
      ),
    );
  }
}

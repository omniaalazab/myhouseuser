import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:housemanuser/controller/houseman/houseman_cubit.dart';
import 'package:housemanuser/controller/houseman/houseman_state.dart';
import 'package:housemanuser/generated/l10n.dart';
import 'package:housemanuser/helper/color_helper.dart';
import 'package:housemanuser/helper/text_style_helper.dart';
import 'package:housemanuser/ui/views/add_houseman.dart';
import 'package:housemanuser/ui/widget/houseman_row_detail.dart';
import 'package:housemanuser/ui/widget/shared_widget/custom_elevated_button.dart';

class HousemanList extends StatelessWidget {
  const HousemanList({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(S.of(context).Houseman,
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
        actions: [
          IconButton(
              onPressed: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (_) => AddHouseman()));
              },
              icon: const Icon(Icons.add, color: Colors.white))
        ],
      ),
      body: BlocBuilder<HousemanCubit, HousemanStatus>(
        builder: (context, state) {
          if (state is HousemanLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is Housemanloaded) {
            final houseman = state.housemanList;
            return ListView.builder(
              shrinkWrap: true,
              itemCount: houseman.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SizedBox(
                    height: 200,
                    child: Row(
                      children: [
                        CircleAvatar(
                          radius: 35,
                          backgroundImage: NetworkImage(houseman[index]
                                  .imagePath 
                        //           ??
                        //       "https://static.vecteezy.com/system/resources/thumbnails/031/569/297/small/a-positive-young-man-with-a-beard-wearing-a-casual-sweater-and-glasses-png.png"),
                         ) ),
                        const SizedBox(width: 10),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Text(houseman[index].name,
                                  style: TextStyleHelper.textStylefontSize16
                                      .copyWith(fontWeight: FontWeight.bold)),
                              HousemanRowDetails(
                                imagePath: "assets/images/Message.png",
                                housemanDetail:
                                    houseman[index].housemanMail ,
                              ),
                              HousemanRowDetails(
                                imagePath: "assets/images/Location.png",
                                housemanDetail: houseman[index].address ,
                              ),
                              HousemanRowDetails(
                                imagePath: "assets/images/Calling.png",
                                housemanDetail:
                                    houseman[index].housemanPhone ,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Expanded(
                                    child: CustomElevatedButton(
                                        buttonText: S.of(context).Activate,
                                        onPressedFunction: () {},
                                        backColor: ColorHelper.purple,
                                        fontColor: Colors.white),
                                  ),
                                  const SizedBox(
                                      width: 10), // Spacing between buttons
                                  Expanded(
                                    child: CustomElevatedButton(
                                        buttonText: S.of(context).Deactivate,
                                        onPressedFunction: () {},
                                        backColor: ColorHelper.purple,
                                        fontColor: Colors.white),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            );
          } else if (state is HousemanFailure) {
            return Center(child: Text(state.errorMessage));
          } else {
            return Container();
          }
        },
      ),
    );
  }
}

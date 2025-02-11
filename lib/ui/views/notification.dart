import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:housemanuser/controller/notification/notification_cubit.dart';
import 'package:housemanuser/controller/notification/notification_status.dart';
import 'package:housemanuser/generated/l10n.dart';
import 'package:housemanuser/helper/color_helper.dart';
import 'package:housemanuser/helper/text_style_helper.dart';
import 'package:housemanuser/ui/views/notification_details.dart';

class NotificationPage extends StatefulWidget {
  const NotificationPage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _NotificationPageState createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> {
  @override
  void initState() {
    context.read<NotificationCubit>().initialize();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
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
          title: Text(S.of(context).Notification,
              style: TextStyleHelper.textStylefontSize20
                  .copyWith(fontWeight: FontWeight.bold, color: Colors.white)),
        ),
        body: BlocBuilder<NotificationCubit, NotificationState>(
            builder: (context, state) {
          if (state.notificationModel.isEmpty) {
            return Center(
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset('assets/images/bell.png'),
                    Text(
                      S.of(context).NoNotificationyet,
                      style: TextStyleHelper.textStylefontSize20
                          .copyWith(fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      height: 70,
                    ),
                  ]),
            );
          } else {
            return Center(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(8, 10, 8, 10),
                child: Column(
                  children: [
                    const SizedBox(
                      height: 50,
                    ),
                    Expanded(
                      child: ListView.builder(
                        itemCount: state.notificationModel.length,
                        itemBuilder: (context, index) {
                          final notificationModel =
                              state.notificationModel[index];
                          DateTime now = DateTime.now();
                          Duration difference =
                              now.difference(notificationModel.date!);
                          int minutesAgo = difference.inMinutes;
                          return Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Container(
                              width: 120,
                              decoration: BoxDecoration(
                                  color:
                                      const Color.fromARGB(255, 209, 209, 209),
                                  borderRadius: BorderRadius.circular(20)),
                              child: ListTile(
                                leading: Image(
                                    width: 90,
                                    image: NetworkImage(
                                        notificationModel.imagePath!)),
                                title: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      '${notificationModel.title} ',
                                      style:
                                          TextStyleHelper.textStylefontSize14,
                                    ),
                                    Expanded(
                                      child: Text(
                                        S.of(context).minago(minutesAgo),
                                        style:
                                            TextStyleHelper.textStylefontSize15,
                                      ),
                                    ),
                                  ],
                                ),
                                subtitle: Text('${notificationModel.body} '),
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          NotificationDetailPage(
                                        notification: notificationModel,
                                      ),
                                    ),
                                  );
                                  const SizedBox(
                                    height: 40,
                                  );
                                },
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            );
          }
        }));
  }
}

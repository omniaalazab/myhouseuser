import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:housemanuser/controller/notification/notification_status.dart';
import 'package:housemanuser/models/notification.dart';

class NotificationCubit extends Cubit<NotificationState> {
  NotificationCubit() : super(NotificationState(notificationModel: []));

  void initialize() {
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      if (message.notification != null) {
        final notifications =
            List<NotificationModel>.from(state.notificationModel);
        notifications.add(
          NotificationModel(
            title: message.notification!.title ?? 'No Title',
            body: message.notification!.body ?? 'No Body',
            date: message.sentTime,
            imagePath: message.data['image'] ??
                'https://img.freepik.com/free-photo/young-beautiful-woman-pink-warm-sweater-natural-look-smiling-portrait-isolated-long-hair_285396-896.jpg?size=626&ext=jpg&ga=GA1.1.2008272138.1723075200&semt=ais_hybrid',
          ),
        );
        emit(NotificationState(notificationModel: notifications));
      }
    });
    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
      if (message.notification != null) {
        final notifications =
            List<NotificationModel>.from(state.notificationModel);
        notifications.add(
          NotificationModel(
            title: message.notification!.title ?? 'No Title',
            body: message.notification!.body ?? 'No Body',
            date: message.sentTime,
            imagePath: message.data['image'] ??
                'https://img.freepik.com/free-photo/young-beautiful-woman-pink-warm-sweater-natural-look-smiling-portrait-isolated-long-hair_285396-896.jpg?size=626&ext=jpg&ga=GA1.1.2008272138.1723075200&semt=ais_hybrid',
          ),
        );
        emit(NotificationState(notificationModel: notifications));
      }
    });
  }
}

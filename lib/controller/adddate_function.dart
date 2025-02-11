import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class AddDateAndTime {
  static Future<void> selectDateTime(
      var context, TextEditingController datecontroller) async {

    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );

    if (pickedDate != null) {
    
      final TimeOfDay? pickedTime = await showTimePicker(
        context: context,
        initialTime: TimeOfDay.now(),
      );

      if (pickedTime != null) {
        final DateTime fullDateTime = DateTime(
          pickedDate.year,
          pickedDate.month,
          pickedDate.day,
          pickedTime.hour,
          pickedTime.minute,
        );

       
        final String formattedDateTime =
            DateFormat('yyyy-MM-dd HH:mm').format(fullDateTime);
        datecontroller.text = formattedDateTime;
      }
    }
  }
}

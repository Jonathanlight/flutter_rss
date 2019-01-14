import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DateConverter {
  String converterDate(String string) {
    String il = "il y a ";
    String format = "EEE, dd MMM yyyy HH:mm:ss Z";
    var formatter = DateFormat(format);

    DateTime dateTime = formatter.parse(string);
    if (dateTime == null) {
      return "Date not found";
    } else {
      var difference = new DateTime.now().difference(dateTime);
      var jours = difference.inDays;
      var heures = difference.inHours;
      var minutes = difference.inMinutes;

      if( jours > 1) {
        return "$il $jours jours";
      } else if(jours == 1) {
        return "$il 1 jour";
      } else if(heures > 1) {
        return "$il $heures heures";
      } else if(heures == 1) {
        return "$il 1 heure";
      }  else if(minutes > 1) {
        return "$il $minutes minutes";
      } else if(minutes == 1) {
        return "$il 1 minutes";
      } else {
        return "A l'instant";
      }
    }
  }
}
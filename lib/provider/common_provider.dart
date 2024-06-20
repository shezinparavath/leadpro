import 'package:flutter/material.dart';
import 'package:intl/intl.dart';


class CommonProvider with ChangeNotifier {
  bool _value = false;
  bool get isSelected => _value;
  triggerOntap() {
    _value = !_value;
    notifyListeners();
  }
 final DateTime _time = DateTime.now();
  DateTime? _fromdate;
  DateTime? _todate;

  setFromdate(DateTime date) {
    _fromdate = date;
    notifyListeners();
  }

  setTodate(DateTime date) {
    _todate = date;
    notifyListeners();
  }

  String getCurrentTime() {
    String formattedTime = DateFormat('h:mm a').format(_time);
    return formattedTime;
  }

  String getfromDate() {
    return _fromdate != null
        ? getFormattedDate(_fromdate!)
        : getFormattedDate(DateTime.now());
  }

  String getFormattedDate(DateTime date) {
    return DateFormat('MMM dd, yyyy').format(date);
  }

  String gettoDate() {
    return _todate != null
        ? getFormattedDate(_todate!)
        : getFormattedDate(DateTime.now());
  }

}

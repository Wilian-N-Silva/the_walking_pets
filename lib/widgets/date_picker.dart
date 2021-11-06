import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';

selectDate(BuildContext context, _selectedDate) async {
  _selectedDate = DateFormat('dd/MM/yyyy').parse(_selectedDate);

  DateTime? newSelectedDate = await showDatePicker(
    context: context,
    initialDate: DateTime.now(),
    firstDate: DateTime(1900),
    lastDate: DateTime.now(),
  );

  if (newSelectedDate != null) {
    _selectedDate = newSelectedDate;
  }

  initializeDateFormatting();
  return DateFormat('dd/MM/yyyy').format(_selectedDate).toString();
}

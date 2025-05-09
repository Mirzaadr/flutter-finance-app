import 'package:flutter/widgets.dart';

class History {
  final String id;
  final String title;
  final double amount;
  final DateTime date;
  final IconData? icon;

  History({
    required this.id,
    required this.title,
    required this.amount,
    required this.date,
    this.icon,
  });
}

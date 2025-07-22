import 'package:flutter/material.dart';

class NotificationDateBar extends StatelessWidget {
  final String date;
  const NotificationDateBar({required this.date, super.key});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0),
      child: Text(date, style: TextStyle(fontWeight: FontWeight.bold)),
    );
  }
}

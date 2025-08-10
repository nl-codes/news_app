import 'package:flutter/material.dart';

class RecoverByCard extends StatelessWidget {
  final IconData iconData;
  final String recoverMethod;
  final String recoverDetails;
  final bool isSelected;

  const RecoverByCard({
    super.key,
    required this.iconData,
    required this.recoverMethod,
    required this.recoverDetails,
    required this.isSelected,
  });
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12, vertical: 20),
      decoration: BoxDecoration(
        color: Colors.grey.shade200,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        children: [
          Container(
            padding: EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: Colors.blueAccent,
              borderRadius: BorderRadius.circular(4),
            ),
            child: Icon(iconData, color: Colors.white, size: 20),
          ),
          SizedBox(width: 8),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("via $recoverMethod:"),
                Text(
                  recoverDetails,
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
          Icon(
            color: Colors.blueAccent,
            isSelected ? Icons.check_box : Icons.check_box_outline_blank,
          ),
        ],
      ),
    );
  }
}

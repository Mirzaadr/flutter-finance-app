import 'package:finance_app/core/utils/currency_format.dart';
import 'package:finance_app/core/utils/date_format.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HistoryItem extends StatelessWidget {
  final IconData logo;
  final String title;
  final double amount;
  final DateTime date;

  const HistoryItem({
    super.key,
    required this.logo,
    required this.title,
    required this.amount,
    required this.date,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        backgroundColor: Colors.grey[200],
        child: Icon(logo, color: Colors.black),
      ),
      title: Text(
        title,
        style: GoogleFonts.poppins(fontSize: 16, fontWeight: FontWeight.w600),
      ),
      subtitle: Text(
        formatDateMDY(date),
        style: GoogleFonts.poppins(fontSize: 12, color: Colors.grey),
      ),
      trailing: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Text(
            '\$ ${formatCurrency(amount)}',
            style: GoogleFonts.poppins(
              fontSize: 16,
              fontWeight: FontWeight.w800,
              color: Colors.black,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            formatTime(date),
            style: TextStyle(fontSize: 12, color: Colors.grey),
          ),
        ],
      ),
    );
  }
}

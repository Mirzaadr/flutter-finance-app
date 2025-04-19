import 'package:intl/intl.dart';

String formatCurrency(double amount) {
  NumberFormat formatter = NumberFormat.decimalPatternDigits(
    locale: 'en_US',
    decimalDigits: 2,
  );

  return formatter.format(amount);
}

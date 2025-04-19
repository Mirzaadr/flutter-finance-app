import 'package:intl/intl.dart';

String formatDate(DateTime datetime) {
  return DateFormat('dd MMMM yyyy').format(datetime);
}

String formatDateMDY(DateTime datetime) {
  return DateFormat.yMMMd().format(datetime);
}

String formatTime(DateTime datetime) {
  return DateFormat.jm().format(datetime);
}

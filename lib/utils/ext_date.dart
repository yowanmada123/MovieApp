import 'package:dart_date/dart_date.dart';

String localRegion = 'id_ID';

extension DatetimeExt on DateTime {
  DateTime checkUtc() {
    if (isUtc) return toLocal();
    return this;
  }

  bool isSameDate(DateTime other) {
    return year == other.year && month == other.month && day == other.day;
  }

  String toTimeDate() {
    DateTime res = checkUtc();
    return res.format('HH:mm');
  }

  String toDateHuman() {
    DateTime res = checkUtc();
    return res.format('dd MMMM y');
  }

  String toSlashDate() {
    DateTime res = checkUtc();
    return res.format('yMd');
  }

  String toDateTime() {
    DateTime res = checkUtc();
    return res.format('dd MMM y, HH:mm', localRegion);
  }

  String toDateShortMonth() {
    DateTime res = checkUtc();
    return res.format('dd MMM y', localRegion);
  }

  String toDateShort() {
    DateTime res = checkUtc();
    return res.format('dd MMM y', localRegion);
  }

  String toTime() {
    DateTime res = checkUtc();
    return res.format('HH:mm', localRegion);
  }

  String toDate2() {
    DateTime res = checkUtc();
    return res.format('y-MM-dd', localRegion);
  }

  String toyyyyMMdd() {
    DateTime res = checkUtc();
    return res.format('yyyy-MM-dd', localRegion);
  }

  String toDateNotif() {
    DateTime res = checkUtc();
    return res.format('y-MM-dd HH:mm', localRegion);
  }

  String toDateDay() {
    DateTime res = checkUtc();
    return res.format('EEEE, dd MMMM y', localRegion);
  }

  String toEEEE() {
    DateTime res = checkUtc();
    return res.format('EEEE', localRegion);
  }

  String toTheDay() {
    DateTime res = checkUtc();
    return res.format('d', localRegion);
  }

  String toYear() {
    DateTime res = checkUtc();
    return res.format('y', localRegion);
  }
}

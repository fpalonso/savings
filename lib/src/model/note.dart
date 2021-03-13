import 'package:decimal/decimal.dart';

class Note {
  final int id;
  final String title;
  final Decimal amount;
  final DateTime dateTime;

  Note({this.id, this.title, this.amount, this.dateTime});
}
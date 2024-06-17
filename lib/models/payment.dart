import 'package:exam_file/models/sim_contact.dart';
import 'package:flutter/cupertino.dart';

class Payment{
  Icon icon;
  String name;
  List<SimInternetPayment> payments;

  Payment({required this.icon,required this.name,required this.payments});
}
import 'package:exam_file/models/sim_contact.dart';
import 'package:flutter/cupertino.dart';

class PaymentsSaveModel{
  String name;
  Icon icon;
  List<SimInternetPayment> sims;

  PaymentsSaveModel({required this.name,required this.icon,required this.sims});
}
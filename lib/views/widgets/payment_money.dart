import 'package:exam_file/controllers/cards_controller.dart';
import 'package:exam_file/controllers/payment_push_controller.dart';
import 'package:exam_file/models/payment_departments.dart';
import 'package:flutter/material.dart';


class PaymentMoney extends StatelessWidget {
  PaymentDepartments paymentDepartments;
  PaymentMoney({super.key,required this.paymentDepartments});

  final controller = CardsController();
  bool isLoading = false;
  PaymentPushController push = PaymentPushController();

  void getPush(PaymentDepartments payment) async{
    await push.pushPayment(paymentDepartments);
  }

  @override
  Widget build(BuildContext context) {
    getPush(paymentDepartments);

    return AlertDialog(
      content: isLoading ? CircularProgressIndicator() : Icon(Icons.check_circle_outline,color: Colors.green,size: 100,),
      alignment: Alignment.center,
      title: isLoading ? Text('Pul otkazilmoqda') : Text("Pul o'tkazildi"),
      actions: [
        isLoading ? SizedBox() : TextButton(onPressed: (){
          Navigator.pop(context);
        }, child: Text("OK",style: TextStyle(fontFamily: "Franklin",fontWeight: FontWeight.bold,fontSize: 20),))
      ],
    );
  }
}

import 'package:exam_file/models/payment_departments.dart';
import 'package:exam_file/services/payment_http_services.dart';

class PaymentPushController{
  final services = PaymentHttpServices();

  Future<void> pushPayment(PaymentDepartments payment) async{
    await services.pushPayment(payment);
  }

  Future<void> getPayments() async{
    await services.getPayments();
  }
}
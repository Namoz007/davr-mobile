
import 'dart:convert';
import 'package:exam_file/models/payment_departments.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class PaymentHttpServices {
  final url = 'https://exam-team-5-default-rtdb.firebaseio.com';

  Future<void> pushPayment(PaymentDepartments payment) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String userId = prefs.getString('userId').toString();
    final api = Uri.parse("$url/payments.json}");
    final jsonData = json.encode(payment.toJson());

    final response = await http.post(
      api,
      headers: {'Content-Type': 'application/json'},
      body: jsonData,
    );

    Uri urlApi = Uri.parse(
        "https://exam-team-5-default-rtdb.firebaseio.com/users.json?orderBy=\"userId\"&equalTo=\"$userId\"");

    final data = await http.get(urlApi);
    print(data.body);
  }
}

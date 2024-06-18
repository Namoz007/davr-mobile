
import 'dart:convert';
import 'package:exam_file/models/payment_departments.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class PaymentHttpServices {

  Future<void> pushPayment(PaymentDepartments payment) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String userId = prefs.getString('userId').toString();
    final api = Uri.parse("https://exam-team-5-default-rtdb.firebaseio.com/payments.json");
    payment.userId = userId;
    final response = await http.post(
      api,
      body: jsonEncode(payment.toJson()),
    );

    Uri urlApi = Uri.parse(
        'https://exam-team-5-default-rtdb.firebaseio.com/cards2.json?orderBy="customerId"&equalTo="$userId"');

    final data = await http.get(urlApi);
    Map<String,dynamic> card = jsonDecode(data.body);
    List<String> id = card.keys.toList();
    print(card['${id[0]}']['balance']);
    double price = double.parse(card['${id[0]}']['balance']);
    // price -= payment.amount;
    print(price);
    // Uri patchUri = Uri.parse('https://exam-team-5-default-rtdb.firebaseio.com/cards2.json/${id[0]}.json');
    // final a = await http.get(urlApi);
    // print(a.body);
  }


  Future<void> getPayments() async{
    List<PaymentDepartments> lst = [];
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String userId = prefs.getString('userId').toString();
    print(userId);
    Uri urlApi = Uri.parse(
        'https://exam-team-5-default-rtdb.firebaseio.com/payments.json');
    final response = await http.get(urlApi);
    Map<String,dynamic> a = jsonDecode(response.body);
    List<String> keys = a.keys.toList();
    for(int i = 0;i < keys.length;i++) {
      if (a['${keys[i]}']['userId'] == userId) {
        lst.add(PaymentDepartments.fromJson(a['${keys[i]}']));
      }
    }

    print(lst.length);
  }


}

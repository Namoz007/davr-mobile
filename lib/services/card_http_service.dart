import 'dart:convert';

import 'package:exam_file/models/karta.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class CardsHttpService {
  Future<List<Karta>> getCards() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    String? userId = sharedPreferences.getString("userId");

    Uri url = Uri.parse(
        'https://exam-team-5-default-rtdb.firebaseio.com/cards2.json?orderBy="customerId"&equalTo="$userId"');

    final response = await http.get(url);
    final data = jsonDecode(response.body);
    print(data);
    List<Karta> cards = [];

    if (data != null) {
      try{
        data.forEach((key, value) {
          cards.add(Karta(
            id: key,
            balance: value['balance'],
            bankName: value['bankName'],
            cardName: value['cardName'],
            cardNumber: value['cardNumber'],
            customerId: value['customerId'],
            expiryDate: value['expiryDate'],
            type: value['type'],
          ));
        });
      }catch(e){
        print(e);
      }
    }
    return cards;
  }

  Future<void> addCard({
    required String id,
    required double balance,
    required String bankName,
    required String cardName,
    required int cardNumber,
    required String expiryDate,
    required String type,
  }) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    String? userId = sharedPreferences.getString("userId");

    Uri url = Uri.parse(
        'https://exam-team-5-default-rtdb.firebaseio.com/cards2.json?orderBy="customerId"&equalTo="$userId"');

    try {
      final response = await http.post(url, body: {
        jsonEncode({
          'balance': balance,
          'bankName': bankName,
          'cardName': cardName,
          'cardNumber': cardNumber,
          'customerId': userId,
          'expiryDate': expiryDate,
          'type': type,
        })
      });
    } catch (e) {
      print(e);
    }
  }
}

import 'dart:convert';

import 'package:exam_file/models/user.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class UsersHttpServices {
  Future<void> addUser(String fullName, String passportId) async {
    Uri url =
    Uri.parse("https://exam-team-5-default-rtdb.firebaseio.com/users.json");

    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();

    String? userId = sharedPreferences.getString("userId");
    String? email = sharedPreferences.getString("email");

    await http.post(
      url,
      body: jsonEncode(
        {
          "userId": userId,
          "email": email,
          "fullName": fullName,
          "passportId": passportId,
        },
      ),
    );
  }

  Future<User?> getUser() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    String? userId = sharedPreferences.getString("userId");
    Uri url = Uri.parse(
        "https://exam-team-5-default-rtdb.firebaseio.com/users.json?orderBy=\"userId\"&equalTo=\"$userId\"");

    final response = await http.get(url);

    if (response.statusCode == 200) {
      Map<String, dynamic> data = jsonDecode(response.body);
      if (data.isNotEmpty) {
        String userKey = data.keys.first;
        Map<String, dynamic> userData = data[userKey];
        User user = User.fromJson(userData);
        return user;
      } else {
        print("No user found with userId: $userId");
        return null;
      }
    } else {
      print("Error fetching user data: ${response.statusCode}");
      return null;
    }
  }
}
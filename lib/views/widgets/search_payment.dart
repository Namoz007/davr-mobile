
import 'package:exam_file/models/payment.dart';
import 'package:exam_file/models/payments_save_model.dart';
import 'package:exam_file/models/sim_contact.dart';
import 'package:exam_file/views/screens/payment_sim.dart';
import 'package:exam_file/views/screens/show_sim_phone.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SearchViewDelegate extends SearchDelegate<String> {
  final List<PaymentsSaveModel> data;

  SearchViewDelegate(this.data);

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
          onPressed: () {
            query = '';
          },
          icon: Icon(Icons.clear))
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
        onPressed: () {
          close(context, '');
        },
        icon: Icon(Icons.arrow_back));
  }

  @override
  Widget buildResults(BuildContext context) {
    // List<Course> suggestionList = query.isEmpty ? data : data.where((element) => element.title.contains(query)).toList();
    return Container(

    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {

    List<PaymentsSaveModel> suggestionList = query.isEmpty
        ? data
        : data.where((element) => element.name.contains(query)).toList();
    return ListView.builder(
      itemCount: suggestionList.length,
      itemBuilder: (ctx, index) {
        return InkWell(
          onTap: (){
            String paymentType = '';
            if(suggestionList[index].name == 'Uyali aloqa')
              paymentType = 'phone';
            else if(suggestionList[index].name == 'Internet')
              paymentType = 'wifi';
            else if(suggestionList[index].name == "Uy telefoni")
              paymentType = 'home';
            else if(suggestionList[index].name == 'Onlayn platformalar')
              paymentType = 'platform';
            else if(suggestionList[index].name == 'Raqamli TV')
              paymentType = 'tv';
            else if(suggestionList[index].name == 'Xizmatlar')
              paymentType = 'work';
            else if(suggestionList[index].name== 'Davlat xizmatlari')
              paymentType = 'country';
            else if(suggestionList[index].name == "Ta'lim")
              paymentType = 'teach';
            else if(suggestionList[index].name == 'Taxi')
              paymentType = 'taxi';

            Navigator.push(context, MaterialPageRoute(builder: (context) => ShowSimPhone(payment: Payment(icon: suggestionList[index].icon, name: suggestionList[index].name, payments: suggestionList[index].sims), paymentType: paymentType)));
          },
          child: ListTile(
            title: Text("${suggestionList[index].name}"),
            trailing: Icon(Icons.keyboard_arrow_right),
          ),
        );
      },
    );

  }
}
import 'package:exam_file/controllers/default_values.dart';
import 'package:exam_file/models/payments_save_model.dart';
import 'package:exam_file/models/sim_contact.dart';
import 'package:exam_file/views/widgets/all_services.dart';
import 'package:exam_file/views/widgets/search_payment.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PaymentScreen extends StatefulWidget {
  const PaymentScreen({super.key});

  @override
  State<PaymentScreen> createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("To'lov",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold,fontFamily: 'Franklin'),),

                  IconButton(
                    onPressed: (){
                      List<PaymentsSaveModel> sims = [
                        PaymentsSaveModel(name: 'Uyali aloqa', sims: phonePayments,icon: Icon(Icons.phone_android_sharp)),
                        PaymentsSaveModel(name: 'Internet', sims: wifi,icon: Icon(Icons.wifi)),
                        PaymentsSaveModel(name: 'Uy telefoni', sims: homePhones,icon: Icon(Icons.phone)),
                        PaymentsSaveModel(name: 'Onlayn platformalar', sims: platformItems,icon: Icon(Icons.web_stories)),
                        PaymentsSaveModel(name: 'Raqamli TV', sims: tvItems,icon: Icon(Icons.live_tv)),
                        PaymentsSaveModel(name: 'Xizmatlar', sims: works,icon: Icon(Icons.work)),
                        PaymentsSaveModel(name: 'Davlat xizmatlari', sims: countryWorks,icon: Icon(Icons.home_work_outlined)),
                        PaymentsSaveModel(name: "Ta'lim", sims: teachCenter,icon: Icon(CupertinoIcons.book)),
                        PaymentsSaveModel(name: 'Taxi', sims: taxis,icon: Icon(Icons.local_taxi)),
                      ];
                      showSearch(context: context, delegate: SearchViewDelegate(sims));
                    },
                    icon: Icon(Icons.search,size: 27,),
                  ),
                ],
              ),

              Divider(),
              SizedBox(height: 10,),
              SizedBox(height: 10,),
              Text("Barcha xizmatlar",style: TextStyle(fontFamily: 'Franklin',fontWeight: FontWeight.w900,fontSize: 16),),
              SizedBox(height: 20,),
              AllServices(),

            ],
          ),
        ),
      ),
    );
  }
}

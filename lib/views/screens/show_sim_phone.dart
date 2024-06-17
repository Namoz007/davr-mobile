import 'package:exam_file/models/payment.dart';
import 'package:exam_file/views/screens/payment_sim.dart';
import 'package:flutter/material.dart';

class ShowSimPhone extends StatefulWidget {
  Payment payment;
  String paymentType;
  ShowSimPhone({super.key, required this.payment,required this.paymentType});

  @override
  State<ShowSimPhone> createState() => _ShowSimPhoneState();
}

class _ShowSimPhoneState extends State<ShowSimPhone> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: (){
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back),
        ),
        title: Text("${widget.payment.name}",style: TextStyle(fontFamily: "Franklin",fontWeight: FontWeight.bold),),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Container(
            decoration: BoxDecoration(
              color: Colors.grey.shade300,
              borderRadius: BorderRadius.circular(15)
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                for(int i = 0;i < widget.payment.payments.length;i++)
                  Column(
                    children: [
                      InkWell(
                        onTap: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context) => PaymentSim(simCard: widget.payment.payments[i],paymentType: widget.paymentType,)));
                        },
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 20),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                width: 40,
                                height: 40,
                                decoration: BoxDecoration(
                                  border: Border.all(color: Colors.grey),
                                  image: DecorationImage(
                                    image: NetworkImage('${widget.payment.payments[i].imgUrl}'),
                                  ),
                                  shape: BoxShape.circle
                                ),
                              ),
        
                              Text("${widget.payment.payments[i].typeName}",style: TextStyle(fontFamily: "Franklin",fontWeight: FontWeight.bold),),
        
                              SizedBox(),
                              SizedBox(),
                              SizedBox(),
        
                              Icon(Icons.keyboard_arrow_right)
                            ],
                          ),
                        ),
                      ),
        
                      i + 1 != widget.payment.payments.length ? Divider() : SizedBox()
                    ],
                  )
              ],
            )
          ),
        ),
      ),
    );
  }
}

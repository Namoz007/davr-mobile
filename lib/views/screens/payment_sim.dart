import 'package:exam_file/controllers/cards_controller.dart';
import 'package:exam_file/models/payment_departments.dart';
import 'package:exam_file/models/sim_contact.dart';
import 'package:exam_file/views/widgets/payment_money.dart';
import 'package:flutter/material.dart';

class PaymentSim extends StatefulWidget {
  String paymentType;
  SimInternetPayment simCard;
  PaymentSim({super.key, required this.simCard, required this.paymentType});

  @override
  State<PaymentSim> createState() => _PaymentSimState();
}

class _PaymentSimState extends State<PaymentSim> {
  final phoneNumber = TextEditingController();
  final money = TextEditingController();
  final controller = CardsController();
  Color color = Colors.red;
  bool phoneNumberIsTrue = false;
  bool summaIsTrue = false;
  String? error;
  String? sumError;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(Icons.arrow_back),
          ),
          title: Text(
            '${widget.simCard.typeName}',
            style:
                TextStyle(fontFamily: "Franklin", fontWeight: FontWeight.bold),
            overflow: TextOverflow.ellipsis,
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Container(
                    height: 110,
                    width: 110,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(15),
                        border: Border.all(color: Colors.grey),
                        image: DecorationImage(
                            image: NetworkImage("${widget.simCard.imgUrl}"))),
                  ),
                  SizedBox(width: 30),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '${widget.simCard.typeName}',
                        style: TextStyle(
                            fontFamily: "Franklin",
                            fontWeight: FontWeight.bold,
                            fontSize: 20),
                        overflow: TextOverflow.ellipsis,
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        '${widget.simCard.typeName.toLowerCase()}',
                        style: TextStyle(
                            fontFamily: "Franklin",
                            fontWeight: FontWeight.bold,
                            overflow: TextOverflow.ellipsis),
                      ),
                    ],
                  )
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Column(
                children: [
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                    width: double.infinity,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.grey.shade300),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "${widget.simCard.paymentType}",
                          style: TextStyle(
                              fontFamily: "Franklin",
                              fontSize: 18,
                              fontWeight: FontWeight.w900),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        widget.paymentType == 'phone' ||
                                widget.paymentType == 'home'
                            ? Row(
                                children: [
                                  Text(
                                    "+998",
                                    style: TextStyle(
                                      fontFamily: "Franklim",
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16,
                                    ),
                                  ),
                                  SizedBox(
                                    width: 20,
                                  ),
                                  Expanded(
                                    child: TextFormField(
                                      onChanged: (value) {
                                        if (value.length > 1) {
                                          if (!widget.simCard.callCode.contains(
                                              value.substring(0, 2))) {
                                            setState(() {
                                              error =
                                                  'Bu no togri operator kodi';
                                            });
                                          } else {
                                            setState(() {
                                              error = null;
                                            });
                                          }
                                        }

                                        if (value.length != 9) {
                                          setState(() {
                                            error =
                                                'No togri formatdagi raqam kiritildi';
                                          });
                                        }
                                        try {
                                          int numb = int.parse(value);
                                          setState(() {
                                            if (value.length == 9 &&
                                                widget.simCard.callCode
                                                    .contains(value.substring(
                                                        0, 2))) {
                                              color = Colors.green;
                                              error = null;
                                              phoneNumberIsTrue = true;
                                            }
                                          });
                                        } catch (e) {
                                          setState(() {
                                            error =
                                                'Telefon raqam faqat raqamlardan iborat bolishi kerak';
                                          });
                                        }
                                      },
                                      controller: phoneNumber,
                                      keyboardType: TextInputType.number,
                                      decoration: InputDecoration(
                                        errorText: error,
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 20,
                                  ),
                                  Icon(
                                    Icons.sim_card,
                                    color: color,
                                  )
                                ],
                              )
                            : SizedBox(),
                        widget.paymentType == 'wifi' ||
                                widget.paymentType == 'platform' ||
                                widget.paymentType == 'teach' ||
                                widget.paymentType == 'taxi'
                            ? TextFormField(
                                onChanged: (value) {
                                  if (value == null || value.isEmpty) {
                                    setState(() {
                                      error = 'Login bosh bolmasligi kerak';
                                      phoneNumberIsTrue = false;
                                    });
                                  } else {
                                    setState(() {
                                      error = null;
                                    });
                                  }

                                  if (value.length < 6) {
                                    setState(() {
                                      error =
                                          "Login kamida 6 ta belgidan iborat bolishi kerak";
                                      phoneNumberIsTrue = false;
                                    });
                                  } else {
                                    setState(() {
                                      error = null;
                                    });
                                  }

                                  try {
                                    int numb = int.parse(value);
                                    setState(() {
                                      if (value.length > 5) {
                                        phoneNumberIsTrue = true;
                                        error = null;
                                      } else {
                                        phoneNumberIsTrue = false;
                                      }
                                    });
                                  } catch (e) {
                                    setState(() {
                                      error =
                                          'Login ramamlardan iborat bolishi kerak';
                                      phoneNumberIsTrue = false;
                                    });
                                  }
                                },
                                controller: phoneNumber,
                                decoration: InputDecoration(
                                    errorText: error,
                                    border: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(15)),
                                    hintText: "${widget.simCard.paymentType}"),
                              )
                            : SizedBox(),
                        widget.paymentType == 'tv' ||
                                widget.paymentType == 'work' ||
                                widget.paymentType == 'country' ||
                                widget.paymentType == 'ipPhone'
                            ? TextFormField(
                                onChanged: (value) {
                                  if (value == null || value.isEmpty) {
                                    setState(() {
                                      error = 'Login bosh bolmasligi kerak';
                                      phoneNumberIsTrue = false;
                                    });
                                  } else {
                                    setState(() {
                                      error = null;
                                    });
                                  }

                                  if (value.length < 6) {
                                    setState(() {
                                      error =
                                          "Login kamida 6 ta belgidan iborat bolishi kerak";
                                      phoneNumberIsTrue = false;
                                    });
                                  } else {
                                    setState(() {
                                      error = null;
                                    });
                                  }

                                  if (value.length > 5) {
                                    phoneNumberIsTrue = true;
                                    error = null;
                                  } else {
                                    phoneNumberIsTrue = false;
                                  }
                                },
                                controller: phoneNumber,
                                decoration: InputDecoration(
                                    errorText: error,
                                    border: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(15)),
                                    hintText: "${widget.simCard.paymentType}"),
                              )
                            : SizedBox(),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                    width: double.infinity,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.grey.shade300),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Summa",
                          style: TextStyle(
                              fontFamily: "Franklin",
                              fontSize: 18,
                              fontWeight: FontWeight.w900),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        // Text("500 dan 1500000 so'mgacha",style: TextStyle(fontSize: 17,fontFamily: "Franklin",fontWeight: FontWeight.bold),),
                        TextFormField(
                          onChanged: (value) async{
                            final data = await controller.getCards();

                            //aka mana shu yerda tekshirip keting kartadagi mablag yetarlimi yoki yoq
                            try {
                              int numb = int.parse(value);
                              if (numb < 500) {
                                setState(() {
                                  sumError = 'Summa kamida 500 bolishi kerak';
                                });
                              } else if (numb > 1500000) {
                                setState(() {
                                  sumError =
                                      'Summa maksimum 1500000 bolishi kerak';
                                });
                              } else {
                                setState(() {
                                  summaIsTrue = true;
                                  sumError = null;
                                });
                              }
                            } catch (e) {
                              setState(() {
                                sumError =
                                    'Iltimos summani raqamlar bilan kiriting';
                              });
                            }
                          },
                          controller: money,
                          decoration: InputDecoration(
                              errorText: sumError,
                              hintText: "500 dan 1500000 so'mgacha",
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10))),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
        bottomNavigationBar: phoneNumberIsTrue && summaIsTrue
            ? InkWell(
                onTap: () async {
                  double sum = double.parse(money.text);
                  await showDialog(
                      context: context,
                      builder: (ctx) {
                        return PaymentMoney(
                            paymentDepartments: PaymentDepartments(
                                amount: sum,
                                date: DateTime.now(),
                                servicesName: widget.simCard.typeName,
                                servicesAccount: phoneNumber.text,
                                userId: '',
                                fromCard: '8600'));  //aka bu yerda kartani bervorasiz
                      });
                  Navigator.pop(context);
                },
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 0),
                  child: Container(
                    height: 50,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.green,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(15),
                          topRight: Radius.circular(15)),
                    ),
                    alignment: Alignment.center,
                    child: Text(
                      "O'tkazish",
                      style: TextStyle(
                          fontFamily: "Franklin",
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                  ),
                ),
              )
            : SizedBox());
  }
}

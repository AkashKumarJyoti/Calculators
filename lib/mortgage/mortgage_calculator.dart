import 'dart:math';

import 'package:flutter/material.dart';

class Mortgage extends StatefulWidget {
  const Mortgage({Key? key}) : super(key: key);

  @override
  State<Mortgage> createState() => _MortgageState();
}

class _MortgageState extends State<Mortgage> {
  TextEditingController moneyController = TextEditingController();
  double _price = 0;
  int _years = 1;
  double _interest = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Mortgage Calculator", style: TextStyle(
          fontSize: 24
        )),
        centerTitle: true,
        backgroundColor: const Color(0xFFF9A825),
      ),
      body: ListView(
        children: <Widget>[
          Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(left: 15.0, right: 15.0, top: 22.0),
                child: Container(
                  height: 200,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    color: const Color(0xAFFFF176),
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      const Text("Monthly Payment", style: TextStyle(
                        color: Color(0xFFF9A825),
                        fontSize: 22.0,
                        fontWeight: FontWeight.w600,
                      )),
                      Padding(
                        padding: const EdgeInsets.only(top: 18.0),
                        child: Text("${calculateMonthlyPayment(_price, _interest, _years)}",
                          style: const TextStyle(
                            fontSize: 18,
                            color: Color(0xFFF9A825),
                            fontWeight: FontWeight.w500
                            // fontWeight: FontWeight.bold
                          ),
                        ),
                      ),

                    ],
                  ),
                ),
              ),
              const SizedBox(height: 15.0),
              Card(
                child: Padding(
                  padding: const EdgeInsets.only(left: 12.0, right: 12.0),
                  child: Container(
                    height: 250,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15.0),
                      color: const Color(0x6FFFF176)
                    ),
                    child: Column(
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.all(18.0),
                          child: TextField(
                            controller: moneyController,
                            keyboardType:
                            const TextInputType.numberWithOptions(
                                decimal: true),
                            onChanged: (String value)
                            {
                              try
                              {
                                _price = double.parse(value);
                              }
                              catch(exception)
                              {
                                _price = 0.0;
                              }
                            },
                            decoration: InputDecoration(
                              prefixIcon: const Icon(
                                  Icons.home,
                                  color: Color(0xFF532D60)),
                              hintText: "Enter the Home price",
                              border: const OutlineInputBorder(),
                              focusedBorder: OutlineInputBorder(
                                borderRadius:
                                BorderRadius.circular(10.0),
                                borderSide: const BorderSide(
                                    color: Color(0xFF46096C),
                                    width: 2.0),
                              ),
                              filled: true,
                              fillColor: const Color(0xFFFFAB91),
                              contentPadding:
                              const EdgeInsets.symmetric(
                                  vertical: 19.0,
                                  horizontal: 20.0),
                            ),
                            style: const TextStyle(
                                color: Color(0xFF9D0505)),
                          ),
                        ),
                        // const SizedBox(height: 3.0),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: <Widget>[
                            const Text("Length of Loan (years)", style: TextStyle(
                              fontSize: 15.0,
                              fontWeight: FontWeight.w600
                            )),
                            const SizedBox(width: 4.0),
                            Row(
                              // mainAxisAlignment: MainAxisAlignment.end,
                              children: <Widget>[
                                InkWell(
                                  onTap: ()
                                  {
                                    setState(() {
                                      if(_years > 1)
                                      {
                                        _years--;
                                      }
                                      else
                                      {

                                      }
                                    });
                                  },
                                  child: Container(
                                    width: 40,
                                    height: 40,
                                    margin: EdgeInsets.all(10.0),
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(7.0),
                                        color: Color(0x3FF9A825)
                                    ),
                                    child: const Center(
                                      child: Text("-",
                                        style: TextStyle(
                                          color: Color(0xFFF9A825),
                                          fontWeight: FontWeight.bold,
                                          fontSize: 35.0
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                Text("$_years", style: const TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold
                                ),),
                                InkWell(
                                  onTap: ()
                                  {
                                    setState(() {
                                      _years++;
                                    });
                                  },
                                  child: Container(
                                    width: 40,
                                    height: 40,
                                    margin: EdgeInsets.all(10.0),
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(7.0),
                                        color: Color(0x3FF9A825)
                                    ),
                                    child: const Center(
                                      child: Text("+",
                                        style: TextStyle(
                                            color: Color(0xFFF9A825),
                                            fontWeight: FontWeight.bold,
                                            fontSize: 30.0
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            const Padding(
                              padding: EdgeInsets.only(left: 15.0, top: 15.0),
                              child: Text("Interest",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 15,
                                  fontWeight: FontWeight.w600
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(right: 15.0, top: 15.0),
                              child: Text("${(_interest).toStringAsFixed(2)}%",
                                  style: const TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 15
                                ),
                              ),
                            ),
                          ],
                        ),
                        Slider(
                            min: 0.00,
                            max: 10.00,
                            activeColor: Color(0xFFF9A825),
                            inactiveColor: Color(0xAFFF5722),
                            value: _interest.toDouble(),
                            onChanged: (double value)
                            {
                              setState(() {
                                _interest = value;
                              });
                            }
                        )

                      ]
                    )
                  ),
                )
              )
            ],
          )
        ],
      ),
    );
  }
  calculateMonthlyPayment(double homePrice, double interest, int loanLength ) {
    int n = 12 * loanLength;
    double c = interest / 12.0 / 100.0;
    double monthlyPayment = 0.0;
    if (homePrice < 0 || homePrice.toString().isEmpty || homePrice == null) {
      //no go!
      // _homePrice = 0.0;
    }else {
      monthlyPayment = homePrice * c * pow(1 + c, n) / (pow(1 + c, n) - 1);
    }
    return monthlyPayment.toStringAsFixed(2);
  }
}

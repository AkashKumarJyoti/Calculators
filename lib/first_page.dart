import 'package:calculators/unit_conversion/conversion.dart';
import 'package:flutter/material.dart';
import 'bill_splitter/tip_calculator.dart';
import 'bmi/ui_bmi.dart';
import 'calculator/ui_calculator.dart';
import 'currency_converter/ui/home.dart';
import 'mortgage/mortgage_calculator.dart';

class Intro extends StatefulWidget {
  const Intro({Key? key}) : super(key: key);

  @override
  State<Intro> createState() => _IntroState();
}

class _IntroState extends State<Intro> {
  @override
  Widget build(BuildContext context) {
    var w = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: const Text("Calculators", style: TextStyle(
          fontSize: 25
        ),),
        backgroundColor: const Color(0xFF0097A7),
        centerTitle: true,
      ),
      backgroundColor: const Color(0xFFBEEFFF),
      body:
      ListView(
        children: <Widget>
      [
      Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(top: 18.0, left: 10.0, right: 10.0),
            child: Container(
              height: 100,
              width: w,
              decoration: BoxDecoration(
                color: const Color(0xFFFF7043).withOpacity(0.5),
                borderRadius: BorderRadius.circular(15.0)
              ),
              child: TextButton(
                onPressed: ()
                {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => const Calculator()));
                },
                child: const Text("Calculator", style: TextStyle(
                  fontSize: 25,
                  color: Color(0xFFBF360C)
                ),)
              )
            ),
          ),Padding(
            padding: const EdgeInsets.only(top: 18.0, left: 10.0, right: 10.0),
            child: Container(
              height: 100,
              width: w,
              decoration: BoxDecoration(
                color: const Color(0xFF00C853).withOpacity(0.5),
                borderRadius: BorderRadius.circular(15.0)
              ),
              child: TextButton(
                onPressed: ()
                {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => const Home()));
                },
                child: const Text("Currency Converter", style: TextStyle(
                  fontSize: 25,
                  color: Color(0xFF1B5E20)
                ),)
              )
            ),
          ),Padding(
            padding: const EdgeInsets.only(top: 18.0, left: 10.0, right: 10.0),
            child: Container(
              height: 100,
              width: w,
              decoration: BoxDecoration(
                color: const Color(0xDFC067F7).withOpacity(0.4),
                borderRadius: BorderRadius.circular(15.0)
              ),
              child: TextButton(
                onPressed: ()
                {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => const ConversionPage()));
                },
                child: const Text("Unit Converter", style: TextStyle(
                  fontSize: 25,
                  color: Color(0xFF673AB7)
                ),)
              )
            ),
          ),Padding(
            padding: const EdgeInsets.only(top: 18.0, left: 10.0, right: 10.0),
            child: Container(
              height: 100,
              width: w,
              decoration: BoxDecoration(
                color: const Color(0xDFF9A825).withOpacity(0.4),
                borderRadius: BorderRadius.circular(15.0)
              ),
              child: TextButton(
                onPressed: ()
                {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => const Mortgage()));
                },
                child: const Text("Mortgage Calculator", style: TextStyle(
                  fontSize: 25,
                  color: Color(0xFFF9A825)
                ),)
              )
            ),
          ),Padding(
            padding: const EdgeInsets.only(top: 18.0, left: 10.0, right: 10.0),
            child: Container(
              height: 100,
              width: w,
              decoration: BoxDecoration(
                color: const Color(0xDF6908D6).withOpacity(0.4),
                borderRadius: BorderRadius.circular(15.0)
              ),
              child: TextButton(
                onPressed: ()
                {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => const BillSplitter()));
                },
                child: const Text("Tip Calculator", style: TextStyle(
                  fontSize: 25,
                  color: Color(0xFF6908D6)
                ),)
              )
            ),
          ),Padding(
            padding: const EdgeInsets.only(top: 18.0, left: 10.0, right: 10.0),
            child: Container(
              height: 100,
              width: w,
              decoration: BoxDecoration(
                color: const Color(0xFFF50057).withOpacity(0.4),
                borderRadius: BorderRadius.circular(15.0)
              ),
              child: TextButton(
                onPressed: ()
                {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => const BMI()));
                },
                child: const Text("BMI Calculator", style: TextStyle(
                  fontSize: 25,
                  color: Color(0xFFF50057)
                ),)
              )
            ),
          ),
        ],
      ),
          ]
      )
    );
  }
}
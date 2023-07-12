import 'package:flutter/material.dart';
class BMI extends StatefulWidget {
  const BMI({Key? key}) : super(key: key);

  @override
  State<BMI> createState() => _BMIState();
}
class _BMIState extends State<BMI> {
  final TextEditingController _ageController = TextEditingController();
  final TextEditingController _heightController = TextEditingController();
  final TextEditingController _weightController = TextEditingController();
  bool isAgeEmpty = false;
  bool isHeightEmpty = false;
  bool isWeightEmpty = false;
  double inches = 0.0;
  double meter = 0.0;
  double result = 0.0;
  String _resultReading = "";
  void _calculateBMI() {
    if (_ageController.text.isEmpty) {
      setState(() {
        isAgeEmpty = true;
      });
      return;
    } else {
      setState(() {
        isAgeEmpty = false;
      });
    }

    if (_heightController.text.isEmpty) {
      setState(() {
        isHeightEmpty = true;
      });
      return;
    } else {
      setState(() {
        isHeightEmpty = false;
      });
    }

    if (_weightController.text.isEmpty) {
      setState(() {
        isWeightEmpty = true;
      });
      return;
    } else {
      setState(() {
        isWeightEmpty = false;
      });
    }

    setState(() {
      double age = double.parse(_ageController.text);
      double height = double.parse(_heightController.text);
      double weight = double.parse(_weightController.text);
      inches = height * 12;
      meter = height;

      if (change == 0) {
        if (age > 0 && inches > 0 && weight > 0) {
          result = weight / (inches * inches) * 703;
        } else {
          return;
        }
      } else {
        if (age > 0 && meter > 0 && weight > 0) {
          result = weight / (meter * meter);
        } else {
          return;
        }
      }

      if (result < 18.5) {
        _resultReading = "Underweight";
      } else if (result >= 18.5 && result < 25) {
        _resultReading = "Normal";
      } else if (result >= 25 && result < 30) {
        _resultReading = "Overweight";
      } else {
        _resultReading = "Obese";
      }
    });
  }

  int change = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("BMI"),
        centerTitle: true,
        backgroundColor: Colors.pinkAccent,
      ),
      body: ListView(
        children: <Widget>[
          Center(child: Image.asset("images/bmi.png", height: 100, width: 160)),
          Column(
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Transform.scale(
                    scale: 1.1,
                    child: Radio<int>(
                      activeColor: Colors.pinkAccent.shade700,
                      value: 0,
                      groupValue: change,
                      onChanged: (value)
                      {
                        setState(() {
                          change = value!;
                          _ageController.clear();
                          _heightController.clear();
                          _weightController.clear();
                        });
                      },
                    ),
                  ),
                  const Text("US", style: TextStyle(
                      color: Colors.blue,
                      fontWeight: FontWeight.w700,
                      fontSize: 19
                  )),Transform.scale(
                    scale: 1.1,
                    child: Radio<int>(
                      activeColor: Colors.pinkAccent.shade700,
                      value: 1,
                      groupValue: change,
                      onChanged: (value)
                      {
                        setState(() {
                          change = value!;
                          _ageController.clear();
                          _heightController.clear();
                          _weightController.clear();
                        });
                      },
                    ),
                  ),
                  const Text("Metric", style: TextStyle(
                      color: Colors.blue,
                      fontWeight: FontWeight.w700,
                      fontSize: 19
                  )),
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(4.0),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12.0),
                    color: Colors.grey.shade400,
                  ),
                  margin: const EdgeInsets.all(3.0),
                  height: 360.0,
                  width: MediaQuery.of(context).size.width,

                  child: Column(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(top: 16.0, right: 8.0),
                        child: TextFormField(
                          controller: _ageController,
                          keyboardType: const TextInputType.numberWithOptions(decimal: true),
                          decoration: InputDecoration(
                            labelText: "Age",
                            labelStyle: TextStyle(color: Colors.indigo.shade900),
                            icon: const Icon(Icons.person_outline),
                            border: OutlineInputBorder(
                              gapPadding: 3.3,
                              borderRadius: BorderRadius.circular(10.3),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.indigo.shade900),
                            ),
                            errorBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.red),
                            ),
                            errorText: isAgeEmpty ? 'Age is required' : null,
                          ),
                        ),

                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 16.0, right: 8.0),
                        child: TextFormField(
                          controller: _heightController,
                          keyboardType: const TextInputType.numberWithOptions(decimal: true),
                          decoration: InputDecoration(
                            labelText: change == 0 ?"Height in feet" : "Height in meter",
                            labelStyle: TextStyle(color: Colors.indigo.shade900),
                            icon: const Icon(Icons.height),
                            border: OutlineInputBorder(
                              gapPadding: 3.3,
                              borderRadius: BorderRadius.circular(10.3),
                              // borderSide: BorderSide(color: Colors.red),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.indigo.shade900),
                            ),
                            errorBorder: const OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.red),
                            ),
                            errorText: isHeightEmpty ? 'Height is required' : null,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 16.0, right: 8.0),
                        child: TextFormField(
                          controller: _weightController,
                          keyboardType: const TextInputType.numberWithOptions(decimal: true),
                          decoration: InputDecoration(
                            labelText: change == 0 ? "Weight in lbs" : "Weight in kgs",
                            labelStyle: TextStyle(color: Colors.indigo.shade900),
                            icon: const Icon(Icons.line_weight),
                            border: const OutlineInputBorder(
                              gapPadding: 3.3,
                              // borderRadius: BorderRadius.circular(10.3),
                              borderSide: BorderSide(color: Colors.red),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.indigo.shade900),
                            ),
                            errorBorder: const OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.red),
                            ),
                            errorText: isWeightEmpty ? 'Weight is required' : null,
                            // fillColor: Colors.deepPurple
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 18.0),
                        child: ElevatedButton(onPressed:()
                            {
                            if (_ageController.text.isEmpty ||
                            _heightController.text.isEmpty ||
                            _weightController.text.isEmpty) {
                            setState(() {
                            isAgeEmpty = _ageController.text.isEmpty;
                            isHeightEmpty = _heightController.text.isEmpty;
                            isWeightEmpty = _weightController.text.isEmpty;
                            });
                            } else {
                            _calculateBMI();
                            }
                            },
                            style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all(Colors.pinkAccent), // Set the background color
                            ),
                            child: const Text("Calculate", style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold
                            ),)),
                      )
                    ],
                  ),
                ),
              ),
              Column(
                children: <Widget>[
                  Center(
                    child: Padding(
                      padding: const EdgeInsets.only(top: 18.0),
                      child: Text("Your BMI: ${result.toStringAsFixed(1)}", style: const TextStyle(
                          color: Colors.blue,
                          fontSize: 28,
                          fontWeight: FontWeight.bold
                      )),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 18.0),
                    child: Text("${_resultReading}", style: TextStyle(
                        color: Colors.grey.shade900,
                        fontSize: 20,
                        fontWeight: FontWeight.w700
                    )),
                  )
                ],
              )
            ],
          )
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Temperature extends StatefulWidget {
  const Temperature({Key? key}) : super(key: key);

  @override
  State<Temperature> createState() => _TemperatureState();
}

class _TemperatureState extends State<Temperature> {
  GlobalKey formkey = GlobalKey();
  TextEditingController unitController = TextEditingController();
  String result = "0";
  String dropdownValue1 = "Degree Celsius (°C)";
  String dropdownValue2 = "Degree Fahrenheit (°F)";
  final List<String> volume = [
    "Degree Celsius (°C)",
    "Degree Rankine (°R)",
    "Degree Fahrenheit (°F)",
    "Degree Reaumur (°Re)",
    "Kelvin (K)",
  ];

  final Map<String, String> unitAbbreviations = {
    'Degree Celsius (°C)': '°C',
    'Degree Rankine (°R)': '°R',
    'Degree Fahrenheit (°F)': '°F',
    'Degree Reaumur (°Re)': '°Re',
    'Kelvin (K)': 'K',
  };

  double convertTemperature(double inputValue, String sourceUnit, String targetUnit) {
    Map<String, double Function(double)> converters = {
      'Degree Celsius (°C)': (value) => value,
      'Degree Rankine (°R)': (value) => (value + 273.15) * (9 / 5),
      'Degree Fahrenheit (°F)': (value) => (value * 9 / 5) + 32,
      'Degree Reaumur (°Re)': (value) => value * (5 / 4),
      'Kelvin (K)': (value) => value + 273.15,
    };

    double convertedValue = converters[sourceUnit]!(inputValue);
    return converters[targetUnit]!(convertedValue);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pop(context);
            },
            color: const Color(0xFF532D60),
          ),
          title: const Expanded(
            child: Row(
                children: <Widget>[
                  Icon(FontAwesomeIcons.temperatureHigh, color: Color(0xFF532D60)),
                  SizedBox(width: 10.0),
                  Expanded(child: Text("Temperature conversion",  style: TextStyle(color: Color(0xFF532D60), fontSize: 21))),
                ]
            ),
          ),
          backgroundColor: const Color(0xAFC067F7),
        ),
        backgroundColor: const Color(0xFFE9B8FA),
        body: Container(
          padding: const EdgeInsets.all(10.0),
          child: ListView(
            children: [
              Column(
                children: [
                  Form(
                      key: formkey,
                      child: Container(
                          height: 360,
                          decoration: BoxDecoration(
                              gradient: const LinearGradient(
                                colors: [
                                  Color(0xFAEC407A),
                                  Color(0xAF7E57C2),
                                  Color(0xAFF44336)
                                ],
                                begin: Alignment.topRight,
                                end: Alignment.bottomLeft,
                              ),
                              borderRadius: BorderRadius.circular(15.0)),
                          child: Card(
                              elevation: 35.0,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15.0),
                                side: const BorderSide(
                                    color: Colors.grey, width: 1.0),
                              ),
                              child: Container(
                                  decoration: BoxDecoration(
                                      gradient: const LinearGradient(
                                        colors: [
                                          Color(0xFFD595FC),
                                          Color(0xAFAF9FF1),
                                          Color(0xFFB180CF),
                                        ], // Use the desired colors in the list
                                        begin: Alignment.topLeft,
                                        end: Alignment.bottomRight,
                                      ),
                                      borderRadius:
                                      BorderRadius.circular(15.0)),
                                  padding: const EdgeInsets.all(20),
                                  child: Column(children: <Widget>[
                                    TextField(
                                      controller: unitController,
                                      keyboardType:
                                      const TextInputType.numberWithOptions(
                                          decimal: true),
                                      decoration: InputDecoration(
                                        prefixIcon: const Icon(
                                            Icons.straighten_outlined,
                                            color: Color(0xFF532D60)),
                                        hintText: "Enter the value",
                                        border: const OutlineInputBorder(),
                                        focusedBorder: OutlineInputBorder(
                                          borderRadius:
                                          BorderRadius.circular(10.0),
                                          borderSide: const BorderSide(
                                              color: Color(0xFF46096C),
                                              width: 2.0),
                                        ),
                                        filled: true,
                                        fillColor: const Color(0xFFE9B8FA),
                                        contentPadding:
                                        const EdgeInsets.symmetric(
                                            vertical: 19.0,
                                            horizontal: 20.0),
                                      ),
                                      style: const TextStyle(
                                          color: Color(0xFF9D0505)),
                                    ),
                                    const SizedBox(height: 20.0),
                                    const Text("Select Parameters",
                                        style: TextStyle(
                                            color: Color(0xFF532D60),
                                            fontWeight: FontWeight.w500,
                                            fontSize: 22.0,
                                            fontStyle: FontStyle.italic)),
                                    const SizedBox(height: 10.0),
                                    DropdownButton<String>(
                                      value: dropdownValue1,
                                      icon: const Icon(
                                          Icons.arrow_drop_down_rounded,
                                          color: Color(0xFF532D60)),
                                      iconSize: 24,
                                      elevation: 16,
                                      isExpanded: true,
                                      style: const TextStyle(
                                        fontSize: 18,
                                        color: Colors.black,
                                      ),
                                      underline: Container(
                                        height: 2,
                                        color: const Color(0xFF532D60),
                                      ),
                                      onChanged: (String? newValue) {
                                        setState(() {
                                          dropdownValue1 = newValue!;
                                        });
                                      },
                                      items: volume.map((String value) {
                                        return DropdownMenuItem<String>(
                                          value: value,
                                          child: Text(value),
                                        );
                                      }).toList(),
                                    ),
                                    const SizedBox(height: 10.0),
                                    DropdownButton<String>(
                                      value: dropdownValue2,
                                      icon: const Icon(
                                          Icons.arrow_drop_down_rounded,
                                          color: Color(0xFF532D60)),
                                      iconSize: 24,
                                      elevation: 16,
                                      isExpanded: true,
                                      style: const TextStyle(
                                        fontSize: 18,
                                        color: Colors.black,
                                      ),
                                      underline: Container(
                                        height: 2,
                                        color: const Color(0xFF532D60),
                                      ),
                                      onChanged: (String? newValue) {
                                        setState(() {
                                          dropdownValue2 = newValue!;
                                        });
                                      },
                                      items: volume.map((String value) {
                                        return DropdownMenuItem<String>(
                                          value: value,
                                          child: Text(value),
                                        );
                                      }).toList(),
                                    ),
                                    const SizedBox(height: 20),
                                    Container(
                                      width: double.infinity,
                                      decoration: BoxDecoration(
                                        borderRadius:
                                        BorderRadius.circular(15.0),
                                        gradient: const LinearGradient(
                                          colors: [
                                            Color(0xFFA23FDF),
                                            Color(0xFFA98FF2),
                                            Color(0xFF7E66C4)
                                          ],
                                          // Use the desired colors in the list
                                          begin: Alignment.topLeft,
                                          end: Alignment.bottomRight,
                                        ),
                                      ),
                                      child: TextButton(
                                          onPressed: () {
                                            double input = double.parse(unitController.text);
                                            double value = convertTemperature(input, dropdownValue1, dropdownValue2);
                                            setState(() {
                                              result = value.toStringAsFixed(5) ;
                                            });
                                          },
                                          child: const Text("Calculate",
                                              style: TextStyle(
                                                  color: Color(0xFF532D60),
                                                  fontSize: 24.0))),
                                    )
                                  ]))))),
                  const SizedBox(height: 15.0),
                  Container(
                      height: 90,
                      decoration: BoxDecoration(
                          gradient: const LinearGradient(
                            colors: [
                              Color(0xFAEC407A),
                              Color(0xAF7E57C2),
                              Color(0xAFF44336)
                            ], // Use the desired colors in the list
                            begin: Alignment.topRight,
                            end: Alignment.bottomLeft,
                          ),
                          borderRadius: BorderRadius.circular(15.0)),
                      child: Center(
                          child: Card(
                              elevation: 35.0,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15.0),
                                // Set desired border radius
                                side: const BorderSide(
                                    color: Colors.grey,
                                    width: 1.0), // Set border color and width
                              ),
                              child: Container(
                                // width: w,
                                  height: 90,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(15.0),
                                    gradient: const LinearGradient(
                                      colors: [
                                        Color(0xFFD595FC),
                                        Color(0xAFAF9FF1),
                                        Color(0xFFC361FF)
                                      ], // Use the desired colors in the list
                                      begin: Alignment.topLeft,
                                      end: Alignment.bottomRight,
                                    ),
                                  ),
                                  child: Center(
                                    child:  Text(
                                      hasFractionalPart(result)
                                          ? '${double.parse(result).toStringAsFixed(5)} ${unitAbbreviations[dropdownValue2]}'
                                          : '${double.parse(result).toStringAsFixed(0)} ${unitAbbreviations[dropdownValue2]}',
                                      style: const TextStyle(color: Color(0xFF532D60), fontSize: 23),
                                    ),
                                  )))))
                ],
              )
            ],
          ),
        ));
  }
  bool hasFractionalPart(String value) {
    double number = double.parse(value);
    return number % 1 != 0;
  }
}

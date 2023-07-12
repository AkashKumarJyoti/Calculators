import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Volume extends StatefulWidget {
  const Volume({Key? key}) : super(key: key);

  @override
  State<Volume> createState() => _VolumeState();
}

class _VolumeState extends State<Volume> {
  GlobalKey formkey = GlobalKey();
  TextEditingController unitController = TextEditingController();
  String result = "0";
  String dropdownValue1 = "Liter (l)";
  String dropdownValue2 = "Cubic meter (m³)";
  final List<String> volume = [
    "Hectoliter (hl)",
    "Cubic meter (m³)",
    "Cubic centimeter (cm³)",
    "deciliter (dl)",
    "Centiliter (cl)",
    "Cubic decimeter (dm³)",
    "Liter (l)",
    "Cubic millimeter (mm³)",
    "milliliter (ml)",
    "Gallon (gal)"
  ];

  final Map<String, String> unitAbbreviations = {
    'Hectoliter (hl)': 'hl',
    'Cubic meter (m³)': 'm³',
    'Cubic centimeter (cm³)': 'cm³',
    'deciliter (dl)': 'dl',
    'Centiliter (cl)': 'cl',
    'Cubic decimeter (dm³)': 'dm³',
    'Liter (l)': 'l',
    'Cubic millimeter (mm³)': 'mm³',
    'milliliter (ml)': 'ml',
    'Gallon (gal)': 'gal',
  };

  double convertLength(double inputValue, String sourceUnit, String targetUnit) {
    // Create a map that holds the conversion multipliers for each unit.
    Map<String, double> multiplier = {
      'Hectoliter (hl)': 1,
      'Cubic meter (m³)': 0.1,
      'Cubic centimeter (cm³)': 100000,
      'deciliter (dl)': 1000,
      'Centiliter (cl)': 10000,
      'Cubic decimeter (dm³)': 100,
      'Liter (l)': 100,
      'Cubic millimeter (mm³)': 100000000,
      'milliliter (ml)': 100000,
      'Gallon (gal)': 26.41720524,
    };
    double valueInMeters = inputValue / multiplier[sourceUnit]!;

    return valueInMeters * multiplier[targetUnit]!;
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
          title: const Row(
              children: <Widget>[
                Icon(FontAwesomeIcons.cube, color: Color(0xFF532D60)),
                SizedBox(width: 10.0),
                Text("Volume conversion",  style: TextStyle(color: Color(0xFF532D60), fontSize: 23)),
              ]
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
                                            double value = convertLength(input, dropdownValue1, dropdownValue2);
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

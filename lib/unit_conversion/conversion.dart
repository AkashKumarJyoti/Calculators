import 'package:calculators/unit_conversion/speed.dart';
import 'package:calculators/unit_conversion/temperature.dart';
import 'package:calculators/unit_conversion/volume.dart';
import 'package:calculators/unit_conversion/weight.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'area.dart';
import 'length.dart';

class ConversionPage extends StatefulWidget {
  const ConversionPage({Key? key}) : super(key: key);

  @override
  State<ConversionPage> createState() => _ConversionPageState();
}

class _ConversionPageState extends State<ConversionPage> {
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
          children: [
            Icon(FontAwesomeIcons.rightLeft, color: Color(0xFF532D60)),
            SizedBox(width: 12.0),
            Text("Unit-Conversion", style: TextStyle(
              color: Color(0xFF532D60),
              fontSize: 24.0,
            )),
          ],
        ),
        backgroundColor: const Color(0xAFC067F7),
      ),
      backgroundColor: const Color(0xFFD1C4E9),
      body: Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Container(
                    height: 140,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15.0),
                      color: Color(0x9FD32F2F)
                    ),
                    child: TextButton(
                      onPressed: ()
                      {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => Length()));
                      },
                      child: const Padding(
                        padding: EdgeInsets.only(top: 22.0),
                        child: Column(
                          children: <Widget>[
                            Icon(FontAwesomeIcons.ruler, color: Color(0xDFD32F2F), size: 33),
                            SizedBox(height: 10.0,),
                            Text("Length", style: TextStyle(
                              color: Color(0xFFD32F2F),
                              fontSize: 25,
                              fontWeight: FontWeight.w600
                            ))
                          ],
                  ),
                      ),
                    )
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Container(
                    height: 140,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15.0),
                      color: const Color(0x4F6583F1)
                    ),
                      child: TextButton(
                        onPressed: ()
                        {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => Area()));
                        },
                        child: const Padding(
                          padding: EdgeInsets.only(top: 22.0),
                          child: Column(
                            children: <Widget>[
                              Icon(FontAwesomeIcons.chartArea, color: Color(0xFF6583F1), size: 33),
                              SizedBox(height: 10.0,),
                              Text("Area", style: TextStyle(
                                  color: Color(0xFF6583F1),
                                  fontSize: 25,
                                  fontWeight: FontWeight.w600
                              ))
                            ],
                          ),
                        ),
                      )
                  ),
                ),
              )
            ],
          ),
          Row(
            children: <Widget>[
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Container(
                    height: 140,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15.0),
                      color: Color(0x6FF57805)
                    ),
                      child: TextButton(
                        onPressed: ()
                        {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => const Volume()));
                        },
                        child: const Padding(
                          padding: EdgeInsets.only(top: 22.0),
                          child: Column(
                            children: <Widget>[
                              Icon(FontAwesomeIcons.cube, color: Color(0xFFF57805), size: 33),
                              SizedBox(height: 10.0,),
                              Text("Volume", style: TextStyle(
                                  color: Color(0xFFF57805),
                                  fontSize: 25,
                                  fontWeight: FontWeight.w600
                              ))
                            ],
                          ),
                        ),
                      )
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Container(
                    height: 140,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15.0),
                      color: Color(0x3F64DD17)
                    ),
                      child: TextButton(
                        onPressed: ()
                        {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => const Speed()));
                        },
                        child: const Padding(
                          padding: EdgeInsets.only(top: 22.0),
                          child: Column(
                            children: <Widget>[
                              Icon(Icons.speed, color: Color(0xFF43A047), size: 33),
                              SizedBox(height: 10.0,),
                              Text("Speed", style: TextStyle(
                                  color: Color(0xFF43A047),
                                  fontSize: 25,
                                  fontWeight: FontWeight.w600
                              ))
                            ],
                          ),
                        ),
                      )
                  ),
                ),
              )
            ],
          ),
          Row(
            children: <Widget>[
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Container(
                    height: 140,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15.0),
                      color: Color(0x3F004D40)
                    ),
                      child: TextButton(
                        onPressed: ()
                        {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => const Weight()));
                        },
                        child: const Padding(
                          padding: EdgeInsets.only(top: 22.0),
                          child: Column(
                            children: <Widget>[
                              Icon(FontAwesomeIcons.scaleBalanced, color: Color(0xFF004D40), size: 33),
                              SizedBox(height: 10.0,),
                              Text("Weight", style: TextStyle(
                                  color: Color(0xFF004D40),
                                  fontSize: 25,
                                  fontWeight: FontWeight.w600
                              ))
                            ],
                          ),
                        ),
                      )
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Container(
                    height: 140,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15.0),
                      color: const Color(0x3FF930CD)
                    ),
                   child: TextButton(
                    onPressed: ()
                    {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => const Temperature()));
                    },
                    child: const Padding(
                      padding: EdgeInsets.only(top: 22.0),
                      child: Column(
                        children: <Widget>[
                          Icon(FontAwesomeIcons.temperatureHigh, color: Color(0xFFF930CD), size: 33),
                          SizedBox(height: 10.0,),
                          Expanded(
                            child: Text("Temperature", style: TextStyle(
                                color: Color(0xFFF930CD),
                                fontSize: 23,
                                fontWeight: FontWeight.w600
                            )),
                          )
                        ],
                      ),
                    ),
                  )
                  ),
                ),
              )
            ],
          )
        ],
      )
    );
  }
}

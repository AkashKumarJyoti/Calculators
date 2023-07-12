import 'package:calculators/bill_splitter/util/hexcolor.dart';
import 'package:flutter/material.dart';

class BillSplitter extends StatefulWidget {
  const BillSplitter({Key? key}) : super(key: key);
  @override
  State<BillSplitter> createState() => _BillSplitterState();
}

class _BillSplitterState extends State<BillSplitter> {
  int _tipPercentage = 0;
  int _personCounter = 1;
  double _billAmount = 0.0;
  final Color _purple = HexColor("#6908D6");

  bool _isDarkMode = false;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Bill Splitter",
      debugShowCheckedModeBanner: false,
      theme: _isDarkMode ? ThemeData.dark() : ThemeData.light(),
      home: Scaffold(
        appBar: AppBar(
         title: Text("Tip Calculator"),
         centerTitle: true,
         backgroundColor: _purple,
        ),
        body: Container(
          alignment: Alignment.center,
          child: Container(
            width: MediaQuery.of(context).size.width,
            padding: const EdgeInsets.all(20.5),
            child: ListView(
              scrollDirection: Axis.vertical,
              children: <Widget>[
                Container(
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 40.0, right: 70.0),
                        child: Text(
                          "Dark Mode",
                          style: TextStyle(
                            fontSize: 18,
                            fontStyle: FontStyle.italic,
                            fontWeight: FontWeight.w700,
                            color: _isDarkMode ? Colors.white : Colors.black,
                          ),
                        ),
                      ),
                      Icon(_isDarkMode ? Icons.nightlight_round: Icons.wb_sunny,
                        color: _isDarkMode ? Colors.white : Colors.black,),
                      Expanded(
                        child: SwitchListTile(
                          value: _isDarkMode,
                          onChanged: (value) {
                            setState(() {
                              _isDarkMode = value;
                            });
                          },
                          inactiveThumbColor: Colors.red,
                          activeColor: Colors.green,
                        ),
                      ),
                    ],
                  ),
                ),

                Container(
                  margin: const EdgeInsets.only(top: 30),
                  width: 150,
                  height: 150,
                  decoration: BoxDecoration(
                      color: _purple.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(12.0)),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        "Total Per Person",
                        style: TextStyle(
                            color: _purple,
                            fontSize: 15.0,
                            fontWeight: FontWeight.normal),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 8.0),
                        child: Text(
                          "\$ ${calculateTotalPerPerson(_billAmount, _personCounter, _tipPercentage)}",
                          style: TextStyle(
                              color: _purple,
                              fontWeight: FontWeight.bold,
                              fontSize: 34.9),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 20.0),
                  padding: const EdgeInsets.all(12.0),
                  decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.blueGrey.shade100,
                        style: BorderStyle.solid,
                      ),
                      borderRadius: BorderRadius.circular(12.0)),
                  child: Column(
                    children: <Widget>[
                      TextField(
                        keyboardType: const TextInputType.numberWithOptions(
                            decimal: true),
                        style: TextStyle(color: _purple),
                        decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: "Enter the bill",
                            prefixText: "Bill Amount: ",
                            prefixIcon: Icon(Icons.attach_money)),
                        onChanged: (String value) {
                          try {
                            _billAmount = double.parse(value);
                          } catch (exception) {
                            _billAmount = 0.0;
                          }
                        },
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text(
                            "Split",
                            style: TextStyle(color: Colors.grey.shade700),
                          ),
                          Row(
                            children: <Widget>[
                              InkWell(
                                onTap: () {
                                  setState(() {
                                    if (_personCounter > 1) {
                                      _personCounter--;
                                    } else {}
                                  });
                                },
                                child: Container(
                                  width: 40,
                                  height: 40,
                                  margin: const EdgeInsets.all(10.0),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(7.0),
                                    color: _purple.withOpacity(0.1),
                                  ),
                                  child: Center(
                                    child: Text(
                                      "-",
                                      style: TextStyle(
                                          color: _purple,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 17.0),
                                    ),
                                  ),
                                ),
                              ),
                              Text(
                                "$_personCounter",
                                style: TextStyle(
                                    color: _purple, fontSize: 17.0),
                              ),
                              InkWell(
                                onTap: () {
                                  setState(() {
                                    _personCounter++;
                                  });
                                },
                                child: Container(
                                  width: 40.0,
                                  height: 40.0,
                                  margin: const EdgeInsets.all(10.0),
                                  decoration: BoxDecoration(
                                    color: _purple.withOpacity(0.1),
                                    borderRadius: BorderRadius.circular(7.0),
                                  ),
                                  child: Center(
                                    child: Text(
                                      "+",
                                      style: TextStyle(
                                          color: _purple,
                                          fontSize: 17.0,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                ),
                              )
                            ],
                          )
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text(
                            "Tip",
                            style: TextStyle(color: Colors.grey.shade700),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(right: 10.0),
                            child: Text(
                              "\$ ${(calculateTotalTip(_billAmount, _personCounter, _tipPercentage)).toStringAsFixed(2)}",
                              style: TextStyle(
                                  color: _purple,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 17),
                            ),
                          )
                        ],
                      ),
                      Column(
                        children: <Widget>[
                          Text(
                            "$_tipPercentage%",
                            style: TextStyle(
                                color: _purple,
                                fontSize: 17.0,
                                fontWeight: FontWeight.bold),
                          ),
                          Slider(
                              min: 0,
                              max: 100,
                              activeColor: _purple,
                              inactiveColor: Colors.grey,
                              divisions: 10,
                              value: _tipPercentage.toDouble(),
                              onChanged: (double value) {
                                setState(() {
                                  _tipPercentage = value.round();
                                });
                              })
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  calculateTotalPerPerson(
      double billAmount, int splitBy, int tipPercentage) {
    var totalPerPerson =
        (calculateTotalTip(billAmount, splitBy, tipPercentage) + billAmount) /
            splitBy;
    return totalPerPerson.toStringAsFixed(2);
  }

  calculateTotalTip(double billAmount, int splitBy, int tipPercentage) {
    double totalTip = 0.0;
    if (billAmount < 0 || billAmount.toString().isEmpty) {
    } else {
      totalTip = (billAmount * tipPercentage) / 100;
    }
    return totalTip;
  }

}

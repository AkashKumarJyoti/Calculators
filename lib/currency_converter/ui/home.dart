import 'package:flutter/material.dart';
import '../model/exchange_rates.dart';
import '../parsing/functions.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  var result = "Your answer";

  Color primary = const Color(0xD0FF3D00);
  Color background = const Color(0xFFFF8A65);
  late Future allCurrencies;
  late Future<RatesModel> values;
  final TextEditingController _amountController = TextEditingController();
  GlobalKey<FormState> formkey = GlobalKey();
  String dropdownValue1 = 'INR';
  String dropdownValue2 = 'USD';

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    allCurrencies = fetchcurrencies();
    values = fetchRates();
  }

  @override
  Widget build(BuildContext context) {
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            "Currency Exchange",
            style: TextStyle(color: Color(0xFF2E7D32), fontSize: 23),
          ),
          // backgroundColor: const Color(0xFFA5D6A7),
          centerTitle: true,

          flexibleSpace: Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Color(0x8F4CAF50),
                  // Color(0xAFEF5350),
                  Color(0xFFFFF59D),
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
          ),
        ),
        backgroundColor: Color(0xFFC8E6C9),
        body: Container(
          padding: const EdgeInsets.all(10.0),
          child: ListView(
            children: [
              Column(
                children: [
                  Form(
                    key: formkey,
                    child: FutureBuilder(
                      future: values,
                      builder: (BuildContext context,
                          AsyncSnapshot<dynamic> snapshot1) {
                        if (snapshot1.connectionState ==
                            ConnectionState.waiting) {
                          return const Center(
                              child: (CircularProgressIndicator(color: Color(0xFF33691E))));
                        }
                        return FutureBuilder(
                          future: allCurrencies,
                          builder: (BuildContext context,
                              AsyncSnapshot<dynamic> snapshot2) {
                            if (snapshot2.connectionState ==
                                ConnectionState.waiting) {
                              return const Center(
                                  child: CircularProgressIndicator(color: Color(0xFF004D40),));
                            }
                            return converter(snapshot1.data, snapshot2.data);
                          },
                        );
                      },
                    ),
                  ),
                  const SizedBox(height: 15.0),
                  Container(
                      // width: w,
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
                                    color: Colors.grey, width: 1.0), // Set border color and width
                              ),
                            child: Container(
                              // width: w,
                              height: 90,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15.0),
                                gradient: const LinearGradient(
                                  colors: [
                                    Color(0xF0E6EE9C),
                                    Color(0xDF66BB6A),
                                    Color(0xAFAFB42B)
                                  ], // Use the desired colors in the list
                                  begin: Alignment.topLeft,
                                  end: Alignment.bottomRight,
                                ),
                            ),
                             child: Center(child: Text(result, style: const TextStyle(
                               color: Color(0xFFFF7043),
                               fontSize: 23
                             ),))
                          ))))
                ],
              )
            ],
          ),
        ));
  }

  Widget converter(RatesModel rates, currencies) {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0),
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
                    Color(0xFAFFD54F),
                    Color(0xAFA5D6A7),
                    Color(0xAFFFB74D)
                  ], // Use the desired colors in the list
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius: BorderRadius.circular(15.0)),
            padding: const EdgeInsets.all(20),
            child: Column(
              children: <Widget>[
                TextField(
                  controller: _amountController,
                  keyboardType:
                      const TextInputType.numberWithOptions(decimal: true),
                  decoration: const InputDecoration(
                      hintText: "Enter the amount",
                      border: OutlineInputBorder()),
                ),
                const SizedBox(height: 20.0),
                const Text("Select Currencies",
                    style: TextStyle(
                        color: Color(0xFF2E7D32),
                        fontWeight: FontWeight.w500,
                        fontSize: 20.0,
                        fontStyle: FontStyle.italic)),
                const SizedBox(height: 20.0),
                SizedBox(width: 10.0),
                Expanded(
                  child: DropdownButton<String>(
                    value: dropdownValue1,
                    icon: const Icon(Icons.arrow_drop_down_rounded),
                    iconSize: 24,
                    elevation: 16,
                    isExpanded: true,
                    underline: Container(
                      height: 2,
                      color: Colors.grey.shade400,
                    ),
                    onChanged: (String? newValue) {
                      setState(() {
                        dropdownValue1 = newValue!;
                      });
                    },
                    items: currencies.keys.toSet().toList().map<DropdownMenuItem<String>>((key) {
                      final countryName = currencies[key]!;
                      final maxLength = 30; // Set your desired maximum length here
                      final displayCountryName = countryName.length > maxLength
                          ? countryName.substring(0, maxLength) + "..." // Truncate long names
                          : countryName;

                      return DropdownMenuItem<String>(
                        value: key,
                        child: Row(
                          children: [
                            Text(key), // Display the key
                            const SizedBox(width: 10), // Add some spacing between key and value
                            Text(displayCountryName), // Display the truncated name
                          ],
                        ),
                      );
                    }).toList(),
                  ),
                ),

                // SizedBox(height: 10),
                Container(
                    child: Icon(Icons.arrow_circle_down)),
                // SizedBox(height: 10),
                Expanded(
                  child: DropdownButton<String>(
                    value: dropdownValue2,
                    icon: const Icon(Icons.arrow_drop_down_rounded),
                    iconSize: 24,
                    elevation: 16,
                    isExpanded: true,
                    underline: Container(
                      height: 2,
                      color: Colors.grey.shade400,
                    ),
                    onChanged: (String? newValue) {
                      setState(() {
                        dropdownValue2 = newValue!;
                      });
                    },
                    items: currencies.keys.toSet().toList().map<DropdownMenuItem<String>>((key) {
                      final countryName = currencies[key]!;
                      final maxLength = 30; // Set your desired maximum length here
                      final displayCountryName = countryName.length > maxLength
                          ? countryName.substring(0, maxLength) + "..." // Truncate long names
                          : countryName;

                      return DropdownMenuItem<String>(
                        value: key,
                        child: Row(
                          children: [
                            Text(key), // Display the key
                            const SizedBox(width: 10), // Add some spacing between key and value
                            Text(displayCountryName), // Display the truncated name
                          ],
                        ),
                      );
                    }).toList(),
                  ),
                ),


                const SizedBox(height: 20.0),
                ClipRRect(
                  borderRadius: BorderRadius.circular(15.0),
                  child: TextButton(
                    onPressed: ()
                    {
                      setState(() {
                        result = '${_amountController.text} $dropdownValue1 = ${convertany(rates, _amountController.text,
                                dropdownValue1, dropdownValue2)} $dropdownValue2';
                      });
                    },
                    child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15.0),
                          gradient: const LinearGradient(
                            colors: [Color(0x8AEC407A),
                              Color(0x7A7E57C2),
                              Color(0x8FF44336)],
                            // Use the desired colors in the list
                            begin: Alignment.topRight,
                            end: Alignment.bottomLeft,
                          ),
                        ),
                        child: const Padding(
                          padding: EdgeInsets.all(18.0),
                          child: Text(
                            "Calculate",
                            style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w700,
                                color: Color(0xFF004D40),
                                fontStyle: FontStyle.italic),
                          ),
                        )),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  String convertany(RatesModel exchangeRates, String amount, String currencybase,
      String currencyfinal) {
    String output = (double.parse(amount) /
        exchangeRates.rates[currencybase]! *
        exchangeRates.rates[currencyfinal]!)
        .toStringAsFixed(2)
        .toString();

    return output;
  }
}

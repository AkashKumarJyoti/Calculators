import 'package:flutter/material.dart';

class Collection extends StatefulWidget {
  const Collection({Key? key}) : super(key: key);

  @override
  State<Collection> createState() => _CollectionState();
}

class _CollectionState extends State<Collection> {
  Color text = const Color(0xFFFF5722);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Text("Hi", style: design()),
              Text("User", style: design()),
            ],
          ),
          Container(
            color: Color(0xFF8BC34A),
          )
        ],
      ),
    );
  }

  design() {
    TextStyle(
      color: text,
      fontSize: 30,
      fontWeight: FontWeight.w600
    );
  }
}

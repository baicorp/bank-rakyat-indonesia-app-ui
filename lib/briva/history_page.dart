import 'package:flutter/material.dart';

class HistoryPage extends StatefulWidget {
  HistoryPage({Key? key, required this.brivaNumber}) : super(key: key);

  String brivaNumber;

  Widget name() {
    return HistoryPage(brivaNumber: brivaNumber);
  }

  @override
  State<HistoryPage> createState() => _HistoryPageState();
}

class _HistoryPageState extends State<HistoryPage> {
  List<HistoryPage> boxModel = [];

  void createBox() {
    setState(() {
      boxModel.add(HistoryPage(
        brivaNumber: '',
      ));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 5.0),
      child: Column(
        children: [
          Image.asset(
            'assets/icons/briva-icon.jpg',
            width: 50.0,
          ),
          const Text(
            'PT ABC',
            style: TextStyle(
                color: Colors.black,
                fontFamily: 'Roboto',
                fontWeight: FontWeight.bold,
                fontSize: 12.5),
          ),
          Text(
            widget.brivaNumber,
            style: TextStyle(
              fontFamily: 'Roboto',
              color: Colors.grey[500],
              fontSize: 10.0,
            ),
          )
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';

class DetailData extends StatelessWidget {
  final String title;
  final String data;

  DetailData(this.title, this.data);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text(
            this.title,
            style: TextStyle(fontSize: 15),
          ),
          Text(
            this.data,
            style: TextStyle(fontSize: 25),
          ),
        ],
      ),
    );
  }
}

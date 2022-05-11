import 'package:flutter/material.dart';

class ItemSummary extends StatelessWidget {
  ItemSummary(this.title, this.value);
  String title;
  String value;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(20),
      elevation: 10,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: Container(
        width: double.infinity,
        height: 150,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Colors.blue,
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                title,
                style: TextStyle(fontSize: 12),
              ),
              Text(
                value,
                style: TextStyle(fontSize: 25),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

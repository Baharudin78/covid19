import 'dart:convert';

import 'package:covid19/models/summary.dart';
import 'package:covid19/widget/item_summary.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class HomePage extends StatelessWidget {
  late Summary dataSummary;

  Future getSummary() async {
    var response = await http.get(
      Uri.parse("https://covid19.mathdro.id/api"),
    );
    Map<String, dynamic> data =
        json.decode(response.body) as Map<String, dynamic>;
    dataSummary = Summary.fromJson(data);
    print(dataSummary.confirmed.value);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Covid19"),
      ),
      body: FutureBuilder(
          future: getSummary(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: Text("Loading...."),
              );
            }
            return Column(
              children: [
                ItemSummary("Confirmed", "${dataSummary.confirmed.value}"),
                ItemSummary("Death", "${dataSummary.deaths.value}"),
              ],
            );
          }),
    );
  }
}

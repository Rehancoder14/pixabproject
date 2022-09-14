import 'dart:convert';
import 'dart:html';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../pages/appbar.dart';
import 'apikey.dart';

class CheckPage extends StatelessWidget {
  const CheckPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const MyAppBar(),
      body: Material(
        color: Colors.white,
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2),
          itemBuilder: ((context, index) {
            return Card(
              clipBehavior: Clip.antiAlias,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15)),
              //*************************************************************************************************** */
              child: GridTile(
                footer: const Text(
                  "nature",
                  textAlign: TextAlign.center,
                ),
                child: Image.asset("assets/Rlogo.png"),
              ),
            );
          }),
        ),
      ),
    );
  }
}

Future<Map> getPics() async {
  String url =
      "https://pixabay.com/api/?key=$apikey&q=yellow+flowers&image_type=photo&pretty=true";
  http.Response response = await http.get(Uri.http(url));
  return json.decode(response.body);
}

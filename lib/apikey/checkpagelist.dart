import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:pixabayproject/pages/appbar.dart';

import 'package:http/http.dart' as http;

import 'apikey.dart';

class CheckList extends StatefulWidget {
  const CheckList({super.key});

  @override
  State<CheckList> createState() => _CheckListState();
}

class _CheckListState extends State<CheckList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const MyAppBar(),
      body: FutureBuilder(
        future: getPics(),
        builder: (context, snapshot) {
          Map data = snapshot.requireData;
          if (snapshot.hasError) {
            return GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2),
              itemBuilder: ((context, index) {
                return Card(
                  clipBehavior: Clip.antiAlias,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15)),

                  //**************************************************************** */
                  child: const GridTile(
                    footer: Text(
                      "nature",
                      textAlign: TextAlign.center,
                    ),
                    child: CircularProgressIndicator(),
                  ),
                );
              }),
            );
          } else if (snapshot.hasData) {
            return Center(
              child: GridView.builder(
                itemCount: 18,
                itemBuilder: (context, index) {
                  return Card(
                    clipBehavior: Clip.antiAlias,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15)),
                    child: Column(
                      children: [
                        const Padding(padding: EdgeInsets.all(5.0)),
                        Image.network(
                          '${data['hits'][index]['largeImageURL']}',
                          fit: BoxFit.contain,
                        )
                      ],
                    ),
                  );
                },
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2),
              ),
            );
          } else if (!snapshot.hasData) {
            return const Center(child: CircularProgressIndicator());
          }
          return GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2),
            itemBuilder: ((context, index) {
              return Card(
                clipBehavior: Clip.antiAlias,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15)),
                child: GridTile(
                  footer: const Text(
                    "nature",
                    textAlign: TextAlign.center,
                  ),
                  child: Image.asset("assets/Rlogo.png"),
                ),
              );
            }),
          );
        },
      ),
    );
  }
}

Future<Map> getPics() async {
  Uri url = Uri.parse(
      "https://pixabay.com/api/?key=$apikey&q=cars&image_type=photo&pretty=true");
  http.Response response = await http.get(url);
  return json.decode(response.body);
}

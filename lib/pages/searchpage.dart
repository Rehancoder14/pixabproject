import 'package:flutter/material.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.only(left: 15, right: 15),
        child: Column(children: [
          const SizedBox(
            height: 60,
          ),
          TextField(
            cursorHeight: 20,
            autofocus: false,
            controller: TextEditingController(),
            decoration: InputDecoration(
              hintText: "Search here....",
              contentPadding:
                  const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30),
                borderSide: const BorderSide(color: Colors.grey, width: 2),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30),
                borderSide: const BorderSide(color: Colors.grey, width: 1.5),
              ),
              focusedBorder: OutlineInputBorder(
                gapPadding: 0.0,
                borderRadius: BorderRadius.circular(30),
                borderSide: const BorderSide(color: Colors.green, width: 1.5),
              ),
            ),
          )
        ]),
      ),
    );
  }
}

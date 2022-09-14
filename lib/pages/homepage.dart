import 'package:flutter/material.dart';
import 'package:pixabayproject/apikey/checkpagelist.dart';
import 'package:pixabayproject/pages/newpage1.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const CheckList()));
        },
        label: const Text("Next..."),
        icon: const Icon(Icons.arrow_forward_ios_outlined),
      ),
      body: Column(children: const [
        SizedBox(
          height: 200,
        ),
        Center(child: Image(image: AssetImage("assets/Rlogo.png"))),
        SizedBox(
          height: 20,
        ),
        Center(
          child: Text(
            "Download Images and Videos",
            style: TextStyle(
                fontFamily: "times new roman",
                fontSize: 18,
                fontWeight: FontWeight.bold),
          ),
        ),
        SizedBox(
          height: 10,
        ),
      ]),
    );
  }
}

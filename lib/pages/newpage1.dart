import 'package:flutter/material.dart';

import 'package:pixabayproject/pages/appbar.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

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

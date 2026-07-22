import 'package:flutter/material.dart';

class Favourite extends StatefulWidget {
  const Favourite({super.key});

  @override
  State<Favourite> createState() => _FavouriteState();
}

class _FavouriteState extends State<Favourite> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Favourites"),
        backgroundColor: Colors.lightGreenAccent.shade400,
      ),
      body: Container(child: ListView(children: [Container()])),
    );
  }
}

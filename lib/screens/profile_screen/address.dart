import 'package:flutter/material.dart';

class Address extends StatefulWidget {
  const Address({super.key});

  @override
  State<Address> createState() => _AddressState();
}

class _AddressState extends State<Address> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Address"),
        backgroundColor: Colors.lightGreenAccent.shade400,
      ),
      body: Container(child: ListView(children: [Container()])),
    );
  }
}

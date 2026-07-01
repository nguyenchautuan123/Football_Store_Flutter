import 'package:flutter/material.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';

class AddressAndContact extends StatefulWidget {
  const AddressAndContact({super.key});

  @override
  State<AddressAndContact> createState() => _AddressAndContactState();
}

class _AddressAndContactState extends State<AddressAndContact> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Address and Contact"),
        backgroundColor: Colors.lightGreenAccent.shade400,
      ),
      body: Container(
        child: ListView(
          children: [
            Container(

            ),
          ],
        ),
      ),
    );
  }
}
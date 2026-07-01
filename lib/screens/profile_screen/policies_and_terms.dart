import 'package:flutter/material.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';

class PoliciesAndTerms extends StatefulWidget {
  const PoliciesAndTerms({super.key});

  @override
  State<PoliciesAndTerms> createState() => _PoliciesAndTermsState();
}

class _PoliciesAndTermsState extends State<PoliciesAndTerms> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Policies and Terms"),
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
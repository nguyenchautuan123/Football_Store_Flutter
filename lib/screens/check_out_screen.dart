import 'package:flutter/material.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';

import '../widgets/check_out_address.dart';

class CheckOutScreen extends StatefulWidget {
  const CheckOutScreen({super.key});

  @override
  State<CheckOutScreen> createState() => _CheckOutScreenState();
}

class _CheckOutScreenState extends State<CheckOutScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Check out"),
        backgroundColor: Colors.lightGreenAccent.shade400,
      ),
      body: Container(
        child: ListView(
          children: [
            Container(
              padding: EdgeInsets.all(10),
              child: CheckOutAddress(
                ten_kh: 'Logan Nguyen',
                so_dien_thoai: '0765769409',
                email: 'chautuan1708@gmail.com',
                dia_chi: 'Vinh Loc A, Binh Chanh, TP Ho Chi Minh',
              ),
            ),
          ],
        ),
      ),
    );
  }
}

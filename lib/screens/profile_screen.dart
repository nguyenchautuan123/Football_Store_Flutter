// ĐÂY LÀ TRANG PROFILE CỦA ỨNG DỤNG

import 'package:flutter/material.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text("Profile"),
          backgroundColor: Colors.lightGreenAccent.shade400,
        ),
        body: Container(

        ),
      ),
    );
  }
}
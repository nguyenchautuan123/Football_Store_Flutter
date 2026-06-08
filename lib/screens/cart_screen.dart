// ĐÂY LÀ TRANG GIỎ HÀNG CỦA ỨNG DỤNG

import 'package:flutter/material.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text("Cart"),
          backgroundColor: Colors.lightGreenAccent.shade400,
        ),
        body: Container(

        ),
      ),
    );
  }
}
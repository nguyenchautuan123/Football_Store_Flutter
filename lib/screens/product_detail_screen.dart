// ĐÂY LÀ TRANG HIỂN THỊ CHI TIẾT SẢN PHẨM

import 'package:flutter/material.dart';

class ProductDetailScreen extends StatefulWidget {
  const ProductDetailScreen({super.key});

  @override
  State<ProductDetailScreen> createState() => _ProductDetailScreenState();
}

class _ProductDetailScreenState extends State<ProductDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text("Detail"),
          backgroundColor: Colors.lightGreenAccent.shade400,
        ),
        body: Container(

        ),
      ),
    );
  }
}
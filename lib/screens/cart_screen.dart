// ĐÂY LÀ TRANG GIỎ HÀNG CỦA ỨNG DỤNG

import 'package:flutter/material.dart';

import '../widgets/cart_item.dart';
import '../widgets/price_text.dart';

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
          child: ListView(
            children: [
              Container(
                padding: EdgeInsets.all(10),
                child: CartItem(
                    anh_san_pham: 'https://thumblr.uniid.it/product/462700/e4d5c6fd4e11.jpg?width=1920&format=webp&q=75',
                    ten_san_pham: 'Nike Tiempo Ligera Pro FG',
                    ma_danh_muc: 'Giày bóng đá sân cỏ tự nhiên',
                    size: '44',
                    so_luong: '1',
                    gia_san_pham: '120',
                    onTap: () {},
                    onLongPress: () {}
                ),
              ),
              const Divider(
                color: Colors.grey, // Màu sắc đường kẻ
                thickness: 1.5,     // Độ dày của đường kẻ
                indent: 20,         // Khoảng trống cách lề trái
                endIndent: 20,      // Khoảng trống cách lề phải
              ),
              Container(
                padding: const EdgeInsets.all(20),
                width: double.infinity,
                height: 120,
                child: ListView(
                  children: [
                    Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Subtotal', style: TextStyle( fontSize: 18)),
                          PriceText(amount: 120, style: TextStyle( fontSize: 18),)
                        ],
                      ),
                    ),
                    Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Shipping', style: TextStyle( fontSize: 18)),
                          PriceText(amount: 0, style: TextStyle( fontSize: 18),)
                        ],
                      ),
                    ),
                    Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Estimated total', style: TextStyle( fontSize: 18, fontWeight: FontWeight.bold)),
                          PriceText(amount: 120, style: TextStyle( fontSize: 18, fontWeight: FontWeight.bold),)
                        ],
                      ),
                    )
                  ],
                ),
              ),
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(20),
                child: ElevatedButton.icon(
                  onPressed: (){},
                  icon: const Icon(Icons.check_outlined),
                  label: const Text('Check out'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.lightGreenAccent.shade400,
                    foregroundColor: Colors.white,
                    shadowColor: Colors.white,
                    minimumSize: const Size(double.infinity, 50),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5), // Bo góc 12px (Muốn nút tròn xoe thì tăng lên 30+)
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
// ĐÂY LÀ TRANG HIỂN THỊ CHI TIẾT SẢN PHẨM

import 'package:flutter/material.dart';

import 'package:input_quantity/input_quantity.dart';
import '../widgets/shoe_size_picker.dart';

class ProductDetailScreen extends StatefulWidget {
  const ProductDetailScreen({super.key});

  @override
  State<ProductDetailScreen> createState() => _ProductDetailScreenState();
}

class _ProductDetailScreenState extends State<ProductDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Detail"),
        backgroundColor: Colors.lightGreenAccent.shade400,
      ),
      body: Container(
        child: ListView(
          children: [
            Container(
              child: Image.network('https://thumblr.uniid.it/product/462700/e4d5c6fd4e11.jpg?width=1920&format=webp&q=75'),
            ),
            Container(
              padding: EdgeInsets.all(10),
              child: Text(
                'Nike Tiempo Ligera Pro FG',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 28),
              ),
            ),
            Container(
              padding: EdgeInsets.all(10),
              child: Text(
                'Giày bóng đá sân cỏ tự nhiên',
                style: TextStyle(fontSize: 18),
              ),
            ),
            Container(
              padding: EdgeInsets.all(10),
              child: Row(
                children: [
                  Icon(Icons.attach_money),
                  Text(
                    '120',
                    style: TextStyle(fontSize: 18),
                  ),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.all(10),
              child: ShoeSizePicker(),
            ),
            Container(
              width: double.infinity,
              padding: EdgeInsets.all(10),
              child: Row(
                children: [
                  Expanded(
                    flex: 8,
                    child: ElevatedButton.icon(
                      onPressed: (){},
                      icon: const Icon(Icons.shopping_cart),
                      label: const Text('Add to cart'),
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
                  ),
                  SizedBox(width: 5,),
                  Expanded(
                    flex: 2,
                    child: IconButton(
                      icon: const Icon(Icons.favorite_outline),
                      color: Colors.black, // Màu của icon
                      onPressed: () {},
                      style: IconButton.styleFrom(
                        fixedSize: const Size(double.infinity, 50),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Product description',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
                  ),
                  Text(
                    'Worn at the highest level by adidas athletes including Lamine Yamal, Ousmane Dembélé and Florian Wirtz \n'
                        'Every aspect of the F50 EVO has been crafted with lightness in mind to deliver a game changing design that enables quicker play and sharper changes of direction throughout the pitch \n '
                        'Ultra-light F50 SHELL EVO mesh upper engineered to reduce weight and reveal the inside \n'
                        'F50 CAGE+ features an adaptive TPU structure and a hyper-light midsole system, providing stability and support for fast cuts and agile movement \n'
                        'FLOATING TONGUE in a featherlight premium material that wraps seamlessly around the foot for optimal lockdown of the heel and foot, reducing slippage in the boot for better control of your movement \n'
                        'The F50 SPEEDSYSTEM EVO is a super lightweight soleplate with a full-length LX plate and bladed studs designed for fast cuts, while the tooling core adds structural stiffness \n'
                        'Classic adaptive lacing system for a secure and personalized fit \n'
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
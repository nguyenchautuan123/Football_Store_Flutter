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
                      'Approved by global superstars including Estêvão, Jamal Musiala and Phil FodenBuilt for the mad dribblers, the players who see no defence as too tight, no challenge as too big and no move as too risky, the all-	new Tiempo becomes their ultimate weapon of precision, control and fearlessnessThe buttery soft Techleather upper fits perfectly to your foot like a glove-like fit, offering 17% more coverage than previous 	models for a smoother, more cohesive feel, while being lighter, softer and absorbing 29% less water than natural leather for 	consistent touch and comfort in all conditionsTapered studs provide optimum traction while improving support and durabilityWith a classic adaptive lacing systemThis is a football boot with FG studs for use on natural grass pitches.'
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
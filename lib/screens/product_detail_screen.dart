// ĐÂY LÀ TRANG HIỂN THỊ CHI TIẾT SẢN PHẨM

import 'package:flutter/material.dart';
import '../widgets/shoe_size_picker.dart';
import '../models/product_model.dart';
import '../models/product_size_model.dart';

class ProductDetailScreen extends StatefulWidget {
  final ProductModel product;

  const ProductDetailScreen({super.key, required this.product});

  @override
  State<ProductDetailScreen> createState() => _ProductDetailScreenState();
}

class _ProductDetailScreenState extends State<ProductDetailScreen> {
  ProductSizeModel? _selectedSize;
  int _selectedSizeQuantity = 1;

  @override
  Widget build(BuildContext context) {
    final product = widget.product;

    return Scaffold(
      appBar: AppBar(
        title: Text(product.ten_san_pham ?? ''),
        backgroundColor: Colors.lightGreenAccent.shade400,
      ),
      body: Container(
        child: ListView(
          children: [
            Container(
              child: Image.network(
                product.anh_san_pham ?? '',
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) => const SizedBox(
                  height: 250,
                  child: Center(child: Icon(Icons.broken_image, size: 80)),
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.all(10),
              child: Text(
                product.ten_san_pham ?? 'nill',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 28),
              ),
            ),
            Container(
              padding: EdgeInsets.all(10),
              child: Text(
                'Thương hiệu: ${product.thuong_hieu?.ten_thuong_hieu ?? 'null'}',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
            Container(
              padding: EdgeInsets.all(10),
              child: Text(
                product.danh_muc?.ten_danh_muc ?? 'null',
                style: TextStyle(fontSize: 18),
              ),
            ),
            Container(
              padding: EdgeInsets.all(10),
              child: Row(
                children: [
                  Icon(Icons.attach_money),
                  Text(
                    product.gia_san_pham.toString(),
                    style: TextStyle(fontSize: 18),
                  ),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.all(10),
              child: ShoeSizePicker(
                sizes: product.sizes ?? [],
                onChanged: (selectedSize, quantity) {
                  setState(() {
                    _selectedSize = selectedSize;
                    _selectedSizeQuantity = quantity;
                  });
                },
              ),
            ),
            Container(
              width: double.infinity,
              padding: EdgeInsets.all(10),
              child: Row(
                children: [
                  Expanded(
                    flex: 8,
                    child: ElevatedButton.icon(
                      onPressed: () {},
                      icon: const Icon(Icons.shopping_cart),
                      label: const Text('Add to cart'),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.lightGreenAccent.shade400,
                        foregroundColor: Colors.white,
                        shadowColor: Colors.white,
                        minimumSize: const Size(double.infinity, 50),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(
                            5,
                          ), // Bo góc 12px (Muốn nút tròn xoe thì tăng lên 30+)
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 5),
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
                    (product.mo_ta_san_pham != null &&
                            product.mo_ta_san_pham!.isNotEmpty)
                        ? product.mo_ta_san_pham!
                        : 'No description',
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

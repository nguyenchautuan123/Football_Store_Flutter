// ĐÂY LÀ WIDGET THẺ HIỂN THỊ SẢN PHẨM

import 'package:flutter/material.dart';

class ProductCard extends StatelessWidget {
  final String ten_san_pham;
  final String anh_san_pham;
  final String gia_san_pham;
  final String ma_danh_muc;
  final VoidCallback? onTap;
  final VoidCallback? onLongPress;

  const ProductCard({
    super.key,
    required this.ten_san_pham,
    required this.anh_san_pham,
    required this.gia_san_pham,
    required this.ma_danh_muc,
    required this.onTap,
    required this.onLongPress,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      onLongPress: onLongPress,
      child: Container(
        width: 180,
        height: 350,
        clipBehavior: Clip.antiAlias,
        decoration: BoxDecoration(
          color: Colors.grey[200],
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          children: [
            ClipRect(
              child: Image.network(
                anh_san_pham,
                width: 200,
                height: 150,
                fit: BoxFit.cover,
                errorBuilder: (context, index, stackTrace) => Container(
                  width: 200,
                  height: 150,
                  color: Colors.grey[400],
                  child: const Icon(Icons.broken_image, color: Colors.grey),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    ten_san_pham,
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    ma_danh_muc,
                    style: TextStyle(fontStyle: FontStyle.italic,),
                  ),
                  SizedBox(height: 10,),
                  Row(
                    children: [
                      Icon(Icons.attach_money),
                      Text(
                        gia_san_pham,
                        style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold, ),
                      ),
                    ],
                  ),
                  SizedBox(height: 10,),
                  // ElevatedButton.icon(
                  //   onPressed: () {},
                  //   icon: const Icon(Icons.shopping_cart),
                  //   label: const Text('Buy'),
                  //   style: ElevatedButton.styleFrom(
                  //     backgroundColor: Colors.lightGreenAccent.shade400,
                  //     foregroundColor: Colors.white,
                  //     shadowColor: Colors.white,
                  //     minimumSize: const Size(200, 50),
                  //     shape: RoundedRectangleBorder(
                  //       borderRadius: BorderRadius.circular(5), // Bo góc 12px (Muốn nút tròn xoe thì tăng lên 30+)
                  //     ),
                  //   ),
                  // ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
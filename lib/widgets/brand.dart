import 'package:flutter/material.dart';

class Brand extends StatelessWidget {
  final String ten_thuong_hieu;
  final String anh_thuong_hieu;
  final VoidCallback? onTap;
  final VoidCallback? onLongPress;

  const Brand({
    super.key,
    required this.ten_thuong_hieu,
    required this.anh_thuong_hieu,
    required this.onTap,
    required this.onLongPress,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      onLongPress: onLongPress,
      child: Container(
        child: Column(
          // Căn giữa theo chiều dọc
          mainAxisAlignment: MainAxisAlignment.center,
          // Căn giữa theo chiều ngang
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ClipRRect(
              borderRadius: BorderRadiusGeometry.circular(5),
              child: Image.network(
                anh_thuong_hieu, width: 120, height: 100, fit: BoxFit.cover,
                errorBuilder: (_, __, ___) =>
                const Icon(Icons.branding_watermark, size: 50, color: Colors.black),
              ),
            ),
            Text(
              ten_thuong_hieu, style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
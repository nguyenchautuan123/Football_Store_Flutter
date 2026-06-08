import 'package:flutter/material.dart';

class Category extends StatelessWidget {
  final String ten_danh_muc;
  final String anh_danh_muc;
  final VoidCallback? onTap;
  final VoidCallback? onLongPress;

  const Category({
    super.key,
    required this.ten_danh_muc,
    required this.anh_danh_muc,
    required this.onTap,
    required this.onLongPress,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      onLongPress: onLongPress,
      child: Container(
        padding: EdgeInsets.all(5),
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              ten_danh_muc,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
            ),
            ClipRRect(
              borderRadius: BorderRadiusGeometry.circular(10),
              child: Image.network(
                anh_danh_muc,
                width: double.infinity,
                height: 150,
                fit: BoxFit.cover,
                errorBuilder: (context, index, stackTrace) => Container(
                  width: double.infinity,
                  height: 150,
                  color: Colors.grey[400],
                  child: const Icon(Icons.broken_image, color: Colors.grey),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
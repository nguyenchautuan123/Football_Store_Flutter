import 'package:flutter/material.dart';

class CheckOutAddress extends StatelessWidget {
  final String ten_kh;
  final String so_dien_thoai;
  final String email;
  final String dia_chi;
  final VoidCallback? onTap;
  final VoidCallback? onLongPress;

  const CheckOutAddress({
    super.key,
    required this.ten_kh,
    required this.so_dien_thoai,
    required this.email,
    required this.dia_chi,
    this.onTap,
    this.onLongPress,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      onLongPress: onLongPress,
      child: Container(
        padding: EdgeInsets.all(10),
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.grey[200],
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(Icons.location_on),
                Text(
                  "Location",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),
              ],
            ),
            Text(
              ten_kh,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
            Text("Phone number: $so_dien_thoai"),
            Text("Email: $email"),
            Text("Address: $dia_chi"),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

class PriceText extends StatelessWidget {
  final double amount;
  final TextStyle? style;

  const PriceText({
    super.key,
    required this.amount,
    this.style,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      '\$${amount.toStringAsFixed(2)}', // Tự động định dạng 2 chữ số thập phân (Ví dụ: $120.00)
      style: style ?? const TextStyle(),
    );
  }
}
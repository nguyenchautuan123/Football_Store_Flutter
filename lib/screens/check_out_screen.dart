import 'package:flutter/material.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';

import '../widgets/check_out_address.dart';
import '../widgets/check_out_item.dart';
import '../widgets/price_text.dart';

class CheckOutScreen extends StatefulWidget {
  const CheckOutScreen({super.key});

  @override
  State<CheckOutScreen> createState() => _CheckOutScreenState();
}

enum Payment_Method { cash_on_delivery, bank_account }

class _CheckOutScreenState extends State<CheckOutScreen> {
  Payment_Method? _selectedMethod = Payment_Method.cash_on_delivery;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Check out"),
        backgroundColor: Colors.lightGreenAccent.shade400,
      ),
      body: Container(
        child: ListView(
          children: [
            Container(
              padding: EdgeInsets.all(10),
              child: CheckOutAddress(
                ten_kh: 'Logan Nguyen',
                so_dien_thoai: '0765769409',
                email: 'chautuan1708@gmail.com',
                dia_chi: 'Vinh Loc A, Binh Chanh, TP Ho Chi Minh',
              ),
            ),
            Container(
              padding: EdgeInsets.all(10),
              margin: EdgeInsets.all(10),
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
              ),
              child: ListView(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                children: [
                  CheckOutItem(
                    anh_san_pham:
                        'https://thumblr.uniid.it/product/462700/e4d5c6fd4e11.jpg?width=1920&format=webp&q=75',
                    ten_san_pham: 'Nike Tiempo Ligera Pro FG',
                    ma_danh_muc: 'Giày bóng đá sân cỏ tự nhiên',
                    size: '44',
                    so_luong: '1',
                    gia_san_pham: '120',
                    onTap: () {},
                    onLongPress: () {},
                  ),
                  CheckOutItem(
                    anh_san_pham:
                        'https://thumblr.uniid.it/product/431213/a1d613ea9d00.jpg?width=1920&format=webp&q=75',
                    ten_san_pham: 'Adidas Predator Elite FG Immortal DNA',
                    ma_danh_muc: 'Giày bóng đá sân cỏ tự nhiên',
                    size: '44',
                    so_luong: '1',
                    gia_san_pham: '200',
                    onTap: () {},
                    onLongPress: () {},
                  ),
                  CheckOutItem(
                    anh_san_pham:
                        'https://thumblr.uniid.it/product/436811/bff0e891506e.jpg?width=1920&format=webp&q=75',
                    ten_san_pham: 'Mizuno Morelia II Elite FG',
                    ma_danh_muc: 'Giày bóng đá sân cỏ tự nhiên',
                    size: '44',
                    so_luong: '1',
                    gia_san_pham: '180',
                    onTap: () {},
                    onLongPress: () {},
                  ),
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.all(10),
              margin: const EdgeInsets.all(10),
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(10),
              ),
              child: ListView(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                children: [
                  Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Subtotal', style: TextStyle(fontSize: 18)),
                        PriceText(amount: 500, style: TextStyle(fontSize: 18)),
                      ],
                    ),
                  ),
                  Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Shipping', style: TextStyle(fontSize: 18)),
                        PriceText(amount: 0, style: TextStyle(fontSize: 18)),
                      ],
                    ),
                  ),
                  Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Estimated total',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        PriceText(
                          amount: 500,
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.all(10),
              margin: EdgeInsets.all(10),
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.grey[200],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Payment methods',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  RadioListTile<Payment_Method>(
                    title: const Text('COD'),
                    subtitle: const Text('Cash on Delivery'),
                    value: Payment_Method.cash_on_delivery,
                    activeColor: Colors.lightGreenAccent.shade400,
                    groupValue: _selectedMethod,
                    onChanged: (Payment_Method? value) {
                      setState(() {
                        _selectedMethod = value;
                      });
                    },
                  ),
                  RadioListTile<Payment_Method>(
                    title: const Text('Bank'),
                    subtitle: const Text('Vietcombank: 1033247132'),
                    value: Payment_Method.bank_account,
                    activeColor: Colors.lightGreenAccent.shade400,
                    groupValue: _selectedMethod,
                    onChanged: (Payment_Method? value) {
                      setState(() {
                        _selectedMethod = value;
                      });
                    },
                  ),
                ],
              ),
            ),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(20),
              child: ElevatedButton.icon(
                onPressed: () {},
                icon: const Icon(Icons.check_outlined),
                label: const Text('Comfirm'),
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
          ],
        ),
      ),
    );
  }
}

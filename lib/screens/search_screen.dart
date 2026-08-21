// ĐÂY LÀ TRANG TÌM KIẾM CỦA ỨNG DỤNG\

import 'dart:ui';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import '../widgets/product_card.dart';
import '../widgets/search_bar.dart';
import 'product_detail_screen.dart';

class MyCustomScrollBehavior extends MaterialScrollBehavior {
  @override
  Set<PointerDeviceKind> get dragDevices => {
    PointerDeviceKind.touch,
    PointerDeviceKind.mouse, // Kích hoạt kéo cuộn bằng chuột
    PointerDeviceKind.trackpad,
  };
}

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      scrollBehavior: MyCustomScrollBehavior(),
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Search"),
          backgroundColor: Colors.lightGreenAccent.shade400,
        ),
        body: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              SearchBarWidget(onChanged: (value) {}),
              const SizedBox(height: 10),
              Container(child: Text('Search result for "Tiemo Ligera" ')),
              const SizedBox(height: 10),
              Expanded(
                child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2, // 👈 Bắt buộc chia thành 2 cột song song
                    crossAxisSpacing:
                        5.0, // Khoảng cách giữa cột trái và cột phải
                    mainAxisSpacing:
                        5.0, // Khoảng cách giữa hàng trên và hàng dưới
                    childAspectRatio:
                        0.6, // 👈 Tỷ lệ (Chiều rộng / Chiều cao) của thẻ.
                    // Chỉnh số này nhỏ xuống (ví dụ 0.6) nếu thẻ bị thiếu chỗ hiển thị chữ.
                  ),
                  itemCount: 10,
                  itemBuilder: (context, index) {
                    return ProductCard(
                      ten_san_pham: 'Nike Tiempo Ligera Pro FG',
                      anh_san_pham:
                          'https://thumblr.uniid.it/product/462700/e4d5c6fd4e11.jpg?width=1920&format=webp&q=75',
                      gia_san_pham: '120',
                      danh_muc: 'Giày bóng đá sân cỏ tự nhiên',
                      onTap: () {
                        // Navigator.push(
                        //   context,
                        //   MaterialPageRoute(
                        //     builder: (context) => const ProductDetailScreen(),
                        //   ),
                        // );
                      },
                      onLongPress: () {},
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

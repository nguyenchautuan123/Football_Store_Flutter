//ĐÂY LÀ TRANG CHỦ CỦA ỨNG DỤNG

import 'package:flutter/material.dart';
import 'dart:ui';
import 'package:flutter/gestures.dart';

import '../widgets/slider.dart';
import '../widgets/category.dart';
import '../widgets/brand.dart';
import '../widgets/product_card.dart';

class MyCustomScrollBehavior extends MaterialScrollBehavior {
  @override
  Set<PointerDeviceKind> get dragDevices => {
    PointerDeviceKind.touch,
    PointerDeviceKind.mouse, // Kích hoạt kéo cuộn bằng chuột
    PointerDeviceKind.trackpad,
  };
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      scrollBehavior: MyCustomScrollBehavior(),
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text("Shop", style: TextStyle(fontWeight: FontWeight.bold)),
          backgroundColor: Colors.lightGreenAccent.shade400,
        ),
        body: Container(
          child: ListView(
            children: [
              Container(child: ImageSlider()),
              Container(
                child: Column(
                  children: [
                    Category(
                      ten_danh_muc: 'Giày bóng đá sân cỏ tự nhiên',
                      anh_danh_muc:
                          'https://www.voetbalshop.nl/media/blog/post/972/20240503-Voetbalschoenen-tekst-breedte-Ondergrond-FG-1.jpg',
                      onTap: () {},
                      onLongPress: () {},
                    ),
                    Category(
                      ten_danh_muc: 'Giày bóng đá sân cỏ nhân tạo',
                      anh_danh_muc:
                          'https://www.voetbalshop.nl/media/blog/post/972/20240503-Voetbalschoenen-tekst-breedte-Ondergrond-TF-1.jpg',
                      onTap: () {},
                      onLongPress: () {},
                    ),
                  ],
                ),
              ),
              Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      padding: EdgeInsets.all(10),
                      child: Text(
                        'Thương hiệu',
                        style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Container(
                      color: Colors.grey[200],
                      child: GridView.builder(
                        // Giới hạn lưới vừa đủ theo kích thước của các phần tử bên trong
                        shrinkWrap: true,
                        // Chặn cuộn riêng của GridView nếu nó nằm trong một SingleChildScrollView
                        physics: const NeverScrollableScrollPhysics(),
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2, // Hiển thị 2 cột như trong ảnh
                          mainAxisSpacing: 1.0, // Khoảng cách giữa các hàng
                          crossAxisSpacing: 1.0, // Khoảng cách giữa các cột
                          childAspectRatio:
                              1.0, // Tỷ lệ khung hình (1.0 nghĩa là ô vuông)
                        ),
                        itemCount: 4,
                        itemBuilder: (context, index) {
                          return Brand(
                            anh_thuong_hieu:
                                'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRDuijr8bBrpnUWJ7dQhTxKOARJiTZIix8A0O3IABPVOnmW3QidAfIP1VEF&s=10',
                            ten_thuong_hieu: 'Nike',
                            onTap: () {},
                            onLongPress: () {},
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 30.0),
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Nike',
                      style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      height: 350,
                      child: ListView.separated(
                        scrollDirection: Axis.horizontal,
                        itemCount: 10,
                        separatorBuilder: (_, __) => const SizedBox(width: 10),
                        itemBuilder: (context, index) {
                          return ProductCard(
                            ten_san_pham: 'Nike Tiempo Ligera Pro FG',
                            anh_san_pham:
                                'https://thumblr.uniid.it/product/462700/e4d5c6fd4e11.jpg?width=1920&format=webp&q=75',
                            gia_san_pham: '120',
                            ma_danh_muc: 'Giày bóng đá sân cỏ tự nhiên',
                            onTap: () {},
                            onLongPress: () {},
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 30.0),
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Adidas',
                      style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      height: 350,
                      child: ListView.separated(
                        scrollDirection: Axis.horizontal,
                        itemCount: 10,
                        separatorBuilder: (_, __) => const SizedBox(width: 10),
                        itemBuilder: (context, index) {
                          return ProductCard(
                            ten_san_pham:
                                'Adidas Predator Elite FG Immortal DNA',
                            anh_san_pham:
                                'https://thumblr.uniid.it/product/431213/a1d613ea9d00.jpg?width=1920&format=webp&q=75',
                            gia_san_pham: '200',
                            ma_danh_muc: 'Giày bóng đá sân cỏ tự nhiên',
                            onTap: () {},
                            onLongPress: () {},
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 30.0),
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Mizuno',
                      style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      height: 350,
                      child: ListView.separated(
                        scrollDirection: Axis.horizontal,
                        itemCount: 10,
                        separatorBuilder: (_, __) => const SizedBox(width: 10),
                        itemBuilder: (context, index) {
                          return ProductCard(
                            ten_san_pham: 'Mizuno Morelia II Elite FG',
                            anh_san_pham:
                                'https://thumblr.uniid.it/product/436811/bff0e891506e.jpg?width=1920&format=webp&q=75',
                            gia_san_pham: '180',
                            ma_danh_muc: 'Giày bóng đá sân cỏ tự nhiên',
                            onTap: () {},
                            onLongPress: () {},
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 30.0),
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Puma',
                      style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      height: 350,
                      child: ListView.separated(
                        scrollDirection: Axis.horizontal,
                        itemCount: 10,
                        separatorBuilder: (_, __) => const SizedBox(width: 10),
                        itemBuilder: (context, index) {
                          return ProductCard(
                            ten_san_pham: 'PUMA Future 9 Ultimate FG Eclipse',
                            anh_san_pham:
                                'https://thumblr.uniid.it/product/434170/1384a44a1220.jpg?width=1920&format=webp&q=75',
                            gia_san_pham: '200',
                            ma_danh_muc: 'Giày bóng đá sân cỏ tự nhiên',
                            onTap: () {},
                            onLongPress: () {},
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

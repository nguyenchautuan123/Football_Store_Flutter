//ĐÂY LÀ TRANG CHỦ CỦA ỨNG DỤNG

import 'package:flutter/material.dart';

import 'category_screens/product_by_category.dart';
import 'brand_screens/product_by_brand.dart';

import '../widgets/slider.dart';
import '../widgets/category.dart';
import '../widgets/brand.dart';
import '../widgets/product_by_brand_section.dart';

import '../services/product_service.dart';
import '../services/category_service.dart';
import '../services/brand_service.dart';

import '../models/product_model.dart';
import '../models/category_model.dart';
import '../models/brand_model.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late Future<List<CategoryModel>> _categories;
  late Future<List<BrandModel>> _brands;

  @override
  void initState() {
    super.initState();
    _categories = CategoryService.getCategories();
    _brands = BrandService.getBrands();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
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
                width: double.infinity,
                height: 500,
                padding: EdgeInsets.all(10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(
                      child: Text(
                        'DANH MỤC',
                        style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Divider(
                      color: Colors.grey, // Màu sắc đường kẻ
                      thickness: 1.5, // Độ dày của đường kẻ
                      indent: 80, // Khoảng trống cách lề trái
                      endIndent: 80, // Khoảng trống cách lề phải
                    ),
                    FutureBuilder<List<CategoryModel>>(
                      future: _categories,
                      builder: (context, snapshot) {
                        // Trạng thái đang tải API
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return Container(
                            height: 600,
                            child: Center(
                              child: CircularProgressIndicator(
                                color: Colors.lightGreenAccent.shade400,
                              ),
                            ),
                          );
                        }
                        // Trạng thái bị lỗi
                        if (snapshot.hasError) {
                          return Center(
                            child: Text('Lỗi tải danh mục: ${snapshot.error}'),
                          );
                        }
                        final listCategory = snapshot.data ?? [];
                        if (listCategory.isEmpty) {
                          return const Center(
                            child: Text('Chưa có danh mục nào'),
                          );
                        }
                        return SizedBox(
                          child: ListView.separated(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            separatorBuilder: (context, index) =>
                                const SizedBox(width: 10),
                            itemCount: listCategory.length,
                            itemBuilder: (context, index) {
                              final c = listCategory[index];
                              return Category(
                                ten_danh_muc: c.ten_danh_muc,
                                anh_danh_muc: c.anh_danh_muc,
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => ProductByCategory(
                                        ma_danh_muc: c.ma_danh_muc,
                                        ten_danh_muc: c.ten_danh_muc,
                                      ),
                                    ),
                                  );
                                },
                                onLongPress: () {},
                              );
                            },
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
              Container(
                width: double.infinity,
                height: 500,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      padding: EdgeInsets.all(10),
                      child: Center(
                        child: Text(
                          'THƯƠNG HIỆU',
                          style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    Divider(
                      color: Colors.grey, // Màu sắc đường kẻ
                      thickness: 1.5, // Độ dày của đường kẻ
                      indent: 80, // Khoảng trống cách lề trái
                      endIndent: 80, // Khoảng trống cách lề phải
                    ),
                    Container(
                      child: FutureBuilder<List<BrandModel>>(
                        future: _brands,
                        builder: (context, snapshot) {
                          // Trạng thái đang tải API
                          if (snapshot.connectionState ==
                              ConnectionState.waiting) {
                            return SizedBox(
                              height: 600,
                              child: Center(child: CircularProgressIndicator()),
                            );
                          }
                          // Trạng thái bị lỗi
                          if (snapshot.hasError) {
                            return Center(
                              child: Text(
                                'Lỗi tải thương hiệu: ${snapshot.error}',
                              ),
                            );
                          }
                          final listBrand = snapshot.data ?? [];
                          if (listBrand.isEmpty) {
                            return const Center(
                              child: Text('Chưa có thương hiệu'),
                            );
                          }
                          return SizedBox(
                            child: GridView.builder(
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              gridDelegate:
                                  SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount:
                                        2, // Hiển thị 2 cột như trong ảnh
                                    mainAxisSpacing:
                                        1.0, // Khoảng cách giữa các hàng
                                    crossAxisSpacing:
                                        1.0, // Khoảng cách giữa các cột
                                    childAspectRatio:
                                        1.0, // Tỷ lệ khung hình (1.0 nghĩa là ô vuông)
                                  ),
                              itemCount: listBrand.length,
                              itemBuilder: (context, index) {
                                final b = listBrand[index];
                                return Brand(
                                  anh_thuong_hieu: b.anh_thuong_hieu,
                                  ten_thuong_hieu: b.ten_thuong_hieu,
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => ProductByBrand(
                                          ma_thuong_hieu: b.ma_thuong_hieu,
                                          ten_thuong_hieu: b.ten_thuong_hieu,
                                        ),
                                      ),
                                    );
                                  },
                                  onLongPress: () {},
                                );
                              },
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                width: double.infinity,
                child: Center(
                  child: Text(
                    'CÁC SẢN PHẨM NỔI BẬT',
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              Divider(
                color: Colors.grey, // Màu sắc đường kẻ
                thickness: 1.5, // Độ dày của đường kẻ
                indent: 80, // Khoảng trống cách lề trái
                endIndent: 80, // Khoảng trống cách lề phải
              ),
              ProductByBrandSection(id: 1, ten_thuong_hieu: 'Nike'),
              ProductByBrandSection(id: 2, ten_thuong_hieu: 'Adidas'),
              ProductByBrandSection(id: 3, ten_thuong_hieu: 'Puma'),
              ProductByBrandSection(id: 4, ten_thuong_hieu: 'Mizuno'),
            ],
          ),
        ),
      ),
    );
  }
}

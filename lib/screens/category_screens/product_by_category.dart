import 'package:flutter/material.dart';

import '../../widgets/product_card.dart';
import '../product_detail_screen.dart';
import '../../services/product_service.dart';
import '../../models/product_model.dart';

class ProductByCategory extends StatefulWidget {
  final int ma_danh_muc;
  final String ten_danh_muc;

  const ProductByCategory({
    super.key,
    required this.ma_danh_muc,
    required this.ten_danh_muc,
  });

  @override
  State<ProductByCategory> createState() => _ProductByCategoryState();
}

class _ProductByCategoryState extends State<ProductByCategory> {
  late Future<List<ProductModel>> _productsByCategory;

  @override
  void initState() {
    super.initState();
    _productsByCategory = ProductService.getProductsByCategory(
      widget.ma_danh_muc,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.ten_danh_muc,
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black87),
        ),
        backgroundColor: Colors.lightGreenAccent.shade400,
        elevation: 0,
      ),
      body: Container(
        child: Column(
          children: [
            FutureBuilder<List<ProductModel>>(
              future: _productsByCategory,
              builder: (context, snapshot) {
                // Trạng thái đang tải API
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Container(
                    height: 500,
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
                final listproductsByCategory = snapshot.data ?? [];
                if (listproductsByCategory.isEmpty) {
                  return const Center(child: Text('Chưa có danh mục nào'));
                }
                return Expanded(
                  child: GridView.builder(
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount:
                          2, // 👈 Bắt buộc chia thành 2 cột song song
                      crossAxisSpacing:
                          5.0, // Khoảng cách giữa cột trái và cột phải
                      mainAxisSpacing:
                          5.0, // Khoảng cách giữa hàng trên và hàng dưới
                      childAspectRatio:
                          0.6, // 👈 Tỷ lệ (Chiều rộng / Chiều cao) của thẻ.
                      // Chỉnh số này nhỏ xuống (ví dụ 0.6) nếu thẻ bị thiếu chỗ hiển thị chữ.
                    ),
                    itemCount: listproductsByCategory.length,
                    itemBuilder: (context, index) {
                      final p = listproductsByCategory[index];
                      return ProductCard(
                        ten_san_pham: p.ten_san_pham ?? 'null',
                        anh_san_pham: p.anh_san_pham ?? 'null',
                        gia_san_pham: p.gia_san_pham.toString(),
                        danh_muc: p.danh_muc?.ten_danh_muc ?? 'null',
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  ProductDetailScreen(product: p),
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
    );
  }
}

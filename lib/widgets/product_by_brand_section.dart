import 'package:flutter/material.dart';
import '../screens/product_detail_screen.dart';
import '../models/product_model.dart';
import '../services/product_service.dart';
import '../widgets/product_card.dart';

class ProductByBrandSection extends StatefulWidget {
  final int id;
  final String ten_thuong_hieu;

  const ProductByBrandSection({
    super.key,
    required this.id,
    required this.ten_thuong_hieu,
  });

  @override
  State<ProductByBrandSection> createState() => _ProductByBrandSectionState();
}

class _ProductByBrandSectionState extends State<ProductByBrandSection>
    with AutomaticKeepAliveClientMixin {
  late Future<List<ProductModel>> _productsByBrand;

  @override
  bool get wantKeepAlive => true;

  @override
  void initState() {
    super.initState();
    _productsByBrand = ProductService.getProductsByBrand(widget.id);
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);

    return FutureBuilder<List<ProductModel>>(
      future: _productsByBrand,
      builder: (context, snapshot) {
        // Trạng thái đang tải API
        if (snapshot.connectionState == ConnectionState.waiting) {
          return SizedBox(
            height: 350,
            child: Center(child: CircularProgressIndicator()),
          );
        }
        // Trạng thái bị lỗi
        if (snapshot.hasError) {
          return Center(child: Text('Lỗi tải sản phẩm: ${snapshot.error}'));
        }
        final listProduct = snapshot.data ?? [];
        if (listProduct.isEmpty) {
          return const Center(child: Text('Chưa có sản phẩm'));
        }
        return Container(
          margin: const EdgeInsets.only(top: 30.0),
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                widget.ten_thuong_hieu,
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 300,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemCount: listProduct.length,
                  separatorBuilder: (context, index) =>
                      const SizedBox(width: 10),
                  itemBuilder: (context, index) {
                    final p = listProduct[index];
                    return ProductCard(
                      ten_san_pham: p.ten_san_pham ?? '',
                      anh_san_pham: p.anh_san_pham ?? '',
                      gia_san_pham: p.gia_san_pham.toString(),
                      danh_muc: p.danh_muc?.ten_danh_muc ?? 'Chưa phân loại',
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
              ),
            ],
          ),
        );
      },
    );
  }
}

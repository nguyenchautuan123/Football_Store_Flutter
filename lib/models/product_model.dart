import 'brand_model.dart';
import 'category_model.dart';
import 'product_size_model.dart';

class ProductModel {
  final int? ma_san_pham;
  final String? ten_san_pham;
  final String? anh_san_pham;
  final String? mo_ta_san_pham;
  final double? gia_san_pham;

  BrandModel? thuong_hieu;
  CategoryModel? danh_muc;
  List<ProductSizeModel>? sizes;

  ProductModel({
    this.ma_san_pham,
    this.ten_san_pham,
    this.anh_san_pham,
    this.mo_ta_san_pham,
    this.thuong_hieu,
    this.danh_muc,
    this.gia_san_pham,
    this.sizes,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      ma_san_pham: json['ma_san_pham'] ?? 0,
      ten_san_pham: json['ten_san_pham'] ?? '',
      anh_san_pham: json['anh_san_pham'] ?? '',
      mo_ta_san_pham: json['mo_ta_san_pham'] ?? '',
      thuong_hieu: json['thuong_hieu'] is Map
          ? BrandModel.fromJson(json['thuong_hieu'])
          : (json['thuong_hieu'] != null
                ? BrandModel(
                    ma_thuong_hieu: 0,
                    ten_thuong_hieu: json['thuong_hieu'].toString(),
                    anh_thuong_hieu: '',
                  )
                : null),
      danh_muc: json['danh_muc'] is Map
          ? CategoryModel.fromJson(json['danh_muc'])
          : (json['danh_muc'] != null
                ? CategoryModel(
                    ma_danh_muc: 0,
                    ten_danh_muc: json['danh_muc'].toString(),
                    anh_danh_muc: '',
                  )
                : null),
      gia_san_pham: json['gia_san_pham'] != null
          ? double.tryParse(json['gia_san_pham'].toString()) ?? 0.0
          : 0.0,

      sizes: json['sizes'] != null
          ? (json['sizes'] as List)
                .map((item) => ProductSizeModel.fromJson(item))
                .toList()
          : [],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'ma_san_pham': ma_san_pham,
      'ten_san_pham': ten_san_pham,
      'anh_san_pham': anh_san_pham,
      'mo_ta_san_pham': mo_ta_san_pham,
      'thuong_hieu': thuong_hieu,
      'danh_muc': danh_muc,
      'gia_san_pham': gia_san_pham,
    };
  }
}

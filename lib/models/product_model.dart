import 'brand_model.dart';
import 'category_model.dart';
import 'product_size_model.dart';

class ProductModel {
  final int? ma_san_pham;
  final String? ten_san_pham;
  final String? anh_san_pham;
  final String? mo_ta_san_pham;
  final int? thuong_hieu;
  final int? danh_muc;
  final int? gia_san_pham;

  BrandModel? brands_model;
  CategoryModel? categories_model;
  List<ProductSizeModel>? sizes_model;

  ProductModel({
    this.ma_san_pham,
    this.ten_san_pham,
    this.anh_san_pham,
    this.mo_ta_san_pham,
    this.thuong_hieu,
    this.danh_muc,
    this.gia_san_pham,

    this.brands_model,
    this.categories_model,
    this.sizes_model,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      ma_san_pham: json['ma_san_pham'],
      ten_san_pham: json['ten_san_pham'],
      anh_san_pham: json['anh_san_pham'],
      mo_ta_san_pham: json['mo_ta_san_pham'],
      thuong_hieu: json['thuong_hieu'],
      danh_muc: json['danh_muc'],
      gia_san_pham: json['gia_san_pham'],

      sizes_model: json['size_san_pham'] != null
          ? List<ProductSizeModel>.from(
              json['size_san_pham'].map((x) => ProductSizeModel.fromJson(x)),
            )
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

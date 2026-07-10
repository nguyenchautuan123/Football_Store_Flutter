class ProductSizeModel {
  final int? ma_size;
  final int? ma_san_pham;
  final String? size;
  final int? so_luong;

  ProductSizeModel({this.ma_size, this.ma_san_pham, this.size, this.so_luong});

  factory ProductSizeModel.fromJson(Map<String, dynamic> json) {
    return ProductSizeModel(
      ma_size: json['ma_size'],
      ma_san_pham: json['ma_san_pham'],
      size: json['size'],
      so_luong: json['so_luong'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'ma_size': ma_size,
      'ma_san_pham': ma_san_pham,
      'size': size,
      'so_luong': so_luong,
    };
  }
}

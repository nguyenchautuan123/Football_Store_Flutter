class ProductSizeModel {
  final int ma_size;
  final int ma_san_pham;
  final String size;
  final int so_luong;

  ProductSizeModel({
    required this.ma_size,
    required this.ma_san_pham,
    required this.size,
    required this.so_luong,
  });

  factory ProductSizeModel.fromJson(Map<String, dynamic> json) {
    return ProductSizeModel(
      ma_size: json['ma_size'] != null
          ? int.tryParse(json['ma_size'].toString()) ?? 0
          : 0,
      ma_san_pham: json['ma_san_pham'] != null
          ? int.tryParse(json['ma_san_pham'].toString()) ?? 0
          : 0,
      size: json['size']?.toString() ?? '',
      so_luong: json['so_luong'] != null
          ? int.tryParse(json['so_luong'].toString()) ?? 0
          : 0,
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

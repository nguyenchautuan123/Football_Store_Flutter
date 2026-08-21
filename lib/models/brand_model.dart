class BrandModel {
  final int ma_thuong_hieu;
  final String ten_thuong_hieu;
  final String anh_thuong_hieu;

  BrandModel({
    required this.ma_thuong_hieu,
    required this.ten_thuong_hieu,
    required this.anh_thuong_hieu,
  });

  factory BrandModel.fromJson(Map<String, dynamic> json) {
    return BrandModel(
      ma_thuong_hieu: json['ma_thuong_hieu'] ?? 0,
      ten_thuong_hieu: json['ten_thuong_hieu']?.toString() ?? '',
      anh_thuong_hieu: json['anh_thuong_hieu']?.toString() ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'ma_thuong_hieu': ma_thuong_hieu,
      'ten_thuong_hieu': ten_thuong_hieu,
      'anh_thuong_hieu': anh_thuong_hieu,
    };
  }
}

class CategoryModel {
  final int ma_danh_muc;
  final String ten_danh_muc;
  final String anh_danh_muc;

  CategoryModel({
    required this.ma_danh_muc,
    required this.ten_danh_muc,
    required this.anh_danh_muc,
  });

  factory CategoryModel.fromJson(Map<String, dynamic> json) {
    return CategoryModel(
      ma_danh_muc: json['ma_danh_muc'] ?? 0,
      ten_danh_muc: json['ten_danh_muc']?.toString() ?? '',
      anh_danh_muc: json['anh_danh_muc']?.toString() ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'ma_danh_muc': ma_danh_muc,
      'ten_danh_muc': ten_danh_muc,
      'anh_danh_muc': anh_danh_muc,
    };
  }
}

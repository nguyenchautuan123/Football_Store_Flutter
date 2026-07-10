class CategoryModel {
  final int? ma_danh_muc;
  final String? ten_danh_muc;
  final String? anh_danh_muc;

  CategoryModel({this.ma_danh_muc, this.ten_danh_muc, this.anh_danh_muc});

  factory CategoryModel.fromJson(Map<String, dynamic> json) {
    return CategoryModel(
      ma_danh_muc: json['ma_danh_muc'],
      ten_danh_muc: json['ten_danh_muc'],
      anh_danh_muc: json['anh_danh_muc'],
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

class BrandModel {
  final int? ma_thuong_hieu;
  final String? ten_thuong_hieu;
  final String? anh_thuong_hieu;

  BrandModel({this.ma_thuong_hieu, this.ten_thuong_hieu, this.anh_thuong_hieu});

  factory BrandModel.fromJson(Map<String, dynamic> json) {
    return BrandModel(
      ma_thuong_hieu: json['ma_thuong_hieu'],
      ten_thuong_hieu: json['ten_thuong_hieu'],
      anh_thuong_hieu: json['anh_thuong_hieu'],
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

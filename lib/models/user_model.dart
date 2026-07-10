class UserModel {
  final int? ma_kh;
  final String ten_kh;
  final String so_dien_thoai;
  final String email;
  final String? dia_chi;
  final String mat_khau;
  final String? avatar;

  UserModel({
    this.ma_kh,
    required this.ten_kh,
    required this.so_dien_thoai,
    required this.email,
    this.dia_chi,
    required this.mat_khau,
    this.avatar,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      ma_kh: json['ma_kh'],
      ten_kh: json['ten_kh'],
      so_dien_thoai: json['so_dien_thoai'],
      email: json['email'],
      dia_chi: json['dia_chi'],
      mat_khau: json['mat_khau'],
      avatar: json['avatar'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'ma_kh': ma_kh,
      'ten_kh': ten_kh,
      'so_dien_thoai': so_dien_thoai,
      'email': email,
      'dia_chi': dia_chi,
      'mat_khau': mat_khau,
      'avatar': avatar,
    };
  }
}

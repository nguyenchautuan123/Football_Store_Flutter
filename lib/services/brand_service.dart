import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/brand_model.dart';

class BrandService {
  static const String api_url = 'https://footballstore-laravel.onrender.com';

  static Future<List<BrandModel>> getBrands() async {
    try {
      final Uri url = Uri.parse('$api_url/api/thuong-hieu');

      final response = await http
          .get(
            url,
            headers: {
              'Accept': 'application/json',
              'User-Agent': 'FlutterApp/3.0',
            },
          )
          .timeout(const Duration(seconds: 120));

      if (response.statusCode == 200) {
        final Map<String, dynamic> body = jsonDecode(response.body);
        final List<dynamic> data = body['data'] ?? [];

        return data.map((json) => BrandModel.fromJson(json)).toList();
      } else if (response.statusCode == 500) {
        await Future.delayed(const Duration(seconds: 2));
        return getBrands();
      } else {
        throw Exception('Lỗi Server: ${response.statusCode}');
      }
    } catch (error) {
      throw Exception('Lỗi kết nối API: $error');
    }
  }
}

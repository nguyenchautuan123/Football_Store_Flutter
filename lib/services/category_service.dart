import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/category_model.dart';

class CategoryService {
  static const String api_url = 'https://footballstore-laravel.onrender.com';

  static Future<List<CategoryModel>> getCategories() async {
    try {
      final Uri url = Uri.parse('$api_url/api/danh-muc');

      // Gọi HTTP GET
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

        return data.map((json) => CategoryModel.fromJson(json)).toList();
      } else if (response.statusCode == 500) {
        await Future.delayed(const Duration(seconds: 15));
        return getCategories();
      } else {
        throw Exception('Lỗi Server: ${response.statusCode}');
      }
    } catch (error) {
      throw Exception('Lỗi kết nối API: $error');
    }
  }
}

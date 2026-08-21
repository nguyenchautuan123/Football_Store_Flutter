import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/product_model.dart';

class ProductService {
  static const String api_url = 'https://footballstore-laravel.onrender.com';

  static Future<List<ProductModel>> getProducts() async {
    try {
      final Uri url = Uri.parse('$api_url/api/san-pham');

      // Gọi HTTP GET
      final response = await http
          .get(
            url,
            headers: {
              'Accept': 'application/json',
              'Content-Type': 'application/json',
              'User-Agent': 'FlutterApp/1.0',
            },
          )
          .timeout(const Duration(seconds: 15));

      // Kiểm tra response
      if (response.statusCode == 200) {
        final Map<String, dynamic> body = jsonDecode(response.body);
        final List<dynamic> data = body['data'] ?? [];

        return data.map((json) => ProductModel.fromJson(json)).toList();
      } else if (response.statusCode == 500) {
        await Future.delayed(const Duration(seconds: 15));
        return getProducts();
      } else {
        throw Exception('Lỗi Server: ${response.statusCode}');
      }
    } catch (error) {
      throw Exception('Lỗi kết nối API: $error');
    }
  }

  static Future<List<ProductModel>> getProductsByCategory(int id) async {
    try {
      final Uri url = Uri.parse('$api_url/api/search-by-category?category=$id');

      final response = await http
          .get(
            url,
            headers: {
              'Accept': 'application/json',
              'Content-Type': 'application/json',
              'User-Agent': 'FlutterApp/1.0',
            },
          )
          .timeout(const Duration(seconds: 60));

      if (response.statusCode == 200) {
        final Map<String, dynamic> body = jsonDecode(response.body);
        final List<dynamic> data = body['data'] ?? [];

        return data.map((json) => ProductModel.fromJson(json)).toList();
      } else if (response.statusCode == 500) {
        await Future.delayed(const Duration(seconds: 15));
        return getProductsByCategory(id);
      } else {
        throw Exception('Lỗi Server: ${response.statusCode}');
      }
    } catch (error) {
      throw Exception('Lỗi kết nối API: $error');
    }
  }

  static Future<List<ProductModel>> getProductsByBrand(int id) async {
    try {
      final Uri url = Uri.parse('$api_url/api/search-by-brand?brand=$id');

      final response = await http
          .get(
            url,
            headers: {
              'Accept': 'application/json',
              'Content-Type': 'application/json',
              'User-Agent': 'FlutterApp/1.0',
            },
          )
          .timeout(const Duration(seconds: 120));

      if (response.statusCode == 200) {
        final Map<String, dynamic> body = jsonDecode(response.body);
        final List<dynamic> data = body['data'] ?? [];

        return data.map((json) => ProductModel.fromJson(json)).toList();
      } else if (response.statusCode == 500) {
        await Future.delayed(const Duration(seconds: 15));
        return getProductsByBrand(id);
      } else {
        throw Exception('Lỗi Server: ${response.statusCode}');
      }
    } catch (error) {
      throw Exception('Lỗi kết nối API: $error');
    }
  }
}

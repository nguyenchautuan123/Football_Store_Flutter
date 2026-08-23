// ĐÂY LÀ TRANG TÌM KIẾM CỦA ỨNG DỤNG\

import 'package:flutter/material.dart';

import '../models/product_model.dart';
import '../services/product_service.dart';

import '../widgets/product_card.dart';
import '../widgets/search_bar.dart';

import 'product_detail_screen.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  List<ProductModel> _searchResults = [];
  bool _isLoading = false;
  bool _hasSearched = false;
  String _searchQuery = '';

  void _onSearch(String query) async {
    final trimmedQuery = query.trim();

    if (trimmedQuery.isEmpty) {
      setState(() {
        _searchQuery = '';
        _searchResults = [];
        _hasSearched = false;
        _isLoading = false;
      });
      return;
    }

    setState(() {
      _searchQuery = trimmedQuery;
      _isLoading = true;
      _hasSearched = true;
    });

    try {
      final results = await ProductService.searchProductsByKeyword(
        trimmedQuery,
      );
      setState(() {
        _searchResults = results;
        _isLoading = false;
      });
    } catch (error) {
      setState(() {
        _searchResults = [];
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Search"),
        backgroundColor: Colors.lightGreenAccent.shade400,
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            SearchBarWidget(onChanged: _onSearch, onSubmitted: _onSearch),
            const SizedBox(height: 10),
            if (_searchQuery.isNotEmpty)
              Container(child: Text('Search result for "$_searchQuery"')),
            const SizedBox(height: 10),
            Expanded(child: _buildSearchResults()),
          ],
        ),
      ),
    );
  }

  Widget _buildSearchResults() {
    if (_isLoading) {
      return const Center(child: CircularProgressIndicator());
    }

    if (!_hasSearched) {
      return const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.search, size: 60, color: Colors.grey),
            SizedBox(height: 10),
            Text(
              'Nhập từ khóa để tìm kiếm sản phẩm...',
              style: TextStyle(color: Colors.grey),
            ),
          ],
        ),
      );
    }

    if (_searchResults.isEmpty) {
      return const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.search_off, size: 60, color: Colors.grey),
            SizedBox(height: 10),
            Text(
              'Không tìm thấy sản phẩm nào phù hợp.',
              style: TextStyle(color: Colors.grey),
            ),
          ],
        ),
      );
    }

    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 5.0,
        mainAxisSpacing: 5.0,
        childAspectRatio: 0.6,
      ),
      itemCount: _searchResults.length,
      itemBuilder: (context, index) {
        final p = _searchResults[index];

        return ProductCard(
          ten_san_pham: p.ten_san_pham ?? 'null',
          anh_san_pham: p.anh_san_pham ?? 'null',
          gia_san_pham: p.gia_san_pham.toString(),
          danh_muc: p.danh_muc?.ten_danh_muc ?? 'Chưa phân loại',
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ProductDetailScreen(product: p),
              ),
            );
          },
          onLongPress: () {},
        );
      },
    );
  }
}

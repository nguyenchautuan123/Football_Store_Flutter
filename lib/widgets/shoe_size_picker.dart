import 'package:flutter/material.dart';

import 'package:input_quantity/input_quantity.dart';

class ShoeSizePicker extends StatefulWidget {
  const ShoeSizePicker({super.key});

  @override
  State<ShoeSizePicker> createState() => _ShoeSizePickerState();
}

class _ShoeSizePickerState extends State<ShoeSizePicker> {
  // Danh sách các size giày hiển thị
  final List<String> _sizes = ['38', '39', '40', '41', '42', '43', '44'];

  // Khởi tạo số lượng tồn kho cho từng size (mặc định mỗi size có 10 đôi)
  final Map<String, int> _sizeQuantities = {
    '38': 7,
    '39': 9,
    '40': 15,
    '41': 15,
    '42': 20,
    '43': 11,
    '44': 15,
  };

  // Lưu size đang được chọn (mặc định là size 40)
  late String _selectedSize = '40';

  @override
  void initState() {
    super.initState();
    // Gán mặc định bằng phần tử đầu tiên (vị trí số 0) trong mảng
    _selectedSize = _sizes[0]; // Sẽ tự động lấy ra giá trị '38'
  }

  @override
  Widget build(BuildContext context) {
    int maxStockForSelectedSize = _sizeQuantities[_selectedSize] ?? 0;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Select Size',
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 12),

        // Dùng Wrap để tự động xuống dòng nếu có quá nhiều size
        Wrap(
          spacing: 8.0, // Khoảng cách giữa các ô theo chiều ngang
          runSpacing: 8.0, // Khoảng cách giữa các hàng theo chiều dọc
          children: _sizes.map((size) {
            final isSelected = _selectedSize == size;

            return ChoiceChip(
              label: Text(size),
              selected: isSelected,
              // Sự kiện khi người dùng bấm chọn size
              onSelected: (bool selected) {
                if (selected) {
                  setState(() => _selectedSize = size);
                }
              },
              // Tùy chỉnh màu sắc để giống thiết kế của bạn
              selectedColor: Colors.black, // Màu nền khi được chọn
              backgroundColor: const Color(0xFFF0F0F0), // Màu nền khi chưa chọn
              labelStyle: TextStyle(
                color: isSelected ? Colors.white : Colors.black, // Màu chữ
                fontWeight: FontWeight.bold,
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8), // Bo góc ô vuông
                side: BorderSide(
                  color: isSelected ? Colors.black : Colors.transparent,
                ),
              ),
              showCheckmark: false, // Ẩn dấu tích mặc định của Flutter nếu muốn gọn hơn
            );
          }).toList(),
        ),
        const SizedBox(height: 12),

        Row(
          children: [
            Text('Quantity: ', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),),
            InputQty.int(
              key: UniqueKey(),
              maxVal: maxStockForSelectedSize, // Giá trị tối đa
              minVal: 1,                       // Giá trị tối thiểu
              initVal: 1,                      // Giá trị mặc định ban đầu
              steps: 1,                        // Số lượng tăng/giảm mỗi lần nhấn nút
              decoration: QtyDecorationProps(
                isBordered: false,
              ),
              qtyFormProps: const QtyFormProps(
                enableTyping: false, // 🚫 Thêm thuộc tính này để chặn nhập từ bàn phím
              ),
            ),
          ],
        ),

        const SizedBox(height: 12),

        // Hiển thị số lượng còn lại cho size đang được chọn
        Row(
          children: [
            const Icon(Icons.inventory_2_outlined, size: 18, color: Colors.grey),
            const SizedBox(width: 6),
            Text(
              'Available quantity: ${_sizeQuantities[_selectedSize]} ',
              style: const TextStyle(
                fontSize: 14,
                color: Colors.grey,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ],
    );
  }
}

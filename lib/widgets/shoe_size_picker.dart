import 'package:flutter/material.dart';

import 'package:input_quantity/input_quantity.dart';
import '../models/product_size_model.dart';

class ShoeSizePicker extends StatefulWidget {
  final List<ProductSizeModel> sizes;
  final Function(ProductSizeModel? selectedSize, int quantity) onChanged;

  const ShoeSizePicker({
    super.key,
    required this.sizes,
    required this.onChanged,
  });

  @override
  State<ShoeSizePicker> createState() => _ShoeSizePickerState();
}

class _ShoeSizePickerState extends State<ShoeSizePicker> {
  ProductSizeModel? _selectedSizeModel;
  int _quantity = 1;

  @override
  void initState() {
    super.initState();
    if (widget.sizes.isNotEmpty) {
      _selectedSizeModel = widget.sizes.first;
      // Gửi giá trị mặc định ban đầu về cho Screen cha
      WidgetsBinding.instance.addPostFrameCallback((_) {
        widget.onChanged(_selectedSizeModel, _quantity);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    int maxStockForSelectedSize = _selectedSizeModel?.so_luong ?? 0;

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
          children: widget.sizes.map((sizeModel) {
            final isSelected = _selectedSizeModel?.size == sizeModel.size;

            return ChoiceChip(
              label: Text(sizeModel.size),
              selected: isSelected,
              // Sự kiện khi người dùng bấm chọn size
              onSelected: (bool selected) {
                if (selected) {
                  setState(() {
                    _selectedSizeModel = sizeModel;
                    _quantity = 1;
                  });
                  widget.onChanged(_selectedSizeModel, _quantity);
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
              showCheckmark:
                  false, // Ẩn dấu tích mặc định của Flutter nếu muốn gọn hơn
            );
          }).toList(),
        ),
        const SizedBox(height: 12),

        Row(
          children: [
            Text(
              'Quantity: ',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            InputQty.int(
              key: ValueKey('${_selectedSizeModel?.size}_$_quantity'),
              maxVal: maxStockForSelectedSize > 0
                  ? maxStockForSelectedSize
                  : 1, // Giá trị tối đa
              minVal: maxStockForSelectedSize > 0 ? 1 : 0, // Giá trị tối thiểu
              initVal: _quantity, // Giá trị mặc định ban đầu
              steps: 1,
              onQtyChanged: (val) {
                final newQty = (val as num).toInt();
                setState(() {
                  _quantity = newQty;
                });
                widget.onChanged(_selectedSizeModel, _quantity);
              }, // Số lượng tăng/giảm mỗi lần nhấn nút
              decoration: QtyDecorationProps(isBordered: false),
              qtyFormProps: const QtyFormProps(
                enableTyping:
                    false, // 🚫 Thêm thuộc tính này để chặn nhập từ bàn phím
              ),
            ),
          ],
        ),

        const SizedBox(height: 12),

        // Hiển thị số lượng còn lại cho size đang được chọn
        Row(
          children: [
            const Icon(
              Icons.inventory_2_outlined,
              size: 18,
              color: Colors.grey,
            ),
            const SizedBox(width: 6),
            Text(
              'Available quantity: $maxStockForSelectedSize',
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

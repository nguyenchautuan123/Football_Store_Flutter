import 'package:flutter/material.dart';

class DatePicker extends StatefulWidget {
  const DatePicker({super.key});

  @override
  State<DatePicker> createState() => _DatePickerState();
}

class _DatePickerState extends State<DatePicker> {
  // 1. Tạo controller để quản lý chữ hiển thị trong TextFormField
  final TextEditingController _dateController = TextEditingController();
  DateTime? _selectedDate;

  @override
  void dispose() {
    _dateController.dispose();
    super.dispose();
  }

  // 2. Hàm kích hoạt Pop-up lịch
  Future<void> _showMyDatePicker() async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _selectedDate ?? DateTime.now(),
      firstDate: DateTime(
        1900,
      ), // Cho phép chọn từ năm 1900 (phù hợp làm ngày sinh)
      lastDate: DateTime(2100),

      // Tùy chỉnh màu sắc Pop-up lịch đồng bộ với app của bạn
      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: ColorScheme.light(
              primary: Colors.lightGreenAccent.shade400, // Màu chủ đạo Pop-up
              onPrimary: Colors.black, // Màu chữ trên nền xanh
              onSurface: Colors.black, // Màu chữ các ngày trong tháng
            ),
          ),
          child: child!,
        );
      },
    );

    // 3. Nếu người dùng chọn ngày hợp lệ, cập nhật lên TextFormField
    if (picked != null) {
      setState(() {
        _selectedDate = picked;
        // Định dạng ngày hiển thị: Ngày/Tháng/Năm (Ví dụ: 25/12/2026)
        // Thêm số 0 phía trước nếu ngày/tháng < 10
        String day = picked.day.toString().padLeft(2, '0');
        String month = picked.month.toString().padLeft(2, '0');
        String year = picked.year.toString();

        _dateController.text = "$day/$month/$year";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: TextFormField(
        controller: _dateController,

        // Cực kỳ quan trọng: Khóa không cho người dùng gõ chữ bằng bàn phím
        readOnly: true,

        // Khi người dùng ấn vào ô nhập, kích hoạt hàm gọi Pop-up lịch
        onTap: _showMyDatePicker,

        // Hỗ trợ kiểm tra dữ liệu nếu bỏ vào Form
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Vui lòng chọn ngày, tháng, năm';
          }
          return null;
        },

        // Trang trí giao diện giống hệt các ô nhập liệu khác
        decoration: InputDecoration(
          hintText: 'Date of birth',
          prefixIcon: const Icon(
            Icons.calendar_month_outlined,
          ), // Icon lịch ở đầu ô
          border: const OutlineInputBorder(), // Viền ô vuông bo góc
          // Viền khi được chọn (màu xanh lá tương tự bottomNavigationBar của bạn)
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.lightGreenAccent.shade400,
              width: 2,
            ),
          ),
        ),
      ),
    );
  }
}

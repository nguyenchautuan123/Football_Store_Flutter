// ĐÂY LÀ TRANG PROFILE CỦA ỨNG DỤNG

import 'dart:ui';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'profile_screen/about_us.dart';
import 'profile_screen/address.dart';
import 'profile_screen/address_and_contact.dart';
import 'profile_screen/change_password.dart';
import 'profile_screen/favourite.dart';
import 'profile_screen/order.dart';
import 'profile_screen/personal_profile.dart';
import 'profile_screen/policies_and_terms.dart';

class MyCustomScrollBehavior extends MaterialScrollBehavior {
  @override
  Set<PointerDeviceKind> get dragDevices => {
    PointerDeviceKind.touch,
    PointerDeviceKind.mouse, // Kích hoạt kéo cuộn bằng chuột
    PointerDeviceKind.trackpad,
  };
}

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  File? _imageFile; // Lưu trữ tệp ảnh đã chọn
  final ImagePicker _imagePicker = ImagePicker();
  static const String _avatarKey = 'user_avatar_path';

  @override
  void initState() {
    super.initState();
    _loadSavedAvatar();
  }

  Future<void> _loadSavedAvatar() async {
    final preferences = await SharedPreferences.getInstance();
    final String? imagePath = preferences.getString(_avatarKey);

    if (imagePath != null && imagePath.isNotEmpty) {
      final savedFile = File(imagePath);
      if (await savedFile.exists()) {
        setState(() {
          _imageFile = savedFile;
        });
      }
    }
  }

  // Hàm xử lý chọn ảnh từ bộ sưu tập
  Future<void> _pickImage() async {
    final XFile? pickedFile = await _imagePicker.pickImage(
      source: ImageSource.gallery,
      imageQuality: 80, // Nén ảnh xuống 80% để giảm dung lượng
    );

    if (pickedFile != null) {
      setState(() {
        _imageFile = File(pickedFile.path);
      });

      final preferences = await SharedPreferences.getInstance();
      await preferences.setString(_avatarKey, pickedFile.path);
    }
  }

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> menuItems = [
      {
        'title': 'Personal profile',
        'icon': Icons.person,
        'screen': const PersonalProfile(),
      },
      {
        'title': 'Order',
        'icon': Icons.shopping_cart_checkout,
        'screen': const Order(),
      },
      {
        'title': 'Favourites',
        'icon': Icons.favorite_outlined,
        'screen': const Favourite(),
      },
      {
        'title': 'Address',
        'icon': Icons.location_on,
        'screen': const Address(),
      },
      {'title': 'About us', 'icon': Icons.info, 'screen': const AboutUs()},
      {
        'title': 'Policies and Terms',
        'icon': Icons.policy,
        'screen': const PoliciesAndTerms(),
      },
      {
        'title': 'Address and Contact',
        'icon': Icons.phone,
        'screen': const AddressAndContact(),
      },
      {
        'title': 'Change Password',
        'icon': Icons.lock,
        'screen': const ChangePassword(),
      },
    ];

    return MaterialApp(
      scrollBehavior: MyCustomScrollBehavior(),
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text("Profile"),
          backgroundColor: Colors.lightGreenAccent.shade400,
        ),
        body: Container(
          padding: EdgeInsets.all(10),
          child: ListView(
            children: [
              Container(
                width: double.infinity,
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.grey[200],
                ),
                child: Column(
                  children: [
                    Container(
                      child: GestureDetector(
                        onTap: _pickImage,
                        child: Stack(
                          children: [
                            CircleAvatar(
                              radius: 50,
                              // 1. Kiểm tra nếu có ảnh mới thì hiển thị, nếu không dùng ảnh mặc định
                              backgroundImage: _imageFile != null
                                  ? FileImage(_imageFile!)
                                  : const AssetImage(
                                          'assets/default_avatar/default-avatar.png',
                                        )
                                        as ImageProvider,
                            ),
                          ],
                        ),
                      ),
                    ),
                    Container(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            'Logan Nguyen',
                            style: TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            'chautuan1708@gmail.com',
                            style: TextStyle(fontSize: 16),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                width: double.infinity,
                child: ListView.separated(
                  shrinkWrap: true, // Giúp danh sách co giãn vừa nội dung
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: menuItems.length,
                  separatorBuilder: (context, index) => Divider(
                    height: 1,
                    color: Colors.lightGreenAccent.shade400,
                  ),
                  itemBuilder: (context, index) {
                    final item = menuItems[index];
                    return ListTile(
                      leading: Icon(
                        item['icon'],
                        color: Colors.lightGreenAccent.shade400,
                      ),
                      title: Text(
                        item['title'],
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => item['screen'],
                          ),
                        );
                      },
                    );
                  },
                ),
              ),
              Container(
                child: ElevatedButton.icon(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.lightGreenAccent.shade400,
                    foregroundColor: Colors.white,
                  ),
                  icon: Icon(Icons.exit_to_app),
                  label: Text('Sign out'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

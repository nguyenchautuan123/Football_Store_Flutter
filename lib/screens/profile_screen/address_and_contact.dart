import 'package:flutter/material.dart';

class AddressAndContact extends StatefulWidget {
  const AddressAndContact({super.key});

  @override
  State<AddressAndContact> createState() => _AddressAndContactState();
}

class _AddressAndContactState extends State<AddressAndContact> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Địa chỉ & Liên hệ",
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black87),
        ),
        centerTitle: true,
        backgroundColor: Colors.lightGreenAccent.shade400,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Top banner
              Center(
                child: Column(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: Colors.lightGreenAccent.shade400.withOpacity(
                          0.15,
                        ),
                        shape: BoxShape.circle,
                      ),
                      child: Icon(
                        Icons.contact_support_rounded,
                        size: 50,
                        color: Colors.green.shade800,
                      ),
                    ),
                    const SizedBox(height: 12),
                    const Text(
                      'Kết nối với Wonder Football',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.black87,
                      ),
                    ),
                    const SizedBox(height: 6),
                    Text(
                      'Chúng tôi luôn sẵn sàng hỗ trợ bạn mọi lúc mọi nơi',
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.grey.shade600,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 24),

              // Section 1: Address
              _buildSectionTitle('HỆ THỐNG CỬA HÀNG'),
              _buildContactCard(
                icon: Icons.location_on_rounded,
                iconColor: Colors.red.shade600,
                backgroundColor: Colors.red.shade50,
                title: 'Cửa hàng Flagship TP.HCM',
                subtitle:
                    'Số 123 Đường Ba Tháng Hai, Phường 11, Quận 10, TP. Hồ Chí Minh',
              ),
              _buildContactCard(
                icon: Icons.location_on_rounded,
                iconColor: Colors.orange.shade800,
                backgroundColor: Colors.orange.shade50,
                title: 'Chi nhánh Hà Nội',
                subtitle:
                    'Số 456 Đường Nguyễn Trãi, Thanh Xuân Trung, Thanh Xuân, Hà Nội',
              ),
              const SizedBox(height: 16),

              // Section 2: Quick Contacts
              _buildSectionTitle('THÔNG TIN LIÊN HỆ'),
              _buildContactCard(
                icon: Icons.phone_in_talk_rounded,
                iconColor: Colors.green.shade700,
                backgroundColor: Colors.green.shade50,
                title: 'Hotline CSKH & Mua hàng',
                subtitle: '1900 1234 (8:00 - 22:00)',
              ),
              _buildContactCard(
                icon: Icons.phone_android_rounded,
                iconColor: Colors.teal.shade700,
                backgroundColor: Colors.teal.shade50,
                title: 'Hotline Phản ánh dịch vụ',
                subtitle: '0909 123 456 (24/7)',
              ),
              _buildContactCard(
                icon: Icons.email_rounded,
                iconColor: Colors.blue.shade700,
                backgroundColor: Colors.blue.shade50,
                title: 'Email hỗ trợ',
                subtitle: 'support@wonderfootball.com',
              ),
              _buildContactCard(
                icon: Icons.business_rounded,
                iconColor: Colors.indigo.shade700,
                backgroundColor: Colors.indigo.shade50,
                title: 'Email hợp tác doanh nghiệp',
                subtitle: 'partnership@wonderfootball.com',
              ),
              const SizedBox(height: 16),

              // Section 3: Social Media
              _buildSectionTitle('MẠNG XÃ HỘI'),
              _buildContactCard(
                icon: Icons.facebook_rounded,
                iconColor: const Color(0xFF1877F2),
                backgroundColor: const Color(0xFF1877F2).withOpacity(0.08),
                title: 'Facebook Fanpage',
                subtitle: 'Wonder Football Việt Nam',
              ),
              _buildContactCard(
                icon: Icons.camera_alt_rounded,
                iconColor: const Color(0xFFE1306C),
                backgroundColor: const Color(0xFFE1306C).withOpacity(0.08),
                title: 'Instagram Feed',
                subtitle: '@wonder.football.store',
              ),
              _buildContactCard(
                icon: Icons.play_circle_fill_rounded,
                iconColor: const Color(0xFFFF0000),
                backgroundColor: const Color(0xFFFF0000).withOpacity(0.08),
                title: 'Youtube Channel',
                subtitle: 'Wonder Football TV (Review giày bóng đá)',
              ),
              _buildContactCard(
                icon: Icons.alternate_email_rounded,
                iconColor: Colors.black87,
                backgroundColor: Colors.grey.shade100,
                title: 'X (Twitter)',
                subtitle: '@WonderFootball_VN',
              ),
              const SizedBox(height: 24),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.only(left: 4, bottom: 8, top: 8),
      child: Text(
        title,
        style: const TextStyle(
          fontSize: 13,
          fontWeight: FontWeight.bold,
          color: Colors.grey,
          letterSpacing: 1.1,
        ),
      ),
    );
  }

  Widget _buildContactCard({
    required IconData icon,
    required Color iconColor,
    required Color backgroundColor,
    required String title,
    required String subtitle,
  }) {
    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      elevation: 1,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
        side: BorderSide(color: Colors.grey.shade200),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 14.0, horizontal: 16.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: backgroundColor,
                shape: BoxShape.circle,
              ),
              child: Icon(icon, color: iconColor, size: 22),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    subtitle,
                    style: TextStyle(
                      fontSize: 13.5,
                      color: Colors.grey.shade700,
                      height: 1.35,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

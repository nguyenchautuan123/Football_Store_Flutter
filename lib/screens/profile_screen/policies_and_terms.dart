import 'package:flutter/material.dart';

class PoliciesAndTerms extends StatefulWidget {
  const PoliciesAndTerms({super.key});

  @override
  State<PoliciesAndTerms> createState() => _PoliciesAndTermsState();
}

class _PoliciesAndTermsState extends State<PoliciesAndTerms> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Chính sách & Điều khoản",
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
              // Header banner
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.green.shade50,
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: Colors.green.shade100),
                ),
                child: Row(
                  children: [
                    Icon(
                      Icons.gavel_rounded,
                      color: Colors.green.shade700,
                      size: 28,
                    ),
                    const SizedBox(width: 12),
                    const Expanded(
                      child: Text(
                        'Các chính sách này được áp dụng nhằm đảm bảo quyền lợi tốt nhất cho khách hàng khi mua sắm tại Wonder Football.',
                        style: TextStyle(
                          fontSize: 14,
                          height: 1.4,
                          color: Colors.black87,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),

              // Policies list using ExpansionTiles
              _buildPolicyCard(
                icon: Icons.verified_user_rounded,
                title: '1. Cam kết chính hãng 100%',
                content:
                    'Tất cả sản phẩm giày bóng đá được phân phối tại Wonder Football đều cam kết chính hãng 100% từ các thương hiệu hàng đầu thế giới (Nike, Adidas, Puma, Mizuno...). Chúng tôi cam kết hoàn tiền 200% giá trị sản phẩm nếu phát hiện hàng giả, hàng nhái từ phía cửa hàng.',
              ),
              _buildPolicyCard(
                icon: Icons.swap_horiz_rounded,
                title: '2. Chính sách Đổi size & Đổi trả',
                content:
                    '• Hỗ trợ đổi size hoặc đổi mẫu trong vòng 7 ngày kể từ ngày nhận sản phẩm.\n• Sản phẩm đổi trả phải còn nguyên tem, mác, hộp giày đi kèm và chưa qua sử dụng (chưa ra sân đá thử, không bị bẩn hoặc trầy xước phần đế giày).\n• Khách hàng vui lòng chịu phí ship 2 chiều khi đổi size nếu không thể đến trực tiếp cửa hàng.',
              ),
              _buildPolicyCard(
                icon: Icons.verified_rounded,
                title: '3. Chính sách Bảo hành sản phẩm',
                content:
                    '• Hỗ trợ bảo hành keo và chỉ khâu hoàn toàn miễn phí trong vòng 90 ngày kể từ ngày mua hàng.\n• Không áp dụng bảo hành đối với các lỗi do hao mòn tự nhiên, giày bị rách hoặc biến dạng do va chạm mạnh trong quá trình thi đấu, hoặc giặt sấy giày không đúng cách dẫn đến hỏng da.',
              ),
              _buildPolicyCard(
                icon: Icons.local_shipping_rounded,
                title: '4. Chính sách Giao hàng & Đồng kiểm',
                content:
                    '• Thời gian giao hàng dự kiến từ 2-4 ngày làm việc trên toàn quốc.\n• Khách hàng được quyền mở hộp kiểm tra sản phẩm trước khi thanh toán (đồng kiểm) với shipper để đảm bảo đúng mẫu mã, đúng kích thước và không bị lỗi vận chuyển.',
              ),
              _buildPolicyCard(
                icon: Icons.security_rounded,
                title: '5. Chính sách Bảo mật thông tin',
                content:
                    'Wonder Football cam kết bảo mật tuyệt đối thông tin cá nhân của khách hàng (họ tên, số điện thoại, địa chỉ, lịch sử đơn hàng). Thông tin chỉ được sử dụng cho mục đích xác nhận đơn hàng, hỗ trợ vận chuyển và cải thiện chất lượng phục vụ của chúng tôi.',
              ),

              const SizedBox(height: 24),

              // Contact support section
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.grey.shade100,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Bạn cần hỗ trợ thêm?',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.black87,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      'Nếu có bất kỳ thắc mắc nào liên quan đến chính sách và điều khoản sử dụng, vui lòng liên hệ ngay với bộ phận CSKH của chúng tôi:',
                      style: TextStyle(
                        fontSize: 13,
                        color: Colors.grey.shade700,
                        height: 1.4,
                      ),
                    ),
                    const SizedBox(height: 12),
                    Row(
                      children: [
                        Icon(
                          Icons.phone_in_talk_rounded,
                          color: Colors.green.shade700,
                          size: 18,
                        ),
                        const SizedBox(width: 8),
                        const Text(
                          'Hotline: 1900 1234 (8:00 - 22:00)',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    Row(
                      children: [
                        Icon(
                          Icons.email_rounded,
                          color: Colors.green.shade700,
                          size: 18,
                        ),
                        const SizedBox(width: 8),
                        const Text(
                          'Email: support@wonderfootball.com',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildPolicyCard({
    required IconData icon,
    required String title,
    required String content,
  }) {
    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      elevation: 1,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
        side: BorderSide(color: Colors.grey.shade200),
      ),
      child: ExpansionTile(
        leading: Icon(icon, color: Colors.green.shade700),
        title: Text(
          title,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 15,
            color: Colors.black87,
          ),
        ),
        collapsedShape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(12)),
        ),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(12)),
        ),
        childrenPadding: const EdgeInsets.only(left: 16, right: 16, bottom: 16),
        children: [
          const Divider(height: 1),
          const SizedBox(height: 12),
          Text(
            content,
            style: TextStyle(
              fontSize: 14,
              height: 1.5,
              color: Colors.grey.shade800,
            ),
          ),
        ],
      ),
    );
  }
}

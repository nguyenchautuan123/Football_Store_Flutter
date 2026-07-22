import 'package:flutter/material.dart';

class AboutUs extends StatefulWidget {
  const AboutUs({super.key});

  @override
  State<AboutUs> createState() => _AboutUsState();
}

class _AboutUsState extends State<AboutUs> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Về chúng tôi",
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black87),
        ),
        centerTitle: true,
        backgroundColor: Colors.lightGreenAccent.shade400,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Container(
                  margin: const EdgeInsets.only(bottom: 24),
                  padding: const EdgeInsets.symmetric(
                    vertical: 16,
                    horizontal: 24,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.lightGreenAccent.shade100.withOpacity(0.3),
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(
                      color: Colors.lightGreenAccent.shade400,
                      width: 1.5,
                    ),
                  ),
                  child: Column(
                    children: [
                      Icon(
                        Icons.sports_soccer,
                        size: 48,
                        color: Colors.green.shade800,
                      ),
                      const SizedBox(height: 8),
                      Text(
                        'Wonder Football',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Colors.green.shade900,
                          letterSpacing: 1.2,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        'Giày Bóng Đá Chính Hãng',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: Colors.grey.shade700,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const Text(
                'Chào mừng bạn đến với Wonder Football!',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
              const SizedBox(height: 12),
              Text(
                'Tại Wonder Football, chúng tôi hiểu rằng một đôi giày bóng đá không chỉ đơn thuần là phụ kiện, mà còn là người bạn đồng hành quyết định sự tự tin và thăng hoa trên sân cỏ của mỗi cầu thủ. Chính vì vậy, chúng tôi cam kết mang đến cho bạn những dòng sản phẩm giày bóng đá chính hãng 100% từ các thương hiệu hàng đầu thế giới như Nike, Adidas, Puma, Mizuno...',
                style: TextStyle(
                  fontSize: 15,
                  height: 1.5,
                  color: Colors.grey.shade800,
                ),
              ),
              const SizedBox(height: 24),
              const Text(
                'Giá trị cốt lõi của chúng tôi',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
              const SizedBox(height: 16),
              _buildFeatureItem(
                icon: Icons.verified_user_rounded,
                title: 'Cam kết chính hãng 100%',
                description:
                    'Chất lượng chuẩn mực, nguồn gốc rõ ràng. Nói không với hàng giả, hàng nhái và hàng kém chất lượng.',
              ),
              _buildFeatureItem(
                icon: Icons.flash_on_rounded,
                title: 'Mẫu mã đa dạng & cập nhật',
                description:
                    'Luôn cập nhật những bộ sưu tập mới nhất từ các hãng lớn, đáp ứng mọi vị trí thi đấu và mọi loại mặt sân (FG, AG, TF, IC).',
              ),
              _buildFeatureItem(
                icon: Icons.shopping_bag_rounded,
                title: 'Trải nghiệm mua sắm tối ưu',
                description:
                    'Giao diện thân thiện, quy trình đặt hàng và thanh toán nhanh chóng, hỗ trợ giao hàng tận nơi trên toàn quốc.',
              ),
              _buildFeatureItem(
                icon: Icons.support_agent_rounded,
                title: 'Dịch vụ tư vấn chuyên nghiệp',
                description:
                    'Đội ngũ tư vấn viên nhiệt tình, am hiểu sâu về sản phẩm, sẵn sàng hỗ trợ bạn chọn được đôi giày vừa vặn và phù hợp nhất.',
              ),
              const SizedBox(height: 20),
              Center(
                child: Text(
                  'Hãy để Wonder Football đồng hành cùng bạn trên con đường chinh phục những đỉnh cao mới và tỏa sáng trong mỗi trận đấu!',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 14,
                    fontStyle: FontStyle.italic,
                    fontWeight: FontWeight.w500,
                    color: Colors.grey.shade600,
                  ),
                ),
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildFeatureItem({
    required IconData icon,
    required String title,
    required String description,
  }) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: Colors.lightGreenAccent.shade400.withOpacity(0.2),
              shape: BoxShape.circle,
            ),
            child: Icon(icon, color: Colors.green.shade700, size: 20),
          ),
          const SizedBox(width: 12),
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
                  description,
                  style: TextStyle(
                    fontSize: 14,
                    height: 1.4,
                    color: Colors.grey.shade700,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

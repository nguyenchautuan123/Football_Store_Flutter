// Đây là widget hiển thị sản phẩm nằm trong Cart Screen

import 'package:flutter/material.dart';

class CartItem extends StatelessWidget {
  final String anh_san_pham;
  final String ten_san_pham;
  final String ma_danh_muc;
  final String gia_san_pham;
  final String size;
  final String so_luong;
  final VoidCallback? onTap;
  final VoidCallback? onLongPress;

  const CartItem({
    super.key,
    required this.anh_san_pham,
    required this.ten_san_pham,
    required this.ma_danh_muc,
    required this.gia_san_pham,
    required this.size,
    required this.so_luong,
    required this.onTap,
    required this.onLongPress,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      onLongPress: onLongPress,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
        ),
        width: double.infinity,
        clipBehavior: Clip.antiAlias,
        child: Row(
          children: [
            Expanded(
              flex: 4,
                child: Image.network(
                  anh_san_pham,
                  fit: BoxFit.cover,
                ),
            ),
            Expanded(
              flex: 6,
              child: Container(
                padding: EdgeInsets.all(10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      ten_san_pham,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis, // Nếu quá dài sẽ hiện dấu '...'
                    ),
                    Text(
                      ma_danh_muc,
                    ),

                    Container(
                      child: Row(
                        children: [
                          Text('Size: $size'),
                          SizedBox(width: 10,),
                          Text('Quantity: $so_luong'),
                        ],
                      ),
                    ),

                    Container(
                      width: double.infinity,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            child: Row(
                              children: [
                                Icon(Icons.attach_money),
                                Text(
                                  gia_san_pham,
                                  style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold, ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            child: Row(
                              children: [
                                IconButton(
                                  icon: const Icon(Icons.delete, color: Colors.red,),
                                  color: Colors.black, // Màu của icon
                                  onPressed: () {},
                                  style: IconButton.styleFrom(
                                    fixedSize: const Size(double.infinity, 50),
                                  ),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

}
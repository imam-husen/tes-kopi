import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class CoffeeItem extends StatelessWidget {
  final Map<String, dynamic> coffeeData;

  const CoffeeItem({super.key, required this.coffeeData});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 150.w,
      padding: EdgeInsets.all(10.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 10,
            offset: const Offset(0, 5),
          )
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(10.r),
                child: Image.network(
                  coffeeData['imageURL'] ?? '', // Pastikan tidak null
                  width: double.infinity, // Agar tidak mengecil ke kiri
                  height: 100.h,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) {
                    return Container(
                      width: double.infinity,
                      height: 100.h,
                      color: Colors.grey[300], // Placeholder warna abu-abu
                      child: Icon(Icons.broken_image,
                          size: 40.sp, color: Colors.grey),
                    );
                  },
                ),
              ),
              Positioned(
                top: 0.h,
                right: 0.w,
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 6.w, vertical: 3.h),
                  decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.5),
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(10.r),
                      topRight: Radius.circular(10.r),
                    ),
                  ),
                  child: Row(
                    children: [
                      Icon(Icons.star, color: Colors.orange, size: 14.sp),
                      SizedBox(width: 3.w),
                      Text(
                        (coffeeData['rating'] ?? 0.0)
                            .toStringAsFixed(1), // Pastikan tidak null
                        style: GoogleFonts.sora(
                          fontSize: 12.sp,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 10.h),
          Text(
            coffeeData['name'] ?? 'Unknown', // Pastikan tidak null
            style: GoogleFonts.sora(
              fontSize: 16.sp,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            coffeeData['type'] ?? 'Unknown',
            style: GoogleFonts.sora(
              fontSize: 12.sp,
              color: Colors.grey,
            ),
          ),
          SizedBox(height: 5.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "\$${(coffeeData['price'] ?? 0.0).toStringAsFixed(2)}",
                style: GoogleFonts.sora(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.bold,
                  color: const Color.fromRGBO(5, 5, 5, 1),
                ),
              ),
              Container(
                padding: EdgeInsets.all(5.w),
                decoration: BoxDecoration(
                  color: Colors.brown,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Icon(Icons.add, color: Colors.white, size: 16.sp),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

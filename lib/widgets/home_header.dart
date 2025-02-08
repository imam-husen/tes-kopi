import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeHeader extends StatelessWidget {
  const HomeHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 375.w,
      height: 280.h,
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 40.h),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            const Color.fromRGBO(17, 17, 17, 1),
            const Color.fromRGBO(49, 49, 49, 1).withOpacity(0.9)
          ],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Lokasi & Dropdown
          Text(
            "Location",
            style: GoogleFonts.sora(
              fontSize: 14.sp,
              fontWeight: FontWeight.w400,
              color: Colors.white.withOpacity(0.7),
            ),
          ),
          SizedBox(height: 5.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                "Bilzen, Tanjungbalai",
                style: GoogleFonts.sora(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.bold,
                  color: Colors.white, // Warna putih
                ),
              ),
              Icon(Icons.keyboard_arrow_down, size: 20.sp, color: Colors.white),
            ],
          ),
          SizedBox(height: 60.h),

          // Search Bar
          Row(
            children: [
              // Input Box
              Expanded(
                child: TextField(
                  decoration: InputDecoration(
                    hintText: "Search coffee",
                    hintStyle: GoogleFonts.sora(
                      fontSize: 14.sp,
                      color: const Color.fromRGBO(162, 162, 162, 1),
                    ),
                    prefixIcon: Icon(Icons.search, color: Colors.grey),
                    filled: true,
                    fillColor: const Color.fromARGB(255, 70, 68, 68)
                        .withOpacity(0.1), // Lebih transparan
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12.r),
                      borderSide: BorderSide.none,
                    ),
                  ),
                ),
              ),

              SizedBox(width: 10.w),

              // Filter Button
              Container(
                height: 45.h,
                width: 45.w,
                decoration: BoxDecoration(
                  color: const Color.fromRGBO(198, 124, 78, 1),
                  borderRadius: BorderRadius.circular(12.r),
                ),
                child: Icon(Icons.tune, color: Colors.white),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

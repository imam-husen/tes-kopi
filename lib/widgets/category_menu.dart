import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class CategoryMenu extends StatefulWidget {
  const CategoryMenu({super.key});

  @override
  _CategoryMenuState createState() => _CategoryMenuState();
}

class _CategoryMenuState extends State<CategoryMenu> {
  final List<String> categories = [
    "All Coffee",
    "Macchiato",
    "Latte",
    "Americano"
  ];
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40.h,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        padding: EdgeInsets.only(left: 20.w),
        itemCount: categories.length,
        itemBuilder: (context, index) {
          bool isSelected = selectedIndex == index;
          return GestureDetector(
            onTap: () {
              setState(() {
                selectedIndex = index;
              });
            },
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 8.h),
              margin: EdgeInsets.only(right: 15.w), // Spasi antar kategori
              decoration: BoxDecoration(
                color: isSelected
                    ? const Color.fromRGBO(198, 124, 78, 1)
                    : Colors.transparent,
                borderRadius: BorderRadius.circular(6.r),
              ),
              child: Text(
                categories[index],
                style: GoogleFonts.sora(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w600,
                  color: isSelected
                      ? Colors.white
                      : const Color.fromRGBO(49, 49, 49, 1),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

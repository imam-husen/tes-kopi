import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({super.key});

  @override
  _BottomNavBarState createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
      padding: EdgeInsets.symmetric(vertical: 10.h),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(30.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 10,
            offset: Offset(0, -2),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _buildNavItem("assets/icons/Home.svg", 0),
          _buildNavItem("assets/icons/Heart.svg", 1),
          _buildNavItem("assets/icons/Bag.svg", 2),
          _buildNavItem("assets/icons/Notification.svg", 3),
        ],
      ),
    );
  }

  Widget _buildNavItem(String iconPath, int index) {
    bool isSelected = _selectedIndex == index;

    return GestureDetector(
      onTap: () => _onItemTapped(index),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SvgPicture.asset(
            iconPath,
            width: 24.w,
            height: 24.h,
            colorFilter: ColorFilter.mode(
              isSelected ? Colors.brown : Colors.grey,
              BlendMode.srcIn,
            ),
          ),
          SizedBox(height: 4.h), // Jarak ke garis bawah
          AnimatedContainer(
            duration: Duration(milliseconds: 300),
            width: isSelected ? 30.w : 0, // Garis hanya tampil saat dipilih
            height: 3.h,
            decoration: BoxDecoration(
              color: Colors.brown,
              borderRadius: BorderRadius.circular(2.r),
            ),
          ),
        ],
      ),
    );
  }
}

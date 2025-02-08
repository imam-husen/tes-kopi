import 'package:flutter/material.dart';
import 'package:kopi/widgets/home_header.dart';
import 'package:kopi/widgets/promo_banner.dart';
import 'package:kopi/widgets/category_menu.dart';
import 'package:kopi/widgets/coffe_list.dart';
import 'package:kopi/widgets/bottom_navigation.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            HomeHeader(),
            PromoBanner(),
            CategoryMenu(),
            Expanded(child: CoffeeList()),
            BottomNavBar(),
          ],
        ),
      ),
    );
  }
}

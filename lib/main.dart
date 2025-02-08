import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kopi/screens/home_screen.dart';
import 'package:firebase_core/firebase_core.dart';
// Pastikan ada file ini
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),

      // Ukuran desain Figma (iPhone X)
      builder: (context, child) {
        return const MaterialApp(
          home: HomeScreen(),
        );
      },
    );
  }
}

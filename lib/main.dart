import 'package:flutter/material.dart';
import 'package:flutter_system_overlay/home/features/views/home_view.dart';

import 'home/data/constants/home_colors.dart';


import 'home/features/widgets/true_caller_overlay.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

@pragma("vm:entry-point")
void overlayMain() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
    const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: TrueCallerOverlay(),
    ),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: MyColors.kScaffoldColor,
        colorScheme: ColorScheme.fromSeed(seedColor: MyColors.kPrimaryColor),
        useMaterial3: true,
      ),
      home: HomeView(),
    );
  }
}

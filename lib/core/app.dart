import 'package:flutter/material.dart';
import 'theme/light.dart';
import '../features/products/presentation/pages/products_page.dart';

/// Main Entry for app.
class MainApp extends StatelessWidget {
  /// Main Entry for app.
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: AppTheme.lightTheme,
      home: const ProductsPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

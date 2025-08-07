import 'package:flutter/material.dart';
import 'core/app.dart';
import 'package:homecenter/core/dependency_injection/injection_container.dart'
    as di;

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  di.init();

  runApp(const MainApp());
}

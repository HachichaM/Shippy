import 'package:flutter/cupertino.dart';
import 'config/app_routes.dart';
import 'index.dart';

void main() {
  runApp(InfinityCRM());
}

class InfinityCRM extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'everly',
      theme: AppTheme.lightTheme, // We'll define this in app_theme.dart
      initialRoute: Discover.routeName,
      routes: AppRoutes.routes,
      debugShowCheckedModeBanner: false,
    );
  }
}

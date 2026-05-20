// lib/main.dart
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'cart_provider.dart';
import 'screens/splash_screen.dart';
import 'screens/menu_screen.dart';
import 'screens/success_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.light,
    ),
  );
  runApp(const CulinaryCreationsApp());
}

class CulinaryCreationsApp extends StatefulWidget {
  const CulinaryCreationsApp({super.key});

  @override
  State<CulinaryCreationsApp> createState() => _CulinaryCreationsAppState();
}

class _CulinaryCreationsAppState extends State<CulinaryCreationsApp> {
  // Single CartProvider shared across the app
  final CartProvider _cartProvider = CartProvider();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Culinary Creations',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFFD32F2F),
          brightness: Brightness.light,
        ),
        useMaterial3: true,
        scaffoldBackgroundColor: const Color(0xFFFFF8F2),
        appBarTheme: const AppBarTheme(
          elevation: 0,
          backgroundColor: Colors.transparent,
          foregroundColor: Color(0xFF1A1A1A),
        ),
      ),
      initialRoute: '/',
      onGenerateRoute: (settings) {
        switch (settings.name) {
          case '/':
            return _pageRoute(const SplashScreen());
          case '/menu':
            return _pageRoute(MenuScreen(cartProvider: _cartProvider));
          case '/success':
            return _pageRoute(const SuccessScreen());
          default:
            return _pageRoute(const SplashScreen());
        }
      },
    );
  }

  PageRoute _pageRoute(Widget page) {
    return PageRouteBuilder(
      pageBuilder: (_, __, ___) => page,
      transitionsBuilder: (_, anim, __, child) {
        return FadeTransition(opacity: anim, child: child);
      },
      transitionDuration: const Duration(milliseconds: 300),
    );
  }
}

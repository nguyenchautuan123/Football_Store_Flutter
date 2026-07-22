import 'dart:ui';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import './screens/home_screen.dart';
import './screens/search_screen.dart';
import './screens/cart_screen.dart';
import './screens/profile_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyCustomScrollBehavior extends MaterialScrollBehavior {
  @override
  Set<PointerDeviceKind> get dragDevices => {
    PointerDeviceKind.touch,
    PointerDeviceKind.mouse, // Kích hoạt kéo cuộn bằng chuột
    PointerDeviceKind.trackpad,
  };
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      builder: (context, child) {
        return ScrollConfiguration(
          behavior: MyCustomScrollBehavior(),
          child: child!,
        );
      },
      home: const MainScreen(),
    );
  }
}

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});
  @override
  State<StatefulWidget> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedScreen = 0;

  final List<Widget> _screen = [
    const HomeScreen(),
    const SearchScreen(),
    const CartScreen(),
    const ProfileScreen(),
  ];

  void _onScreenSelected(int screen) {
    setState(() {
      _selectedScreen = screen;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screen[_selectedScreen],

      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedScreen,
        onTap: _onScreenSelected,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.lightGreenAccent.shade400,
        selectedIconTheme: const IconThemeData(color: Colors.lightGreenAccent),
        selectedLabelStyle: const TextStyle(color: Colors.lightGreenAccent),
        unselectedItemColor: Colors.grey,
        unselectedIconTheme: const IconThemeData(color: Colors.grey),
        unselectedLabelStyle: const TextStyle(color: Colors.grey),

        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Search'),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
            label: 'Cart',
          ),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
        ],
      ),
    );
  }
}

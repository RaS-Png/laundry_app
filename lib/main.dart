import 'package:flutter/material.dart';
import 'home_screen.dart';
import 'about_laundry_screen.dart';
import 'order_list_screen.dart';
import 'profile_screen.dart';
import 'create_order_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Laundry App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      home: MainNavigationScreen(),
    );
  }
}

class MainNavigationScreen extends StatefulWidget {
  @override
  _MainNavigationScreenState createState() => _MainNavigationScreenState();
}

class _MainNavigationScreenState extends State<MainNavigationScreen> {
  int _selectedIndex = 0;

  final List<Widget> _pages = [
    HomeScreen(),
    AboutLaundryScreen(),
    OrderListScreen(),
    ProfileScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex],
      floatingActionButton: Container(
        height: 65,
        width: 65,
        child: FittedBox(
          child: FloatingActionButton(
            backgroundColor: Color.fromARGB(255, 255, 124, 77),
            shape: CircleBorder(),
            child: Icon(
              Icons.add_rounded,
              color: Colors.white,
              size: 32,
            ),
            elevation: 4,
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => CreateOrderScreen()),
              );
            },
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        shape: CircularNotchedRectangle(),
        notchMargin: 8,
        child: Container(
          height: 60,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              // Left side icons
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Container(
                      width: 60, // Wider touch target
                      height: 60, // Taller touch target
                      child: IconButton(
                        icon: Icon(
                          Icons.home_filled,
                          size: 28, // Slightly larger icon
                        ),
                        color: _selectedIndex == 0
                            ? Colors.blue
                            : Color.fromARGB(255, 187, 187, 187),
                        onPressed: () => _onItemTapped(0),
                        padding: EdgeInsets.zero, // Remove default padding
                      ),
                    ),
                    Container(
                      width: 60,
                      height: 60,
                      child: IconButton(
                        icon: Icon(
                          Icons.info,
                          size: 28,
                        ),
                        color: _selectedIndex == 1
                            ? Colors.blue
                            : Color.fromARGB(255, 187, 187, 187),
                        onPressed: () => _onItemTapped(1),
                        padding: EdgeInsets.zero,
                      ),
                    ),
                  ],
                ),
              ),
              // Space for FAB
              SizedBox(width: 80),
              // Right side icons
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Container(
                      width: 60,
                      height: 60,
                      child: IconButton(
                        icon: Icon(
                          Icons.settings,
                          size: 28,
                        ),
                        color: _selectedIndex == 2
                            ? Colors.blue
                            : Color.fromARGB(255, 187, 187, 187),
                        onPressed: () => _onItemTapped(2),
                        padding: EdgeInsets.zero,
                      ),
                    ),
                    Container(
                      width: 60,
                      height: 60,
                      child: IconButton(
                        icon: Icon(
                          Icons.list,
                          size: 28,
                        ),
                        color: _selectedIndex == 3
                            ? Colors.blue
                            : Color.fromARGB(255, 187, 187, 187),
                        onPressed: () => _onItemTapped(3),
                        padding: EdgeInsets.zero,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_semi_circle/flutter_semi_circle.dart';
import 'package:task/core/widget/app_bar.dart';
import 'package:task/core/widget/calender.dart';
import 'package:task/features/home/presentation/testScreen.dart';
import 'package:task/features/home/presentation/weather_screen.dart';

import '../../../core/widget/constant/chart/chart.dart';
import '../../../core/widget/constant/chart/pie_chart.dart';

class HomeSreen2 extends StatefulWidget {
  static const String route = "/HomeScreen2";
  final String? emailTitle;

  HomeSreen2({this.emailTitle});

  @override
  State<HomeSreen2> createState() => _HomeSreen2State();
}

class _HomeSreen2State extends State<HomeSreen2> {
  int _selectedIndex = 0;

  List<Widget> get _widgetOptions => [
        Test2(), // Screen 0
        _homeBody(), // Screen 1 (main home)
        WeatherScreen(), // Screen 2
      ];

  void _onItemTapped(int index) => setState(() => _selectedIndex = index);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _selectedIndex == 1
          ? CustomAppBar(
              title1: "Hello",
              title2: widget.emailTitle ?? "no email",
            )
          : null,
      endDrawer: _buildDrawer(),
      body: _widgetOptions[_selectedIndex],
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(20.0),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(30),
          child: BottomNavigationBar(
            currentIndex: _selectedIndex,
            onTap: _onItemTapped,
            iconSize: 24,
            backgroundColor: Colors.blueGrey.withOpacity(0.5),
            showSelectedLabels: false,
            showUnselectedLabels: true,
            type: BottomNavigationBarType.fixed,
            selectedItemColor: Colors.white,
            unselectedItemColor: Colors.white70,
            items: const [
              BottomNavigationBarItem(
                icon: Icon(Icons.person),
                label: 'test1',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.settings),
                label: 'test2',
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildDrawer() {
    final user = FirebaseAuth.instance.currentUser;
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          UserAccountsDrawerHeader(
            accountName: const Text("User"),
            accountEmail: Text(user?.email ?? "No Email"),
            currentAccountPicture: const CircleAvatar(
              backgroundColor: Colors.white,
              child: Icon(Icons.person, size: 40),
            ),
            decoration: const BoxDecoration(color: Colors.blue),
          ),
          ListTile(
            leading: const Icon(Icons.logout),
            title: const Text("Log out"),
            onTap: () async {
              await FirebaseAuth.instance.signOut();
              Navigator.pushReplacementNamed(context, 'LoginScreen');
            },
          ),
          user != null && !user.emailVerified
              ? ListTile(
                  leading: const Icon(Icons.email),
                  title: const Text("Verify Email"),
                  onTap: () async {
                    await user.sendEmailVerification();
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text("Verification email sent!")),
                    );
                  },
                )
              : const ListTile(
                  leading: Icon(Icons.check_circle, color: Colors.green),
                  title: Text("Email Verified"),
                ),
        ],
      ),
    );
  }

  Widget _homeBody() {
    final mediaQuery = MediaQuery.of(context);
    final screenWidth = mediaQuery.size.width;
    final screenHeight = mediaQuery.size.height;

    print("Screen Width: $screenWidth");
    print("Screen Height: $screenHeight");

    return SingleChildScrollView(
      padding: EdgeInsets.only(
        top: screenHeight * 0.01,
        left: screenWidth * 0.05,
        right: screenWidth * 0.05,
      ),
      child: Column(
        children: [
          Calendar(),
          SizedBox(height: screenHeight * 0.01),
          FlutterSemiCircle(
            height: screenHeight * 0.35,
            width: screenWidth * 0.7,
            thickness: 20,
            backgroundColor: Colors.blue,
            foregroundColor: const Color.fromARGB(255, 22, 64, 98),
            totalValue: 100,
            currentValue: 50,
            child: const Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Icon(Icons.directions_walk, color: Colors.white),
                SizedBox(height: 2),
                Text('5234', style: TextStyle(fontWeight: FontWeight.bold)),
                Text('steps'),
              ],
            ),
          ),
          SizedBox(height: screenHeight * 0.03),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              MyPieChart("12.4", {
                "Flutter": 5,
                "React": 3,
                "Xamarin": 2,
                "Ionic": 2,
              }),
              MyPieChart("92", {
                "Flutter": 10,
                "React": 13,
                "Xamarin": 12,
                "Ionic": 12,
              }),
              MyPieChart("698", {
                "Flutter": 51,
                "React": 31,
                "Xamarin": 21,
                "Ionic": 21,
              }),
            ],
          ),
          SizedBox(height: screenHeight * 0.02),
          SizedBox(
            width: double.infinity,
            height: screenHeight * 0.3,
            child: Chart(),
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:weaver/pages/dashboard/tabs/add_post.dart';
import 'package:weaver/pages/dashboard/tabs/explore.dart';
import 'package:weaver/pages/dashboard/tabs/home.dart';
import 'package:weaver/pages/dashboard/tabs/profile.dart';
import 'package:weaver/theme.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  int _selectedIndex = 0;
  final List<Widget> _pages = <Widget>[
    const Home(),
    const Explore(),
    const AddPost(),
    const Profile(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text(
      //     'Weaver',
      //     style: TextStyle(
      //       color: primaryColor,
      //       fontSize: 24,
      //       fontWeight: FontWeight.bold,
      //     ),
      //   ),
      //   backgroundColor: backgroundPrimaryColor,
      //   elevation: 0,
      //   actions: [
      //     IconButton(
      //       icon: const Icon(
      //         Icons.notifications_outlined,
      //         color: Colors.white,
      //       ),
      //       onPressed: () {},
      //     ),
      //   ],
      // ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        backgroundColor: backgroundPrimaryColor,
        selectedItemColor: primaryColor,
        unselectedItemColor: subtitleTextColor,
        currentIndex: _selectedIndex,
        onTap: (value) {
          _onItemTapped(value);
        },
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home_rounded, size: 28),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search, size: 28),
            label: 'Explore',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add_box_rounded, size: 28),
            label: 'Create Post',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person, size: 28),
            label: 'Profile',
          ),
        ],
      ),
      backgroundColor: backgroundPrimaryColor,
      resizeToAvoidBottomInset: false,
      body: SafeArea(child: _pages[_selectedIndex]),
    );
  }
}

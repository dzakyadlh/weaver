import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
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
      appBar: AppBar(
        title: Text(
          'Weaver',
          style: GoogleFonts.sora(
            color: primaryColor,
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: backgroundPrimaryColor,
        elevation: 0,
        actions: [
          IconButton(
            icon: const Icon(Icons.add_box_outlined, color: Colors.white),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(Icons.notifications_outlined, color: Colors.white),
            onPressed: () {},
          ),
        ],
      ),
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
            icon: Icon(Icons.person, size: 28),
            label: 'Profile',
          ),
        ],
      ),
      backgroundColor: backgroundPrimaryColor,
      resizeToAvoidBottomInset: false,
      floatingActionButton: Container(
        margin: EdgeInsets.only(right: defaultMargin, bottom: 12),
        child: FloatingActionButton(
          onPressed: () {},
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(50),
          ),
          backgroundColor: primaryColor,
          foregroundColor: primaryTextColor,
          elevation: 2,
          child: const Icon(Icons.edit_outlined, size: 28),
        ),
      ),
      body: SafeArea(child: _pages[_selectedIndex]),
    );
  }
}

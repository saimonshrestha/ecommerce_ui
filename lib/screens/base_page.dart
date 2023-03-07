import 'dart:io';

import 'package:ecommerce_ui/screens/homepage.dart';
import 'package:flutter/material.dart';

class BasePage extends StatefulWidget {
  const BasePage({super.key});

  @override
  State<BasePage> createState() => _BasePageState();
}

class _BasePageState extends State<BasePage> {
  static List<Widget> screens = [
    HomePage(),
    const Text('Search Page',
        style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold)),
    const Text('Profile Page',
        style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold)),
  ];

  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        willPopUp(context);

        return false;
      },
      child: Scaffold(
        backgroundColor: Colors.black,
        // appBar: AppBar(
        //   title: const Text('E commerce UI'),
        //   centerTitle: true,
        // ),
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.fromLTRB(20, 0, 20, 10),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: BottomNavigationBar(
                currentIndex: selectedIndex,
                onTap: (value) {
                  setState(() {
                    selectedIndex = value;
                  });
                },
                type: BottomNavigationBarType.fixed,
                backgroundColor: Colors.grey.shade800,
                selectedItemColor: Colors.white,
                unselectedItemColor: Colors.grey.shade600,
                // elevation: 5,
                items: const [
                  BottomNavigationBarItem(
                      icon: Icon(Icons.home_outlined),
                      label: 'Home',
                      activeIcon: Icon(Icons.home)),
                  BottomNavigationBarItem(
                      icon: Icon(Icons.search_outlined),
                      label: 'Search',
                      activeIcon: Icon(Icons.search)),
                  BottomNavigationBarItem(
                      icon: Icon(Icons.person_2_outlined),
                      label: 'Profile',
                      activeIcon: Icon(Icons.person_2)),
                ]),
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [screens[selectedIndex]],
          ),
        ),
      ),
    );
  }

  Future<dynamic> willPopUp(BuildContext context) {
    return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Are you sure to exit the app ?'),
          titleTextStyle: const TextStyle(
              fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black),
          content: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text('No')),
              const SizedBox(
                width: 20,
              ),
              ElevatedButton(
                  onPressed: () {
                    exit(0);
                  },
                  child: const Text('Ok')),
            ],
          ),
        );
      },
    );
  }
}

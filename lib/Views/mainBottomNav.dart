import 'package:dunnostore/Views/screenHome.dart';
import 'package:dunnostore/Views/screenProfil.dart';
import 'package:dunnostore/Views/screenTransaksi.dart';
import 'package:flutter/material.dart';

class BottomNavMain extends StatefulWidget {
  const BottomNavMain({super.key});

  @override
  State<BottomNavMain> createState() => _BottomNavMainState();
}

class _BottomNavMainState extends State<BottomNavMain> {
  int _selectedIndex = 0;
  static const List<Widget> _widgetOptions = <Widget>[
    Text('Home'),
    Text('Transaksi'),
    Text('Profile'),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget body = _widgetOptions.elementAt(_selectedIndex);
    switch (_selectedIndex) {
      case 0:
        body = HomeScreen();
        break;
      case 1:
        body = TransaksiScreen();
        break;
      case 2:
        body = ProfileScreen();
        break;
    }
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xFF62008F),
          toolbarHeight: 60,
          title: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                width: 40,
                height: 40,
                child: Image.network(
                  'https://images.unsplash.com/photo-1438761681033-6461ffad8d80?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1740&q=80',
                ),
              ),
              Container(
                margin: EdgeInsets.only(left: 30),
                child: Text(
                  'DunnoStore',
                  style: TextStyle(fontFamily: 'Lemon'),
                ),
              ),
            ],
          ),
        ),
        body: body,
        bottomNavigationBar: BottomNavigationBar(
          elevation: 10,
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.list_alt_outlined),
              label: 'Transaksi',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: 'Profile',
            ),
          ],
          currentIndex: _selectedIndex,
          onTap: _onItemTapped,
          selectedItemColor:
              Colors.black, // ubah warna ikon yang dipilih menjadi hitam
          unselectedItemColor: Colors.black.withOpacity(
              0.6), // ubah warna ikon yang tidak dipilih menjadi hitam transparan
        ),
      ),
    );
  }
}

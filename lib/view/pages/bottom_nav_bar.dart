import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:mimoapp/view/resource/app_color.dart';

void main() => runApp(const MaterialApp(home: BottomNavBarPage()));

class BottomNavBarPage extends StatefulWidget {
  const BottomNavBarPage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _BottomNavBarPageState createState() => _BottomNavBarPageState();
}

class _BottomNavBarPageState extends State<BottomNavBarPage> {
  int _page = 0;
  final GlobalKey<CurvedNavigationBarState> _bottomNavigationKey = GlobalKey();

  final List<IconData> _icons = [
    Icons.home,
    Icons.shopping_cart,
    Icons.message,
    Icons.no_meals_rounded,
    Icons.person,
  ];

  final List<Color> _iconColors = [
    AppColor.colorButton,
    Colors.red,
    Colors.green,
    Colors.orange,
    Colors.purple,
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CurvedNavigationBar(
        key: _bottomNavigationKey,
        index: 0,
        height: 60.0,
        items: _icons.asMap().entries.map((entry) {
          int index = entry.key;
          IconData icon = entry.value;
          return Icon(
            icon,
            size: 30,
            color: _page == index ? _iconColors[index] : Colors.grey,
          );
        }).toList(),
        color: const Color.fromARGB(255, 237, 236, 236),
        buttonBackgroundColor: Colors.white,
        backgroundColor: const Color.fromARGB(0, 199, 10, 10),
        animationCurve: Curves.easeInOut,
        animationDuration: const Duration(milliseconds: 600),
        onTap: (index) {
          setState(() {
            _page = index;
          });
        },
        letIndexChange: (index) => true,
      ),
      body: Container(
        color: Color.fromARGB(255, 225, 225, 230),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(_page.toString(), textScaleFactor: 10.0),
              ElevatedButton(
                child: Text('Go To Page of index 1'),
                onPressed: () {
                  final CurvedNavigationBarState? navBarState =
                      _bottomNavigationKey.currentState;
                  navBarState?.setPage(1);
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}

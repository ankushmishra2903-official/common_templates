import 'package:comman_templates/config/palette.dart';
import 'package:flutter/material.dart';

import '../screens/screens.dart';
import '../widgets/widgets.dart';

class NavScreen extends StatefulWidget {
  @override
  _NavScreenState createState() => _NavScreenState();
}

class _NavScreenState extends State<NavScreen> {
  final List<Widget> _screens = [
    HomeScreen(),
    Scaffold(),
    Scaffold(),
    Scaffold(),
    Scaffold(),
  ];
  final List<IconData> _icons = const [
    Icons.home,
    Icons.settings,
    Icons.person,
    Icons.notifications,
    Icons.menu,
  ];
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;
    return DefaultTabController(
      length: _icons.length,
      child: Scaffold(
        appBar: Responsive.isDesktop(context)
            ? PreferredSize(
                preferredSize: Size(screenSize.width, 100.0),
                child: CustomAppBar(
                  icons: _icons,
                  selectedIndex: _selectedIndex,
                  onTap: (index) => setState(() => _selectedIndex = index),
                ),
              )
            : AppBar(
                brightness: Brightness.light,
                backgroundColor: Colors.white,
                elevation: 2,
                title: Text(
                  'facebook',
                  style: const TextStyle(
                    color: Palette.facebookBlue,
                    fontSize: 28.0,
                    fontWeight: FontWeight.bold,
                    letterSpacing: -1.2,
                  ),
                ),
                centerTitle: false,
                actions: [
                  CircleButton(
                    color: Colors.grey.shade200,
                    icon: Icons.search,
                    iconSize: 30.0,
                    onPressed: () => print('Search'),
                  ),
                  CircleButton(
                    color: Colors.grey.shade200,
                    icon: Icons.message,
                    iconSize: 30.0,
                    onPressed: () => print('Messenger'),
                  ),
                ],
              ),
        body: IndexedStack(
          index: _selectedIndex,
          children: _screens,
        ),
        bottomNavigationBar: !Responsive.isDesktop(context)
            ? Container(
                padding: const EdgeInsets.only(bottom: 12.0),
                color: Colors.white,
                child: CustomTabBar(
                  icons: _icons,
                  selectedIndex: _selectedIndex,
                  onTap: (index) => setState(() => _selectedIndex = index),
                ),
              )
            : const SizedBox.shrink(),
      ),
    );
  }
}

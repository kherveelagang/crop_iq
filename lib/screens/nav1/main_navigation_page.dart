import 'package:crop_iq/screens/nav1/home_page.dart';
import 'package:crop_iq/screens/nav2/my_crops_page.dart';
import 'package:crop_iq/screens/nav4/settings.dart';
import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';

class MainNavigationPage extends StatelessWidget {
  const MainNavigationPage({super.key});

  @override
  Widget build(BuildContext context) {
    final PersistentTabController controller = PersistentTabController();

    // Define navigation items
    List<Widget> buildScreens() {
      return [
        const HomePage(),
        const MyFarmsPage(),
        const SettingsPage(),
      ];
    }

    List<PersistentBottomNavBarItem> navBarsItems() {
      return [
        PersistentBottomNavBarItem(
          icon: const Padding(
            padding: EdgeInsets.only(bottom: 5.0),
            child: Icon(Icons.home, size: 24),
          ),
          title: "Home",
          activeColorPrimary: Colors.green,
          inactiveColorPrimary: Colors.grey,
          textStyle: const TextStyle(fontSize: 12),
        ),
        PersistentBottomNavBarItem(
          icon: const Padding(
            padding: EdgeInsets.only(bottom: 5.0),
            child: Icon(Icons.agriculture_rounded, size: 24),
          ),
          title: "Farm",
          activeColorPrimary: Colors.green,
          inactiveColorPrimary: Colors.grey,
          textStyle: const TextStyle(fontSize: 12),
        ),
        PersistentBottomNavBarItem(
          icon: const Padding(
            padding: EdgeInsets.only(bottom: 5.0),
            child: Icon(Icons.settings, size: 24),
          ),
          title: "Settings",
          activeColorPrimary: Colors.green,
          inactiveColorPrimary: Colors.grey,
          textStyle: const TextStyle(fontSize: 12),
        ),
      ];
    }

    return PersistentTabView(
      context,
      controller: controller,
      screens: buildScreens(),
      items: navBarsItems(),
      navBarHeight: 65, // Slightly increase height for better spacing
      navBarStyle: NavBarStyle.style6, // Keeps text and icons aligned cleanly
    );
  }
}

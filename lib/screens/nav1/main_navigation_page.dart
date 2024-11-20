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

    // Define your navigation items
    List<Widget> buildScreens() {
      return [
        const HomePage(),
        const MyCropsPage(),
        const SettingsPage(),
      ];
    }

    List<PersistentBottomNavBarItem> navBarsItems() {
      return [
        PersistentBottomNavBarItem(
          icon: const Icon(Icons.home),
          title: ("Home"),
          activeColorPrimary: Colors.green,
          inactiveColorPrimary: Colors.grey,
        ),
        PersistentBottomNavBarItem(
          icon: const Icon(Icons.local_florist),
          title: ("Crops"),
          activeColorPrimary: Colors.green,
          inactiveColorPrimary: Colors.grey,
        ),
        PersistentBottomNavBarItem(
          icon: const Icon(Icons.settings),
          title: ("Settings"),
          activeColorPrimary: Colors.green,
          inactiveColorPrimary: Colors.grey,
        ),
      ];
    }

    return PersistentTabView(
      context,
      controller: controller,
      screens: buildScreens(),
      items: navBarsItems(),
      navBarStyle: NavBarStyle.style1, // Style of Nav Bar
    );
  }
}

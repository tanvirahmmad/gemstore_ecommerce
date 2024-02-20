import 'package:flutter/material.dart';
import 'package:gemstore_ecommerce/common/color/my_color.dart';
import 'package:gemstore_ecommerce/common/my_assets_strings/my_assets_strings.dart';
import 'package:gemstore_ecommerce/features/screens/add_to_bag_screen/add_to_bag.dart';
import 'package:gemstore_ecommerce/features/screens/home_screen/home_screen.dart';
import 'package:gemstore_ecommerce/features/screens/profile_screen/profile_screen.dart';
import 'package:gemstore_ecommerce/features/screens/search_screen/search_screen.dart';

class NavigationBarSet extends StatefulWidget {
  const NavigationBarSet({super.key});

  @override
  State<NavigationBarSet> createState() => _NavigationBarSetState();
}

class _NavigationBarSetState extends State<NavigationBarSet> {
  int currentIndex = 0;
  List screens = [
    const HomeScreen(),
     SearchScreen(),
    const AddToBag(),
    const ProfileScreen(),
  ];
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: screens[currentIndex],
        bottomNavigationBar: BottomNavigationBar(
            currentIndex: currentIndex,
            onTap: (value) {
              setState(() => currentIndex = value);
            },
            selectedItemColor: Color(int.parse(MyColor.myColorTwo)),
            unselectedItemColor: Colors.grey,
            items: const [
              BottomNavigationBarItem(
                label: "Home",
                icon:
                    ImageIcon(AssetImage(MyAssetsStrings.Navigator_home_image)),
              ),
              BottomNavigationBarItem(
                label: "Search",
                icon: ImageIcon(
                    AssetImage(MyAssetsStrings.Navigator_search_image)),
              ),
              BottomNavigationBarItem(
                label: "Bag",
                icon:
                    ImageIcon(AssetImage(MyAssetsStrings.Navigator_bag_image)),
              ),
              BottomNavigationBarItem(
                label: "Profile",
                icon: ImageIcon(
                    AssetImage(MyAssetsStrings.Navigator_profile_image)),
              ),
            ]),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gemstore_ecommerce/common/color/my_color.dart';
import 'package:gemstore_ecommerce/common/my_assets_strings/my_assets_strings.dart';
import 'package:gemstore_ecommerce/common/my_strings.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}


class _HomeScreenState extends State<HomeScreen> {
  Future<bool> _onWillPop(BuildContext context) async {
    await showDialog(
      context: context,
      builder: (context) =>
          AlertDialog(
            title: Text('Are you sure?'),
            content: Text('Do you want to exit the app?'),
            actions: <Widget>[
              TextButton(
                onPressed: () => Navigator.of(context).pop(false),
                child: Text('No'),
              ),
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop(true);
                  SystemNavigator.pop(); // Use SystemNavigator.pop to exit the app
                },
                child: Text('Yes'),
              ),
            ],
          ),
    );

    return false;
  }
    @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: ()async => _onWillPop(context),
      child: Scaffold(
        appBar: AppBar(
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                padding: const EdgeInsets.only(left: 20),
                child: Text(
                  MyStrings.Home_page_status,
                  style: TextStyle(
                    fontFamily: MY_Assets_Strings.productSans,
                    fontSize: 20,
                    color: Color(int.parse(MyColor.myColorTwo)),
                  ),
                ),
              ),
            ],
          ),
          automaticallyImplyLeading: false,
          actions: [
            Container(
              child: IconButton(
                icon: Image.asset(
                  MY_Assets_Strings.bell_icon,
                ),
                onPressed: () {},
              ),
            ),
          ],
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        body: Column(
          children: [
            Row(
              children: [

                Container(decoration: BoxDecoration(color: Colors.grey,shape: BoxShape.circle),
                  height: 60,
                  width: 60,
                  child:IconButton(
                    icon: Image.asset(
                      MY_Assets_Strings.women_section,
                    ),
                    onPressed: () {},
                  ),),

              ],
            )
          ],
        ),
      ),
    );
  }
}


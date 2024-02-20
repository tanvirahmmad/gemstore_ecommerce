import 'package:flutter/material.dart';
import 'package:gemstore_ecommerce/common/color/my_color.dart';
import 'package:gemstore_ecommerce/common/my_assets_strings/my_assets_strings.dart';
import 'package:gemstore_ecommerce/common/my_strings.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final TextEditingController _searchController = TextEditingController();
  late SharedPreferences _prefs;
  List<String> _recentSearches = [];

  @override
  void initState() {
    super.initState();
    _initPreferences();
  }

  Future<void> _initPreferences() async {
    _prefs = await SharedPreferences.getInstance();
    setState(() {
      _recentSearches = _prefs.getStringList('recentSearches') ?? [];
    });
  }

  void _saveRecentSearch(String query) {
    setState(() {
     _recentSearches.insert(0,query);
      _recentSearches = _recentSearches.toSet().toList(); // Remove duplicates
      if (_recentSearches.length > 5) {
        _recentSearches.removeLast(); // Limit to 5 recent searches
      }
      _prefs.setStringList('recentSearches', _recentSearches);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: const EdgeInsets.only(left: 20),
              child: Text(
                MyStrings.search_bar,
                style: TextStyle(
                  fontFamily: MyAssetsStrings.productSans,
                  fontSize: 20,
                  color: Color(int.parse(MyColor.myColorFour)),
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
                MyAssetsStrings.bell_icon,
              ),
              onPressed: () {},
            ),
          ),
        ],
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              icon: Image.asset(
                MyAssetsStrings.drawer,
              ),
              onPressed: () {
                // Handle drawer icon tap
                Scaffold.of(context).openDrawer();
              },
            );
          },
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 46,
              width: MediaQuery.of(context).size.width * .99,
              child: TextField(
                controller: _searchController,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.grey.shade100,
                  hintStyle: TextStyle(color: Colors.grey.shade500),
                  hintText: "Search",
                  prefixIcon: Container(
                    height: 20,
                    width: 20,
                    child: Icon(
                      color: Colors.grey.shade500,
                      Icons.search,
                    ),
                  ),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16.0),
                      borderSide: BorderSide.none),
                ),
                onSubmitted: (query) {
                  _saveRecentSearch(query);
                  // Perform search or other actions here
                },
              ),
            ),
            SizedBox(height: 16.0),
            Text('Recent Searches',
                style: TextStyle(fontSize: 18.0, color: Colors.grey.shade500)),
            SizedBox(height: 8.0),
            _buildRecentSearchList(),
          ],
        ),
      ),
    );
  }

  Widget _buildRecentSearchList() {
    return Wrap(
      spacing: 8.0,
      children: _recentSearches.map((search) {
        return Chip(
          backgroundColor: Colors.grey.shade100,
          side: BorderSide.none,
          label: Text(
            search,
            style: TextStyle(
                color: Colors.grey.shade500,
                fontSize: 16,
                fontWeight: FontWeight.w600),
          ),
          onDeleted: () {
            _removeRecentSearch(search);
          },
          deleteIconColor:
              Colors.grey.shade500, // Set your desired delete icon color here
        );
      }).toList(),
    );
  }

  void _removeRecentSearch(String search) {
    setState(() {
      _recentSearches.remove(search);
      _prefs.setStringList('recentSearches', _recentSearches);
    });
  }
}

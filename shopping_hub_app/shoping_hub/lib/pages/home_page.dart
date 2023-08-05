import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shopping_hub/components/custom_navigation_bar.dart';
import 'package:shopping_hub/model/category_model.dart';
import 'package:shopping_hub/pages/drawer_page.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:provider/provider.dart';
import 'package:shopping_hub/pages/login_page.dart';
import '../api/api_connection.dart';
import '../auth.dart';
import '../components/categorytiles.dart';
import '../model/item_model.dart';
import 'Item_page.dart';
import 'cart_page.dart';
import 'chat_page.dart';
import 'favorite_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final AuthProvider _authProvider = AuthProvider();
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  late Future<List<Category>> futureCategories;
  bool isDrawerOpen = false;

  int _selectedIndex = 0;
  final List<Color> _bgColors = [
    HexColor("#15CE1F"),
    HexColor("#13B662"),
    HexColor("#119DA4"),
    HexColor("#19647E"),
  ];

  double xOffset = 0;
  double yOffset = 0;
  double scaleFactor = 1;

  void toggleMenu() {
    setState(() {
      if (xOffset == 0 && yOffset == 0) {
        xOffset = 280;
        yOffset = 150;
        scaleFactor = 0.6;
      } else {
        xOffset = 0;
        yOffset = 0;
        scaleFactor = 1;
      }
    });
  }

  void toggleDrawer() {
   /* setState(() {
      xOffset = 0;
      yOffset = 0;
      scaleFactor = 1;
    });*/
    if (_scaffoldKey.currentState!.isDrawerOpen) {
      _scaffoldKey.currentState!.openEndDrawer();
    } else {
      _scaffoldKey.currentState!.openDrawer();
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    futureCategories = ApiConnection.getCategories();
  }

  /*Future<List<Category>> fetchCategories() async {
    return await ApiConnection.getCategories();
  }*/

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle( SystemUiOverlayStyle(
      statusBarColor: HexColor("#15CE1F"), // Set any color you want
      statusBarBrightness: Brightness.dark, //or set color as white
    ));

    Color TextColor = Theme.of(context).brightness == Brightness.dark ? Colors.white : HexColor("#575353");
    Color navbar = Theme.of(context).brightness == Brightness.dark ? HexColor("#3B3B3B") : Colors.white;
    return Scaffold(
      body:  FutureBuilder<List<Category>>(
          future: futureCategories,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              return Center(child: Text('Error: ${snapshot.error}'));
            } else {
              Future.microtask(() =>
                  Provider.of<CategoryModel>(context, listen: false).setCategories(snapshot.data!)
              );
              return Stack(
                children: [
                  DrawerPage(onCloseDrawer: toggleMenu),
                  AnimatedContainer(
                    transform: Matrix4.translationValues(xOffset, yOffset, 0)..scale(scaleFactor),
                    alignment: Alignment.centerLeft,
                    duration: const Duration(milliseconds: 250),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Theme.of(context).colorScheme.background,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(height: 35.0),
                          Container(
                            color: HexColor("#15CE1F"),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Align(
                                  alignment: Alignment.centerRight,
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(horizontal: 5.0, vertical: 8.0),
                                    child: IconButton(
                                      icon: const Icon(
                                        Icons.menu,
                                        color: Colors.white,
                                      ),
                                      iconSize: 35.0,
                                      onPressed: toggleMenu,
                                    ),
                                  ),
                                ),
                                const Padding(
                                  padding: EdgeInsets.only(left: 5),
                                  child: Text(
                                    "Shopping Hub",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(fontSize: 30.0, fontWeight: FontWeight.bold, color: Colors.white),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 65),
                                  child: IconButton(
                                    onPressed: (){
                                      _authProvider.logout().whenComplete(() {
                                        Fluttertoast.showToast(msg: 'Logout Success');
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(builder: (
                                                context) => const LoginPage()));
                                      });
                                    },
                                    icon: const Icon(Icons.logout, color: Colors. white,),
                                  ),

                                )
                              ],
                            ),
                          ),
                          const SizedBox(height: 15,),
                          const Padding(
                            padding: EdgeInsets.symmetric(horizontal: 37.0),
                            child: Align(
                              alignment: Alignment.center,
                              child: Text(
                                "Select Category",
                                textAlign: TextAlign.center,
                                style: TextStyle(fontSize: 22.0, fontWeight: FontWeight.bold, color: Colors.black),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 10.0,
                          ),
                          Expanded(
                            child: Consumer<CategoryModel>(
                              builder: (context, value, child) {
                                return ListView.builder(
                                  itemCount: value.categories.length,
                                  padding: const EdgeInsets.all(12.0),
                                  itemBuilder: (context, index) {
                                    return GestureDetector(
                                      onTap: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) => ItemPage(title: value.categories[index].name),
                                          ),
                                        );
                                      },
                                      child: categoryTiles(
                                        title: value.categories[index].name,
                                        color: const Color(0xFF95FF9A).withOpacity(0.2),
                                      ),
                                    );
                                  },
                                );
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              );
            }
          },
        ),

      bottomNavigationBar: Visibility(
        visible: xOffset == 0 && yOffset == 0,
        child: Container(
           color: navbar,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 10.0),
            child: GNav(
              selectedIndex: _selectedIndex,
              iconSize: 30.0,
              gap: 8.0,
              textSize: 18.0,
              // backgroundColor: Color.fromARGB(255, 199, 77, 77),
              tabBackgroundColor: _bgColors[_selectedIndex],
              activeColor: Colors.white,
              padding: EdgeInsets.all(16.0),
              tabs: [
                GButton(
                  icon: Icons.home_outlined,
                  text: 'Home',
                  iconColor: HexColor("#15CE1F"),
                  onPressed: () {
                    setState(() {
                      _selectedIndex = 0;
                    });
                  },
                ),
                GButton(
                  icon: Icons.shopping_cart_outlined,
                  text: 'Cart',
                  iconColor: HexColor("#13B662"),
                  onPressed: () {
                    setState(() {
                      _selectedIndex = 1;
                    });
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const cartPage()),
                    );
                  },
                ),
                GButton(
                  icon: Icons.chat_bubble_outline_rounded,
                  text: 'Chat',
                  iconColor: HexColor("#13B662"),
                  onPressed: () {
                    setState(() {
                      _selectedIndex = 2;
                    });
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const chatPage()),
                    );
                  },
                ),
                GButton(
                  icon: Icons.favorite_outline,
                  text: 'Favorites',
                  iconColor: HexColor("#13B662"),
                  onPressed: () {
                    setState(() {
                      _selectedIndex = 3;
                    });
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const favPage()),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

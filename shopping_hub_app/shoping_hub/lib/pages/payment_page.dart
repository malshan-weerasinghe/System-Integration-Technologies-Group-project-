import 'dart:math';

import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';
import 'package:shopping_hub/pages/preview.dart';
import 'package:shopping_hub/pages/thankyou.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../auth.dart';
import '../components/custom_navigation_bar1.dart';
import '../model/cart_model.dart';
import 'cart_page.dart';
import 'chat_page.dart';
import 'favorite_page.dart';
import 'home_page.dart';


class Payment extends StatefulWidget {
  const Payment({ Key? key }) : super(key: key);

  @override
  State<Payment> createState() => _PaymentState();
}

class _PaymentState extends State<Payment> {
  AuthProvider authProvider = AuthProvider();
  String? email1;
  String? name;
  int _selectedIndex=0;
  void _onItemTapped(int index){
    setState(() {
      _selectedIndex=index;
    });
  }

  void getData()async {
    name = await authProvider.getUsername();
    email1 = await authProvider.getEmail();
    print(name! + email1!);
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getData();
  }
  @override
  Widget build(BuildContext context) {
    final cartProvider = Provider.of<CartModel>(context,listen: false);
     Color topic = Theme.of(context).brightness == Brightness.dark ? HexColor("#0EC42B") : HexColor("#4D4B4B");
         Color navbar = Theme.of(context).brightness == Brightness.dark ? HexColor("#333333") : Colors.white;
                      Color subtext= Theme.of(context).brightness == Brightness.dark ? HexColor("#FFFFFF") : HexColor("#848484");
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 45.0, right: 40.0, top: 74.0),
              child: Row(
                children: [
                  GestureDetector(
                    onTap: () => Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return const Preview();
                        },
                      ),
                    ),
                    child: Icon(
                      Icons.arrow_back_ios_rounded,
                      color: topic,
                    ),
                  ),
                  const SizedBox(width: 10.0),
                  Padding(
                    padding: const EdgeInsets.only(left: 70.0),
                    child: Text(
                      'Payment',
                      style: TextStyle(
                        fontSize:24.0,
                        fontWeight: FontWeight.bold,
                        color:  topic,
                      ),
                    ),
                  ),
                  
                ],
              ),
            ),
            const SizedBox(height: 67.0),
            Padding(
                    padding: const EdgeInsets.only(left:30.0,right: 40.0),
                    child: Text(
                      'We Accept',
                      style: TextStyle(
                        fontSize:30.0,
                        fontWeight: FontWeight.bold,
                        color:  topic,
                      ),
                    ),
            ),
            const SizedBox(height:50.0),
            Padding(
              padding: const EdgeInsets.only(left:50.0),
              child: Center(
                child: Row(
                    children: [
                      SvgPicture.string(
                        '''
<<<<<<< HEAD
=======
 bottomNavigationBar: Container(
        color:navbar,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 10.0),
          child: GNav(
            // selectedIndex: _selectedIndex,
            iconSize: 30.0,
            gap: 8.0,
            textSize: 18.0,
            // backgroundColor: Colors.white,
            // tabBackgroundColor: _bgColors[_selectedIndex],
            // activeColor: Colors.white,
            padding: EdgeInsets.all(16.0),
            tabs: [
              GButton(
                icon: Icons.home_outlined,
               
                iconColor: HexColor("#15CE1F"),
                iconActiveColor: HexColor("#15CE1F"),
                onPressed: () {
                  setState(() {
                    _selectedIndex = 0;
                  });
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => HomePage()),
                  );
                },
              ),
              GButton(
                icon: Icons.shopping_cart_outlined,
               
                iconColor: HexColor("#13B662"),
                 iconActiveColor: HexColor("#13B662"),
                onPressed: () {
                  setState(() {
                    _selectedIndex = 1;
                  });
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => cartPage()),
                  );
                },
              ),
              GButton(
                icon: Icons.chat_bubble_outline_rounded,
                
                iconColor: HexColor("#119DA4"),
                iconActiveColor: HexColor("#119DA4"),
                onPressed: () {
                  setState(() {
                    _selectedIndex = 2;
                  });
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => chatPage()),
                  );
                },
              ),
              GButton(
                icon: Icons.favorite_outline,
                
                iconColor: HexColor("#19647E"),
                iconActiveColor: HexColor("#19647E"),
                onPressed: () {
                  setState(() {
                    _selectedIndex = 3;
                  });
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => favPage()),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  String generateOrderId() {
    var random = Random();
    // Generate a random number with 6 digits
    var orderId = random.nextInt(900000) + 100000;
    return orderId.toString();
  }
}
>>>>>>> ashen

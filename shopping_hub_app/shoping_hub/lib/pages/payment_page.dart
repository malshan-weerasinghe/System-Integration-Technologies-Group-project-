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

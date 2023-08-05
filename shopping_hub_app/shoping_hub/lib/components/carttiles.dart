import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class cartTiles extends StatefulWidget {
  final String image;
  final String title;
  final String price;
  final String total;
  final int count;
  const cartTiles({
    Key? key,
    required this.image,
    required this.title,
    required this.price, required this.count, required this.total,
  }) : super(key: key);
  @override
  _cartTilesState createState() => _cartTilesState();
}
class _cartTilesState extends State<cartTiles> {
  int counter = 0;
  bool isFavorite = false;
  void incrementCounter() {
    setState(() {
      counter++;
    });
  }
  void decrementCounter() {
    setState(() {
      if (counter > 0) {
        counter--;
      }
    });
  }
  void toggleFavorite() {
    setState(() {
      isFavorite = !isFavorite;
    });
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setState(() {
      counter = widget.count;
    });
  }
  @override
  Widget build(BuildContext context) {
    double priceDouble = double.parse(widget.price);
    double priceTotal = double.parse(widget.total);
    return Padding(
      padding: const EdgeInsets.only(top: 30.0),
      child: Stack(
        children: [
          Container(
            width: 300,
            height: 120,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              border: Border.all(
                color: HexColor("#848484"),
                width: 2,
              ),
            ),
            child: Row(
              children: [
                Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 4,right: 8),
                    child: Image.network(
                      widget.image,
                      width: 100.0,
                      height: 99.0,
                    ),
                  ),
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        '${widget.title}',
                        style: TextStyle(
                          fontSize: 16.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 4.0),
                      Text(
                        '\$${priceDouble.toStringAsFixed(2)}per 1 item',
                        style: TextStyle(
                          fontSize: 12.0,
                          color: HexColor("#848484"),
                        ),
                      ),
                      Text(
                        '\$${priceTotal.toStringAsFixed(2)} ',
                        style: TextStyle(
                          fontSize: 14.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(width: 10.0),
                Padding(
                  padding: const EdgeInsets.only(right: 15.0),
                  child: Container(
                    height: 80.0,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20.0),
                      border: Border.all(
                        color: HexColor("#848484"),
                        width: 2,
                      ),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        InkWell(
                          onTap: () {
                            // Add your logic for the plus button here
                          },
                          child: Icon(
                            Icons.add,
                            size: 20.0,
                          ),
                        ),
                        SizedBox(height: 5,),
                        Text(
                          '$counter',
                          style: TextStyle(
                            fontSize: 12.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 5,),
                        InkWell(
                          onTap: () {
                            // Add your logic for the minus button here
                          },
                          child: Icon(
                            Icons.remove,
                            size: 20.0,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            top: 1.0,
            right: 0.75,
            child: IconButton(
              icon: Icon(Icons.close),
              onPressed: () {
                // Add your logic for the close button here
              },
            ),
          ),
        ],
      ),
    );

  }
}


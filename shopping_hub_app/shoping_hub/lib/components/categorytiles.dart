import 'package:shopping_hub/model/item_model.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:provider/provider.dart';

import '../api/api_connection.dart';
import '../model/category_model.dart';
import '../pages/Item_page.dart';


class categoryTiles extends StatefulWidget{
 // final String image;
  final String title;
  final color;
  
  const categoryTiles({
    super.key,
    required this.title,
    required this.color,
    });


  @override
  State<categoryTiles> createState() => _categoryTilesState();
}

class _categoryTilesState extends State<categoryTiles> {
  //ItemModel itemModel = ItemModel();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    //itemModel.setCurrentCategory(widget.title);
    //itemModel.loadItems();
    setState(() {});
  }

  void fetchItems(String category, Function callback) async {
    List<Item> items = await ApiConnection.getItemsByCategory(category);
    callback(items);
  }

  @override
   Widget build(BuildContext context) {

    return GestureDetector(
      onTap: () {
        fetchItems(widget.title, (items) {
          Provider.of<ItemModel>(context, listen: false).setItems(items);
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ItemPage(title: widget.title,),
            ),
          );
        });

      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
        child:Container(
          padding: const EdgeInsets.all(20.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20.0),
            color: widget.color,
            //padding: EdgeInsets.all(12.0)),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              /*Image.asset(
                widget.image,
                width: 250.0,
                height: 104.0,
              ),*/
            Text(capitalize(widget.title),style: TextStyle(fontSize: 18.0,fontWeight: FontWeight.bold,color:HexColor("#15CE1F"))),
          ]),
        ),
      ),
    );
   }

  String capitalize(String s) => s[0].toUpperCase() + s.substring(1);

}
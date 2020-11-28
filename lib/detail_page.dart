import 'package:flutter/material.dart';


class DetailPage extends StatelessWidget {

  final String itemTheme;
  final String itemSub;
  final String itemImage;
  final String qty;

  const DetailPage({Key key, this.itemTheme, this.itemSub, this.itemImage, this.qty})
      : super(key: key);

  goBack(BuildContext context){
    Navigator.pop(context);
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.redAccent,
        title: Text('Detail' + itemTheme,
          style: TextStyle(color: Colors.white,),),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Center(child: Image.asset(itemImage),),
          Text(
            itemTheme,
            style: TextStyle(color: Colors.redAccent,fontSize: 24.0),
          ),
          Text(itemSub),
          Text('Item Left' + qty),
        ],
      ),
    );
  }
}

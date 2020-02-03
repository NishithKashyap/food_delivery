import 'package:flutter/material.dart';

class SearchField extends StatelessWidget{

  @override
  Widget build(BuildContext context){
    return Material(
      elevation: 5.0,
      borderRadius: BorderRadius.all(Radius.circular(6.0)),
      child: TextField(
        style:TextStyle(color: Colors.green, fontSize: 16.0),
        cursorColor: Theme.of(context).primaryColor,
        decoration:InputDecoration(
          contentPadding: EdgeInsets.symmetric(horizontal: 32.0, vertical: 14.0),
          suffixIcon: Material(
              elevation: 2.0,
              child: Icon(
                Icons.search,
                color: Colors.green,
              )
          ),
          hintText: "Search Store",
          hintStyle: TextStyle(color:  Color.fromRGBO(0, 102, 102, 10))
        )
      ),
    );
  }
}
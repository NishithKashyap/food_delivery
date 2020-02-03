import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget{
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage>{

  Icon _searchIcon = new Icon(Icons.search);
  String _searchText = "";

  Widget _buildBar(BuildContext context){
    return new AppBar(
      elevation: 0.1,
      backgroundColor: Colors.blue,
      title: Text('My Profile'),
      actions: <Widget>[
        new IconButton(
        icon: _searchIcon,
        onPressed: _searchPressed,
      )
      ], 
    );
  }

  Widget _buildList(BuildContext context){
    return null;
  }

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: _buildBar(context),
      body: _buildList(context),
    );
  }

  void _searchPressed(){
    setState(() {
      if(this._searchIcon.icon == Icons.search){
        this._searchIcon = new Icon(Icons.close);
      }
      else{
        this._searchIcon = new Icon(Icons.search);
      }
    });
  }

}
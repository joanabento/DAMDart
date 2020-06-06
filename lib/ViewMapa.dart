import 'dart:async';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:my_app/Registo.dart';
import 'dart:convert' show json;
import 'informacao.dart';

class ViewMapa extends StatefulWidget {
  @override
  ViewMapaState createState() => ViewMapaState();
}

class ViewMapaState extends State<ViewMapa> {
  int floor;
  @override
  void initState(){
    super.initState();
    floor = 0;
  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(appBar: AppBar(
        title: Center(child:Text('Mapa do Nosso Shopping')),
        backgroundColor: Colors.black,
      ),
    body: Column(children: <Widget>[
      Image(
          image: AssetImage('assets/Piso'+floor.toString()+'.JPG')
        ),
      IconButton(
        icon: Icon(Icons.add_circle), 
        onPressed: () => setState(() {
          if(floor >= 0 && floor < 2){
            floor ++;
          }
        })
        ),
      Text(floor.toString()), 
      IconButton(
        icon: Icon(Icons.remove_circle),
        onPressed: () => setState(() {
          if(floor > 0 && floor <= 2){
            floor --;
          }
        })
        ),
    ],)
    );
     // child: Image(image: AssetImage('assets/Piso0.JPG'))),); 
}
}
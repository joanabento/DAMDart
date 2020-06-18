import 'dart:async';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' show json;

import 'distrito.dart';



class ListarDist extends StatelessWidget {
 
 List distritos;
ListarDist({Key key, @required this.distritos}): super(key:key);
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(appBar: AppBar(
        title: Center(child:Text('Situaçao atual do Pais')),
        backgroundColor: Colors.green,
      ),
    body:
    createdistrito(distritos, context));
  }
//*
Widget createdistrito(List distritos, context){
  List<TableRow> rows = [];
  for (Distrito d in distritos){
    rows.add(TableRow(children: [
      IconButton(
        icon: Icon(Icons.info),
        onPressed: null,
      ),
      Text(
        d.Country,
        textAlign: TextAlign.center, 
        style: TextStyle(fontSize: 15)
      ),
      Text(
        d.CountryCode,
        textAlign: TextAlign.center, 
        style: TextStyle(fontSize: 15)
      ),
      Text(
        d.Confirmed.toString(),
        textAlign: TextAlign.center, 
        style: TextStyle(fontSize: 15)
      ),
      Text(
        d.Deaths.toString(),
        textAlign: TextAlign.center, 
        style: TextStyle(fontSize: 15)
      ),
      Text(
        d.Recovered.toString(),
        textAlign: TextAlign.center, 
        style: TextStyle(fontSize: 15)
      ),
      Text(
        d.Active.toString(),
        textAlign: TextAlign.center, 
        style: TextStyle(fontSize: 15)
      ),
      
            
      ],
    ));     
  }

  return Table( border: TableBorder(
    horizontalInside: BorderSide(
      color: Colors.blue,
      style: BorderStyle.solid,
      width: 0.5,
    ),
    
  ),
  children: rows);
  
}

}
import 'dart:async';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:my_app/Registo.dart';
import 'dart:convert' show json;

import 'informacao.dart';

class Gereservico extends StatelessWidget {
 
 List informacoes;
Gereservico({Key key, @required this.informacoes}): super(key:key);
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(appBar: AppBar(
        title: Center(child:Text('Gerir Serviços')),
        backgroundColor: Colors.black,
      ),

    body:
    createservice(informacoes));
  }
//*
Widget createservice(List informacoes){
  List<TableRow> rows = [];
  for (Informacao i in informacoes){
    rows.add(TableRow(children: [
      Text(i.nome),
      new SizedBox(
        width: 30.0,
        height: 25, 
        child: RaisedButton(color: Colors.black,
        child: Row(children: [
          Text("Eliminar", style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black, fontSize: 15)),
        
        ],),onPressed: (){},)
      )
    ]));
  }

  return Table( border: TableBorder(
    horizontalInside: BorderSide(
      color: Colors.black,
      style: BorderStyle.solid,
      width: 0.5,
    ),
    
  ),
  children: rows);
  
}

}
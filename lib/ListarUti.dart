import 'dart:async';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:my_app/Registo.dart';
import 'dart:convert' show json;

import 'utilizador.dart';

class ListarUti extends StatelessWidget {
 
 List utilizadores;
ListarUti({Key key, @required this.utilizadores}): super(key:key);
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(appBar: AppBar(
        title: Center(child:Text('Gerir Utilizadores')),
        backgroundColor: Colors.black,
      ),

    body:
    createlista(utilizadores));
  }
//*
Widget createlista(List utilizadores){
  List<TableRow> rows = [];
  for (Utilizador u in utilizadores){
    rows.add(TableRow(children: [
      Text(u.nome, style: TextStyle(fontWeight: FontWeight.bold)),
    
      //Text(u.email),

      new SizedBox(
        width: 20.0,
        height: 15, 
        child: RaisedButton(color: Colors.white,
        child: Row(children: [
          Text("Eliminar", style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black, fontSize: 15)),
        
        ],),onPressed: (){},)
      )
    ]));
  }

  return Table( border: TableBorder(
    horizontalInside: BorderSide(
      color: Colors.white,
      style: BorderStyle.solid,
      width: 2,
    ),
    
  ),
  children: rows);
  
}

}

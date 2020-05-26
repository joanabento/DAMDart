import 'dart:async';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:my_app/Registo.dart';
import 'dart:convert' show json;

import 'produto.dart';

class ListarProd extends StatelessWidget {
 
 List produtos;
ListarProd({Key key, @required this.produtos}): super(key:key);
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(appBar: AppBar(
        title: Center(child:Text('Gerir Produtos')),
        backgroundColor: Colors.black,
      ),

    body:
    createlista(produtos));
  }
//*
Widget createlista(List produtos){
  List<TableRow> rows = [];
  for (Produto p in produtos){
    rows.add(TableRow(children: [
      Text(p.nome, style: TextStyle(fontWeight: FontWeight.bold)),
      Text(p.referencia, style: TextStyle(fontWeight: FontWeight.bold)),
    
      //Text(u.email),

      new SizedBox(
        width: 20.0,
        height: 15, 
        child: RaisedButton(color: Colors.white,
        child: Row(children: [
          Text("Eliminar", style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black, fontSize: 15)),
          Text("Editar", style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black, fontSize: 15)),
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

import 'dart:async';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:my_app/Registo.dart';
import 'dart:convert' show json;

import 'informacao.dart';

class Gerecontact extends StatelessWidget {
 
List informacoes;
Gerecontact({Key key, @required this.informacoes}): super(key:key);
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(appBar: AppBar(
        title: Center(child:Text('Gerir Contactos')),
        backgroundColor: Colors.black,
      ),

    body:
    createcontacts(informacoes));
  }
//*
Widget createcontacts(List informacoes){
  List<TableRow> rows = [];
  for (Informacao i in informacoes){
    rows.add(TableRow(children: [
      Text(i.contacto.toString()),
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
      color: Colors.black,
      style: BorderStyle.solid,
      width: 2,
    ),
    
  ),
  children: rows);
  
}

}

import 'dart:async';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:my_app/Registo.dart';
import 'dart:convert' show json;

import 'informacao.dart';

class ViewContactos extends StatelessWidget {
 
List informacoes;
ViewContactos({Key key, @required this.informacoes}): super(key:key);
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(appBar: AppBar(
        title: Center(child:Text('Contactos')),
        backgroundColor: Colors.black,
      ),

    body:
    createcontacts(informacoes));
  }
//*
Widget createcontacts(List informacoes){
  List<TableRow> rows = [];
  
  for (Informacao i in informacoes){
    SizedBox(height: 10, width: 10);
    rows.add(TableRow(children: [
      IconButton(
        icon: const Icon(Icons.phone),
        onPressed: () {} 
      ),
      Text(i.nome,
      textAlign: TextAlign.center, 
      style: TextStyle(color: Colors.blueGrey, fontWeight: FontWeight.bold, fontSize: 20)
      ),
      Text(i.contacto.toString(),
      textAlign: TextAlign.center,
      style: TextStyle(fontSize: 20),
      ),

    ]));
  }

  return Table( border: TableBorder(
    horizontalInside: BorderSide(
      color: Colors.white,
      style: BorderStyle.solid,
      width: 5.0,
    ),
  ),
  children: rows);
  
}

}

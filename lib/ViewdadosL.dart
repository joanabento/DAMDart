import 'dart:async';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:my_app/Registo.dart';
import 'package:my_app/utilizador.dart';
import 'dart:convert' show json;

import 'informacao.dart';

class ViewdadosL extends StatelessWidget {
Utilizador uti;

ViewdadosL({Key key, @required this.uti}): super(key:key);
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(appBar: AppBar(
        title: Center(child:Text('Dados Pessoais')),
        backgroundColor: Colors.black,
      ),

    body:
    createcontacts(uti));
  }
//*
Widget createcontacts(Utilizador uti){
  List<TableRow> rows = [];
  
 
    SizedBox(height: 10, width: 10);
    rows.add(TableRow(children: [
      IconButton(
        icon: const Icon(Icons.person),
        onPressed: () {} 
      ),
      Text(uti.nome,
      textAlign: TextAlign.center, 
      style: TextStyle(color: Colors.blueGrey, fontWeight: FontWeight.bold, fontSize: 20)
      ),
      Text(uti.pass,
      textAlign: TextAlign.center,
      style: TextStyle(fontSize: 20),
      ),
      Text(uti.tipo,
      textAlign: TextAlign.center,
      style: TextStyle(fontSize: 20),
      ),

    ]));
  

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

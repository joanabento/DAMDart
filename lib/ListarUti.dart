import 'dart:async';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:my_app/Registo.dart';
import 'dart:convert' show json;

import 'utilizador.dart';

class ListarUti extends StatelessWidget {
 
 List utilizadores;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return null;
  }

Widget createlista(List utilizadores){
  List<TableRow> rows = [];
  for (Utilizador u in utilizadores){
    rows.add(TableRow(children: [
      Text(u.nome),
      new SizedBox(
        width: 30.0,
        height: 25, 
        child: RaisedButton(color: Colors.black,
        child: Row(children: [
          Text("Eliminar", style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black, fontSize: 15)),
        
        ],))
      )
    ]));
  }
}

}
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
      Text(u.nome,
      textAlign: TextAlign.center, 
      style: TextStyle(fontSize: 20)
      ),
      //erro quando tentamos mostrar o email na lista
      Text("TIPO", 
      textAlign: TextAlign.center,
      style: TextStyle(fontSize: 20)
      ),
      ButtonBar(            
            mainAxisSize: MainAxisSize.min,
            alignment: MainAxisAlignment.center,
            children: <Widget>[
            RaisedButton(
            child: Text('Eliminar'),
            color: Colors.black,
            onPressed: () {                                
                }                
            ),  
          ],
        ),
    ]));
  }

  return Table( border: TableBorder(
    horizontalInside: BorderSide(
      color: Colors.black,
      style: BorderStyle.solid,
      width: 1.0,
    ),
    
  ),
  children: rows);
  
}

}

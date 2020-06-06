import 'dart:async';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:my_app/Registo.dart';
import 'package:my_app/evento.dart';
import 'package:my_app/produto.dart';
import 'dart:convert' show json;

import 'informacao.dart';

class GerirEvento extends StatelessWidget {
 
List eventos;
GerirEvento({Key key, @required this.eventos}): super(key:key);
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(appBar: AppBar(
        title: Center(child:Text('Gerir Eventos')),
        backgroundColor: Colors.black,
      ),
    body:
    createevents(eventos));
  }
//*
Widget createevents(List products){
  List<TableRow> rows = [];
  for (Evento e in eventos){
    rows.add(TableRow(children: [
      Text(e.nome,
      textAlign: TextAlign.center, 
      style: TextStyle(fontSize: 15)
      ),
      Image.network(e.fotografia),
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

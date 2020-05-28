import 'dart:async';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:my_app/Registo.dart';
import 'package:my_app/noticia.dart';
import 'dart:convert' show json;

import 'informacao.dart';

class Gerenotice extends StatelessWidget {
 
 List noticias;
Gerenotice({Key key, @required this.noticias}): super(key:key);
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(appBar: AppBar(
        title: Center(child:Text('Gerir Noticias')),
        backgroundColor: Colors.black,
      ),

    body:
    createnotices(noticias));
  }
//*
Widget createnotices(List noticias){
  List<TableRow> rows = [];
  for (Noticia n in noticias){
    rows.add(TableRow(children: [
      Text(n.nome,
      textAlign: TextAlign.center, 
      style: TextStyle(fontSize: 20)
      ),
      Text(n.conteudo,
      textAlign: TextAlign.center,
      style: TextStyle(fontSize: 15),
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

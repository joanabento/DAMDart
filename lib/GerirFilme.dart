import 'dart:async';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:my_app/PerfilL.dart';
import 'package:my_app/Registo.dart';
import 'package:my_app/filme.dart';
import 'package:my_app/produto.dart';
import 'dart:convert' show json;

import 'informacao.dart';

class GerirFilme extends StatelessWidget {
 
List filmes;
GerirFilme({Key key, @required this.filmes}): super(key:key);
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(appBar: AppBar(
        title: Center(child:Text('Gerir Filmes')),
        backgroundColor: Colors.black,
      ),

    body:
    createfilmes(filmes, context));
  }
//*
Widget createfilmes(List films, context){
  List<TableRow> rows = [];
  for (Filme f in films){
    rows.add(TableRow(children: [
      Text(f.titulo,
      textAlign: TextAlign.center, 
      style: TextStyle(fontSize: 20)
      ),
      Text(f.duracao,
      textAlign: TextAlign.center,
      style: TextStyle(fontSize: 20),
      ),
      Image.memory(f.fotografia, width: 200, height: 100),
      ButtonBar(            
            mainAxisSize: MainAxisSize.min,
            alignment: MainAxisAlignment.center,
            children: <Widget>[
            RaisedButton(
            child: Text('Eliminar'),
            color: Colors.black,
            onPressed: () { 
              Filme filme = new Filme();
              filme.idF = f.idF;
              Future <int> eliminar = filme.eliminarFilme(filme.idF).then((int onValue){
                if(onValue == 200){
                    Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => PerfilL()),
                              );
                }
              }
              );                               
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

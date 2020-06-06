import 'dart:async';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:my_app/Registo.dart';
import 'dart:convert' show json;

import 'filme.dart';
import 'informacao.dart';

class ViewFilme extends StatelessWidget {
 
 List filmes;
ViewFilme({Key key, @required this.filmes}): super(key:key);
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(appBar: AppBar(
        title: Center(child:Text('Cinemas NOS')),
        backgroundColor: Colors.black,
      ),

    body:
    createfilme(filmes));
  }
//*
Widget createfilme(List filmes){
  List<TableRow> rows = [];
  for (Filme f in filmes){
    rows.add(TableRow(children: [
      IconButton(
        icon: const Icon(Icons.movie),
        onPressed: () {} 
      ),
      Image.memory(f.fotografia, width: 200, height: 100),
      Text(f.titulo,
      textAlign: TextAlign.center, 
      style: TextStyle(color: Colors.blueGrey, fontWeight: FontWeight.bold, fontSize: 15)
      ),
      Text(f.idade.toString(),
      textAlign: TextAlign.center,
      style: TextStyle(fontSize: 15),
      ),
      Text(f.genero,
      textAlign: TextAlign.center,
      style: TextStyle(fontSize: 15),
      ),
      Text(f.dataEstreia,
      textAlign: TextAlign.center,
      style: TextStyle(fontSize: 15),
      ),
      Text(f.realizador,
      textAlign: TextAlign.center,
      style: TextStyle(fontSize: 15),
      ),
      Text(f.duracao,
      textAlign: TextAlign.center,
      style: TextStyle(fontSize: 15),
      ),
      Text(f.versao,
      textAlign: TextAlign.center,
      style: TextStyle(fontSize: 15),
      ),
      
      SizedBox(width: 10,height: 10,)
    ],
    ));   
    
  }

  return Table( border: TableBorder(
    horizontalInside: BorderSide(
      color: Colors.white,
      style: BorderStyle.solid,
      width: 0.5,
    ),
    
  ),
  children: rows);
  
}

}

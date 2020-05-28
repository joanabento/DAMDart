import 'dart:async';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:my_app/Registo.dart';
import 'dart:convert' show json;

import 'informacao.dart';

class ViewServicos extends StatelessWidget {
 
 List informacoes;
ViewServicos({Key key, @required this.informacoes}): super(key:key);
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(appBar: AppBar(
        title: Center(child:Text('Serviços')),
        backgroundColor: Colors.black,
      ),

    body:
    createservice(informacoes));
  }
//*
Widget createservice(List informacoes){
  List<TableRow> rows = [];
  for (Informacao i in informacoes){
    rows.add(TableRow(children: [
      IconButton(
        icon: const Icon(Icons.info_outline),
        onPressed: () {} 
      ),
      Text(i.nome,
      textAlign: TextAlign.center, 
      style: TextStyle(color: Colors.blueGrey, fontWeight: FontWeight.bold ,fontSize: 20)
      ),
      Text(i.descricao,
      textAlign: TextAlign.center,
      style: TextStyle(fontSize: 15),
      ),
    ],
    ));   
    
  }

  return Table( border: TableBorder(
    horizontalInside: BorderSide(
      color: Colors.white,
      style: BorderStyle.solid,
      width: 1.0,
    ),
    
  ),
  children: rows);
  
}

}

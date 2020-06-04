import 'dart:async';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:my_app/Registo.dart';
import 'dart:convert' show json;
import 'informacao.dart';

class ViewInformacoes extends StatelessWidget {
 
List informacoes;
ViewInformacoes({Key key, @required this.informacoes}): super(key:key);
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(appBar: AppBar(
        title: Center(child:Text('Informações Gerais')),
        backgroundColor: Colors.black,
      ),
    body:
    createhorario(informacoes));
}

Widget createhorario(List informacoes){
  List<TableRow> rows = [];
  List<TableCell> cells = [];
  for (Informacao i in informacoes){
    rows.add(TableRow(children: [
      IconButton(
        icon: const Icon(Icons.info),
        onPressed: () {} 
      ),
      Text(i.nome,
      textAlign: TextAlign.center, 
      style: TextStyle(color: Colors.blueGrey, fontWeight: FontWeight.bold, fontSize: 15)
      ),
      Text(i.horario,
      textAlign: TextAlign.center,
      style: TextStyle(fontSize: 15),
      ),
      Text(i.contacto.toString(),
      textAlign: TextAlign.center,
      style: TextStyle(fontSize: 15),
      ),
      Text(i.descricao,
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

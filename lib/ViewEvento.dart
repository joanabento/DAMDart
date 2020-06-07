import 'dart:async';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:my_app/Registo.dart';
import 'dart:convert' show json;

import 'evento.dart';
import 'filme.dart';
import 'informacao.dart';

class ViewEvento extends StatelessWidget {
 
 List eventos;
ViewEvento({Key key, @required this.eventos}): super(key:key);
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(appBar: AppBar(
        title: Center(child:Text('Teatro')),
        backgroundColor: Colors.black,
      ),

    body:
    createevento(eventos));
  }
//*
Widget createevento(List eventos){
  final children = <Widget>[];
  for (Evento e in eventos){
    children.add(Icon(Icons.theaters));
    children.add(Image.memory(e.fotografia, width: 400, height: 100));
    children.add(Text(e.nome, textAlign: TextAlign.center, style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)));
    children.add(Text("Data de Estreia: " + e.dataE, textAlign: TextAlign.center, style: TextStyle(fontSize: 12)));
    children.add(Text("Local: " + e.localE, textAlign: TextAlign.center, style: TextStyle(fontSize: 12)));
    children.add(Text("Preço: " + e.preco +'€', textAlign: TextAlign.center, style: TextStyle(fontSize: 12)));
    
  }
return new ListView(
  children:children,
);

  
}

}

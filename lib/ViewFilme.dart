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
  final children = <Widget>[];
  for (Filme f in filmes){
    children.add(Icon(Icons.movie));
    children.add(Image.memory(f.fotografia, width: 400, height: 100));
    children.add(Text(f.titulo, textAlign: TextAlign.center, style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)));
    children.add(Text("M: +" + f.idade.toString(), textAlign: TextAlign.center, style: TextStyle(fontSize: 12)));
    children.add(Text("Género: " + f.genero, textAlign: TextAlign.center, style: TextStyle(fontSize: 12)));
    children.add(Text("Data de Estreia: " + f.dataEstreia, textAlign: TextAlign.center, style: TextStyle(fontSize: 12)));
    children.add(Text("Realizador: " + f.realizador, textAlign: TextAlign.center, style: TextStyle(fontSize: 12)));
    children.add(Text("Duração: " + f.duracao, textAlign: TextAlign.center, style: TextStyle(fontSize: 12)));
    //children.add(Text("Versão: " + f.versao, textAlign: TextAlign.center, style: TextStyle(fontSize: 12)));
    
  }
return new ListView(
  children:children,
);

  
}

}

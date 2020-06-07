import 'dart:async';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:my_app/Registo.dart';
import 'dart:convert' show json;

import 'filme.dart';
import 'informacao.dart';
import 'noticia.dart';

class ViewNoticia extends StatelessWidget {
 
 List noticias;
ViewNoticia({Key key, @required this.noticias}): super(key:key);
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(appBar: AppBar(
        title: Center(child:Text('Nosso Shopping - Noticias')),
        backgroundColor: Colors.black,
      ),

    body:
    
    createnoticia(noticias));
      
    
    }
//*
Widget createnoticia(List noticias){
  final children = <Widget>[];
  for (Noticia n in noticias){
    //children.add(Icon(Icons.movie));
    children.add(Image.memory(n.fotografia, width: 400, height: 100));
    children.add(Text(n.nome, textAlign: TextAlign.center, style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)));
    children.add(Text(n.conteudo, textAlign: TextAlign.center, style: TextStyle(fontSize: 12)));
    
  }
return new ListView(
  children:children,
);

  
}

}

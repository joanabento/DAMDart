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
final children = <Widget>[];
for (Informacao i in informacoes) {
  children.add(Icon(Icons.info));
  children.add(Text(i.nome,textAlign: TextAlign.center, style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)));
  children.add(Text("Contacto: " + i.contacto.toString(), textAlign: TextAlign.center, style: TextStyle(fontSize: 15)));
  children.add(Text("Horário: " + i.horario, textAlign: TextAlign.center, style: TextStyle(fontSize: 15)));
  //children.add(Text("Descriçao: " + i.descricao, textAlign: TextAlign.center, style: TextStyle(fontSize: 15)));
}
return new ListView(
  children: children,
);
}

}
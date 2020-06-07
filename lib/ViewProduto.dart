import 'dart:async';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:my_app/Registo.dart';
import 'package:my_app/produto.dart';
import 'dart:convert' show json;

import 'filme.dart';
import 'informacao.dart';

class ViewProduto extends StatelessWidget {
 
 List produtos;
ViewProduto({Key key, @required this.produtos}): super(key:key);
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(appBar: AppBar(
        title: Center(child:Text('Promoções')),
        backgroundColor: Colors.black,
      ),

    body:
    createprom(produtos));
  }
//*
Widget createprom(List fprodutos){
  final children = <Widget>[];
  for (Produto p in produtos){
    children.add(Icon(Icons.store));
    children.add(Image.memory(p.fotografia, width: 400, height: 100));
    children.add(Text(p.nome, textAlign: TextAlign.center, style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)));
    children.add(Text("Loja: " + p.loja, textAlign: TextAlign.center, style: TextStyle(fontSize: 12)));
    //children.add(Text("Preço:" + p.preco.toString(), textAlign: TextAlign.center, style: TextStyle(fontSize: 12)));
    //children.add(Text("Referência:" + p.referencia, textAlign: TextAlign.center, style: TextStyle(fontSize: 12)));
    
    
  }
return new ListView(
  children:children,
);

  
}

}

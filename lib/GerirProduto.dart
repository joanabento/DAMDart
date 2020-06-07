import 'dart:async';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:my_app/PerfilA.dart';
import 'package:my_app/PerfilL.dart';
import 'package:my_app/Registo.dart';
import 'package:my_app/produto.dart';
import 'dart:convert' show json;

import 'informacao.dart';

class GerirProduto extends StatelessWidget {
 
List produtos;
GerirProduto({Key key, @required this.produtos}): super(key:key);
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(appBar: AppBar(
        title: Center(child:Text('Gerir Produtos')),
        backgroundColor: Colors.black,
      ),

    body:
    createproducts(produtos, context));
  }
//*
Widget createproducts(List products, context){
  List<TableRow> rows = [];
  for (Produto p in products){
    rows.add(TableRow(children: [
      Text(p.nome,
      textAlign: TextAlign.center, 
      style: TextStyle(fontSize: 15)
      ),
      Text(p.preco.toString(),
      textAlign: TextAlign.center,
      style: TextStyle(fontSize: 15),
      ),
      Image.memory(p.fotografia, width: 200, height: 100),

      /*ButtonBar(            
            mainAxisSize: MainAxisSize.min,
            alignment: MainAxisAlignment.center,
            children: <Widget>[
            RaisedButton(
            child: Text('Editar'),
            color: Colors.black,
            onPressed: () {                                
                }                
            ),  
          ],
        ),*/
      ButtonBar(            
            mainAxisSize: MainAxisSize.min,
            alignment: MainAxisAlignment.center,
            children: <Widget>[
            RaisedButton(
            child: Text('Eliminar'),
            color: Colors.black,
            onPressed: () {     
              Produto po = new Produto();
              po.idProduto = p.idProduto;
              Future <int> eliminar = po.eliminarProduto(po.idProduto).then((int onValue){
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

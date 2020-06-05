import 'dart:async';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:my_app/PerfilA.dart';
import 'package:my_app/Registo.dart';
import 'dart:convert' show json;

import 'informacao.dart';

class Gereservico extends StatelessWidget {
 
 List informacoes;
Gereservico({Key key, @required this.informacoes}): super(key:key);
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(appBar: AppBar(
        title: Center(child:Text('Gerir Serviços')),
        backgroundColor: Colors.black,
      ),

    body:
    createservice(informacoes, context));
  }
//*
Widget createservice(List informacoes, context){
  List<TableRow> rows = [];
  for (Informacao i in informacoes){
    rows.add(TableRow(children: [
      Text(i.nome,
      textAlign: TextAlign.center, 
      style: TextStyle(fontSize: 20)
      ),
      Text(i.descricao,
      textAlign: TextAlign.center,
      style: TextStyle(fontSize: 20),
      ),
      ButtonBar(            
            mainAxisSize: MainAxisSize.min,
            alignment: MainAxisAlignment.center,
            children: <Widget>[
            RaisedButton(
            child: Text('Eliminar'),
            color: Colors.black,
            onPressed: () {  
              Informacao servico = new Informacao();
              servico.idInfo = i.idInfo;
              Future <int> eliminar = servico.eliminarInfo(servico.idInfo).then((int onValue){
                if(onValue == 200){
                    Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => PerfilA()),
                              );

                }
              });                              
                }                
            ),  
          ],
        ),
    ],
    ));   
    
  }

  return Table( border: TableBorder(
    horizontalInside: BorderSide(
      color: Colors.black,
      style: BorderStyle.solid,
      width: 0.5,
    ),
    
  ),
  children: rows);
  
}

}

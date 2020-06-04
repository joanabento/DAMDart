import 'dart:async';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:my_app/PerfilA.dart';
import 'package:my_app/Registo.dart';
import 'dart:convert' show json;

import 'informacao.dart';

class Gerecontact extends StatelessWidget {
 
List informacoes;
Gerecontact({Key key, @required this.informacoes}): super(key:key);
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(appBar: AppBar(
        title: Center(child:Text('Gerir Contactos')),
        backgroundColor: Colors.black,
      ),

    body:
    createcontacts(informacoes, context));
  }
//*
Widget createcontacts(List informacoes, context){
  List<TableRow> rows = [];
  for (Informacao i in informacoes){
    rows.add(TableRow(children: [
      Text(i.nome,
      textAlign: TextAlign.center, 
      style: TextStyle(fontSize: 20)
      ),
      Text(i.contacto.toString(),
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
              Informacao contacto = new Informacao();
              contacto.idInfo = i.idInfo;
              Future <int> eliminar = contacto.eliminarInfo(contacto.idInfo).then((int onValue){
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

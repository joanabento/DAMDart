import 'dart:async';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:my_app/PerfilA.dart';
import 'package:my_app/Registo.dart';
import 'package:my_app/noticia.dart';
import 'dart:convert' show json;

import 'informacao.dart';

class Gerenotice extends StatelessWidget {
 
 List noticias;
Gerenotice({Key key, @required this.noticias}): super(key:key);
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(appBar: AppBar(
        title: Center(child:Text('Gerir Noticias')),
        backgroundColor: Colors.black,
      ),

    body:
    createnotices(noticias, context));
  }
//*
Widget createnotices(List noticias, context){
  List<TableRow> rows = [];
  for (Noticia n in noticias){
    rows.add(TableRow(children: [
      Text(n.nome,
      textAlign: TextAlign.center, 
      style: TextStyle(fontSize: 20)
      ),
      Text(n.conteudo,
      textAlign: TextAlign.center, 
      style: TextStyle(fontSize: 20)
      ),
      Image.memory(n.fotografia, width: 200, height: 100),      
      ButtonBar(            
            mainAxisSize: MainAxisSize.min,
            alignment: MainAxisAlignment.center,
            children: <Widget>[
            RaisedButton(
            child: Text('Eliminar'),
            color: Colors.black,
            onPressed: () {  
              Noticia noti = new Noticia();
              noti.idN = n.idN;
              Future <int> eliminar = noti.eliminarN(noti.idN).then((int onValue){
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

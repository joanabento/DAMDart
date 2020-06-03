import 'dart:async';
import 'dart:io';
//import 'dart:js';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:my_app/Registo.dart';
import 'dart:convert' show json;

import 'PerfilA.dart';
import 'informacao.dart';

class GereHorario extends StatelessWidget {
 
 List informacoes;
GereHorario({Key key, @required this.informacoes}): super(key:key);
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(appBar: AppBar(
        title: Center(child:Text('Gerir Horários')),
        backgroundColor: Colors.black,
      ),

    body:
    createhorario(informacoes));
  }
//*
Widget createhorario(List informacoes){
  List<TableRow> rows = [];
  for (Informacao i in informacoes){
    rows.add(TableRow(children: [
      Text(i.nome,
      textAlign: TextAlign.center, 
      style: TextStyle(fontSize: 20)
      ),
      Text(i.horario,
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
              Informacao horario = new Informacao();
              Future <int> eliminar = horario.EliminarInfo(horario.idInfo).then((int onValue){
                if(onValue == 200){
                  /*  Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => PerfilA()),
                              );*/

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

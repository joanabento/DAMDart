import 'dart:async';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' show json;

import 'package:my_app/formulario.dart';

import 'PerfilA.dart';





class ListarForm extends StatelessWidget {
 
 List formularios;
ListarForm({Key key, @required this.formularios}): super(key:key);
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(appBar: AppBar(
        title: Center(child:Text('Gerir Formulários')),
        backgroundColor: Colors.green,
      ),
    body:
    createform(formularios, context));
  }
//*
Widget createform(List formularios, context){
  List<TableRow> rows = [];
  for (Formulario f in formularios){
    rows.add(TableRow(children: [
      IconButton(
        icon: Icon(Icons.info),
        onPressed: null,
      ),
      Text(
        f.nome,
        textAlign: TextAlign.center, 
        style: TextStyle(fontSize: 20)
      ),
      
      ButtonBar(            
            mainAxisSize: MainAxisSize.min,
            alignment: MainAxisAlignment.center,
            children: <Widget>[
            RaisedButton(
            child: Text('Eliminar'),
            color: Colors.green,
            onPressed: () {  
              Formulario form = new Formulario();
              form.id = f.id;
              Future <int> eliminar = form.eliminarForm(form.id).then((int onValue){
                if(onValue == 200){
                    Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => PerfilA()),
                              );
                }
              }
              );                              
            }                
            ),  
          ],
        ),
      ],
    ));     
  }

  return Table( border: TableBorder(
    horizontalInside: BorderSide(
      color: Colors.blue,
      style: BorderStyle.solid,
      width: 0.5,
    ),
    
  ),
  children: rows);
  
}

}
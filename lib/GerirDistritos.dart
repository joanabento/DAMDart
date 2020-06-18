import 'dart:async';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' show json;

import 'PerfilA.dart';
import 'distrito.dart';



class GerirDistrito extends StatelessWidget {
 
 List distritos;
GerirDistrito({Key key, @required this.distritos}): super(key:key);
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(appBar: AppBar(
        title: Center(child:Text('Gerir Informações de Portugal')),
        backgroundColor: Colors.green,
      ),
    body:
    createdistrito(distritos, context));
  }
//*
Widget createdistrito(List distritos, context){
  List<TableRow> rows = [];
  for (Distrito d in distritos){
    rows.add(TableRow(children: [
      IconButton(
        icon: Icon(Icons.info),
        onPressed: null,
      ),
      Text(
        d.Confirmed.toString(),
        textAlign: TextAlign.center, 
        style: TextStyle(fontSize: 20)
      ),
      Text(
        d.Deaths.toString(),
        textAlign: TextAlign.center, 
        style: TextStyle(fontSize: 20)
      ),
      Text(
        d.Recovered.toString(),
        textAlign: TextAlign.center, 
        style: TextStyle(fontSize: 20)
      ),
      Text(
        d.Active.toString(),
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
              Distrito distrito = new Distrito();
              distrito.id = d.id;
              Future <int> eliminar = distrito.eliminarDist(distrito.id).then((int onValue){
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
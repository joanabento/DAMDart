import 'dart:async';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:my_app/Inseririnfo.dart';
import 'package:my_app/ListarUti.dart';
import 'package:my_app/Login.dart';
import 'dart:convert' show json;

import 'utilizador.dart';



class Perfil extends StatefulWidget {

  Perfil();
  
  @override
  _Perfil createState() => _Perfil();
}


  

class _Perfil extends State<Perfil> {

final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
final SnackBar snackBar = const SnackBar(content: Text('Showing Snackbar'));


bool state = false;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
     return Scaffold(
        appBar: AppBar(
          title: const Text('O Meu Perfil'),
          backgroundColor: Colors.black,
        ),        
        body: Center(child:            
            Column (children: [
            SizedBox(height: 30),
          Text(
                'Gerir Utilizadores',  
                textAlign: TextAlign.center,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(fontSize: 20),
              ),
          ButtonBar(            
            mainAxisSize: MainAxisSize.max,
            alignment: MainAxisAlignment.center,
            children: <Widget>[
            FlatButton(
            child: Text('Lista de Utilizadores'),
            color: Colors.black,
            onPressed: () {               
                  /*Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => ListarUti()),
                              );*/

                }                
            ),
            
            
          ],
        ),
          Text(
                'Gerir informações',  
                textAlign: TextAlign.center,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(fontSize: 20),
              ),           
          ButtonBar(            
            mainAxisSize: MainAxisSize.max,
            alignment: MainAxisAlignment.center,
            children: <Widget>[
            RaisedButton(
            child: Text('Inserir Informação'),
            color: Colors.black,
            onPressed: () {               
                  Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => Inseririnfo()),
                              );

                }                
            ),
            RaisedButton(
            child: Text('Lista das Informações'),
            color: Colors.black,
            onPressed: () {
              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => Login()),
                              );
            },
            ),
            
          ],
        ),
        Text(
                'Gerir Noticias',  
                textAlign: TextAlign.center,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(fontSize: 20),
              ),
        ButtonBar(            
            mainAxisSize: MainAxisSize.max,
            alignment: MainAxisAlignment.center,
            children: <Widget>[
            FlatButton(
            child: Text('Inserir Noticia'),
            color: Colors.black,
            onPressed: () {               
                  Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => Login()),
                              );

                }                
            ),
            FlatButton(
            child: Text('Lista de Noticias'),
            color: Colors.black,
            onPressed: () {
              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => Login()),
                              );
            },
            ),
            
          ],
        ), 
        ]        
      ),     
      ),
      );
  }

  typeButton(){
     setState(() {
    state = !state;

    });
  }

    
}

  



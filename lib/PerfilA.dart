import 'dart:async';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'package:my_app/Login.dart';
import 'package:my_app/administrador.dart';
import 'package:my_app/formulario.dart';

import 'package:my_app/main.dart';

import 'dart:convert' show json;

import 'ListarForm.dart';
import 'GerirDistritos.dart';
import 'distrito.dart';

class PerfilA extends StatefulWidget {

  PerfilA();
  @override
  _PerfilA createState() => _PerfilA();
}

class _PerfilA extends State<PerfilA> {

final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
final SnackBar snackBar = const SnackBar(content: Text('Showing Snackbar'));

bool state = false;
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
     return Scaffold(
        appBar: AppBar(
          title: const Text('O Meu Perfil'),
          backgroundColor: Colors.green,
        ),        
        body: Center(child:            
            Column (children: [
            SizedBox(height: 30),
          Text(
                'Dados do Perfil',  
                textAlign: TextAlign.right,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
          ButtonBar(            
            mainAxisSize: MainAxisSize.max,
            alignment: MainAxisAlignment.center,
            children: <Widget>[
            FlatButton(
              child: Text('Gerir Informações'),
              color: Colors.green,
              onPressed: () {               
              Distrito distrito = new Distrito();
               Future<List<Distrito>> listard = distrito.getDistritos().then((List<Distrito> dists){
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => GerirDistrito(distritos:dists)),
              );
            }               
            );
              },
            ),
            FlatButton(
              child: Text("Gerir formularios"),
              color: Colors.green,
              onPressed: (){
                Formulario form = new Formulario();
                Future<List<Formulario>> listarf = form.getFormularios().then((List<Formulario> forms){
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ListarForm(formularios:forms)),
                    );
                });
              },
            )
          ],
        ),
          
      
           
        ButtonBar(            
            mainAxisSize: MainAxisSize.max,
            alignment: MainAxisAlignment.center,
            children: <Widget>[
            Text("Terminar Sessão", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            RaisedButton(
              child: Text('LogOut'),
              color: Colors.green,
              onPressed: () {  
                Administrador.logout();
                Navigator.popUntil(context, 
                    ModalRoute.withName('/'));
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

  



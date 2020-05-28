import 'dart:async';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:my_app/GereHorario.dart';
import 'package:my_app/Gerecontact.dart';
import 'package:my_app/Gerenotice.dart';
import 'package:my_app/Gereservico.dart';
import 'package:my_app/Inseririnfo.dart';
import 'package:my_app/Inserirnoti.dart';
import 'package:my_app/ListarUti.dart';
import 'package:my_app/Login.dart';
import 'package:my_app/informacao.dart';
import 'package:my_app/noticia.dart';
import 'dart:convert' show json;

import 'utilizador.dart';



class PerfilA extends StatefulWidget {

  PerfilA();
  
  @override
  _Perfil createState() => _Perfil();
}


  

class _Perfil extends State<PerfilA> {

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
                textAlign: TextAlign.right,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
          ButtonBar(            
            mainAxisSize: MainAxisSize.max,
            alignment: MainAxisAlignment.center,
            children: <Widget>[
            FlatButton(
            child: Text('Lista de Utilizadores'),
            color: Colors.black,
            onPressed: () {               
              Utilizador user = new Utilizador();
              Future <List<Utilizador>> listar = user.getUtilizadores().then((List<Utilizador> users){
                Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => ListarUti(utilizadores:users)),
                              );
              }
              );
            },               
            ),
          ],
        ),
          Text(
                'Gerir informações',  
                textAlign: TextAlign.right,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
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
          ],
        ),
        ButtonBar(            
            mainAxisSize: MainAxisSize.max,
            alignment: MainAxisAlignment.center,
            children: <Widget>[
            RaisedButton(
            child: Text('Gerir Horários'),
            color: Colors.black,
            onPressed: () {  
              Informacao horarios = new Informacao();            
                Future <List<Informacao>> listas = horarios.getInformacao().then((List<Informacao> horario){
                  Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => GereHorario(informacoes: horario)),
                              );           
                }
                );                                
                }                
            ),     
          ],
        ),
        ButtonBar(            
            mainAxisSize: MainAxisSize.max,
            alignment: MainAxisAlignment.center,
            children: <Widget>[
            RaisedButton(
            child: Text('Gerir Contactos'),
            color: Colors.black,
            onPressed: () { 
                Informacao contactos = new Informacao();            
                Future <List<Informacao>> listac = contactos.getInformacao().then((List<Informacao> contacts){
                  Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => Gerecontact(informacoes: contacts)),
                              );           
                }
                );
            }                
            ), 
          ],
        ),
        ButtonBar(            
            mainAxisSize: MainAxisSize.max,
            alignment: MainAxisAlignment.center,
            children: <Widget>[
            RaisedButton(
            child: Text('Gerir Serviços'),
            color: Colors.black,
            onPressed: () {  
              Informacao servicos = new Informacao();            
                Future <List<Informacao>> listas = servicos.getInformacao().then((List<Informacao> services){
                  Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => Gereservico(informacoes: services)),
                              );           
                }
                );                              
                }                
            ),  
          ],
        ),
        Text(
            'Gerir Noticias',  
            textAlign: TextAlign.right,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
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
                                MaterialPageRoute(builder: (context) => Inserirnoti()),
                              );
                }                
            ),          
          ],
        ), 
        ButtonBar(            
            mainAxisSize: MainAxisSize.max,
            alignment: MainAxisAlignment.center,
            children: <Widget>[
            RaisedButton(
            child: Text('Lista de Noticias'),
            color: Colors.black,
            onPressed: () {               
              Noticia noticia = new Noticia();            
              Future <List<Noticia>> listar = noticia.getNoticias().then((List<Noticia> notices){
                Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => Gerenotice(noticias: notices)),
                              );
                }                
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

  



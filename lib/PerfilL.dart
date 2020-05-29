import 'dart:async';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:my_app/GerirEvento.dart';
import 'package:my_app/GerirFilme.dart';
import 'package:my_app/GerirProduto.dart';
import 'package:my_app/InserirEvento.dart';
import 'package:my_app/InserirFilme.dart';
import 'package:my_app/InserirProd.dart';
import 'package:my_app/Login.dart';
import 'package:my_app/evento.dart';
import 'package:my_app/filme.dart';
import 'package:my_app/noticia.dart';
import 'package:my_app/produto.dart';
import 'dart:convert' show json;

import 'utilizador.dart';



class PerfilL extends StatefulWidget {

  PerfilL();
  
  @override
  _Perfil createState() => _Perfil();
}


  

class _Perfil extends State<PerfilL> {

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
                'Dados do Pefil',  
                textAlign: TextAlign.right,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
          ButtonBar(            
            mainAxisSize: MainAxisSize.max,
            alignment: MainAxisAlignment.center,
            children: <Widget>[
            FlatButton(
            child: Text('Consultar dados pessoais'),
            color: Colors.black,
            onPressed: () {               
               /* Utilizador user = new Utilizador();
              
              Future <Utilizador> listar = user.getUtilizadors(id).then((<Utilizador> uti){
                Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => MostrarUti(uti)),
                              );

              }
              );*/
            },              
            ), 
            FlatButton(
            child: Text('Editar Perfil'),
            color: Colors.black,
            onPressed: () {               
                /*Utilizador user = new Utilizador();
              
              Future <List<Utilizador>> listar = user.getUtilizadores().then((List<Utilizador> users){
                Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => ListarUti(utilizadores:users)),
                              );

              }
              );*/
            },            
            ), 
            
            
          ],
        ),
              
          Text(
            'Gerir Produto',  
            textAlign: TextAlign.right,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
              
          ButtonBar(            
            mainAxisSize: MainAxisSize.max,
            alignment: MainAxisAlignment.center,
            children: <Widget>[
            RaisedButton(
            child: Text('Inserir Produto'),
            color: Colors.black,
            onPressed: () {               
                  Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => InserirProd()),
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
            child: Text('Gerir Produtos'),
            color: Colors.black,
            onPressed: () {               
                  
              Produto produto = new Produto();
              
              Future <List<Produto>> listar = produto.getProduto().then((List<Produto> products){
                Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => GerirProduto(produtos:products)),
                              );

              }
              );

                }                
            ),       
          ],
        ),
        Text(
            'Gerir Filmes',  
            textAlign: TextAlign.right,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
        ButtonBar(            
            mainAxisSize: MainAxisSize.max,
            alignment: MainAxisAlignment.center,
            children: <Widget>[
            RaisedButton(
            child: Text('Adicionar Filme'),
            color: Colors.black,
            onPressed: () {               
                  
               Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => InserirFilme()),
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
            child: Text('Gerir Filmes'),
            color: Colors.black,
            onPressed: () {               
                  
              Filme filme = new Filme();
              
              Future <List<Filme>> listar = filme.getFilme().then((List<Filme> films){
                Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => GerirFilme(filmes:films)),
                              );

              }
              );

                }                
            ),       
          ],
        ),
        Text(
            'Gerir Eventos',  
            textAlign: TextAlign.right,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
        ButtonBar(            
            mainAxisSize: MainAxisSize.max,
            alignment: MainAxisAlignment.center,
            children: <Widget>[
            RaisedButton(
            child: Text('Adicionar Evento'),
            color: Colors.black,
            onPressed: () {               
                  Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => InserirEvento()),
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
            child: Text('Gerir Eventos'),
            color: Colors.black,
            onPressed: () {               
                  
             Evento evento = new Evento();
              
              Future <List<Evento>> listar = evento.getEvento().then((List<Evento> events){
                Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => GerirEvento(eventos: events)),
                              );

              }
              );

                }                
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


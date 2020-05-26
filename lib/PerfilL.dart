import 'dart:async';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:my_app/Login.dart';
import 'package:my_app/noticia.dart';
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
                Utilizador user = new Utilizador();
              
              Future <Utilizador> listar = user.getUtilizadors(id).then((<Utilizador> uti){
                Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => MostrarUti(uti)),
                              );

              }
              );
            },               
            ),
              
             FlatButton(
            child: Text('Editar Perfil'),
            color: Colors.black,
            /*onPressed: () {               
                Utilizador user = new Utilizador();
              
              Future <List<Utilizador>> listar = user.getUtilizadores().then((List<Utilizador> users){
                Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => ListarUti(utilizadores:users)),
                              );

              }
              );
            }, */            
            ), 
            
            
          ],
        ),
              
              Text(
                'Adicionar Produto',  
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
            child: Text('Consultar Produtos'),
            color: Colors.black,
            onPressed: () {               
                  
              Produto produto = new Produto();
              
              Future <List<Produto>> listar = user.getProduto().then((List<Produto> products){
                Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => ListarProd(produtos:products)),
                              );

              }
              );

                }                
            ),
            
            
          ],
        ),
              
              
   typeButton(){
     setState(() {
    state = !state;

    });
  }

    
}
}

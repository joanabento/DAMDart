import 'dart:async';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:my_app/Login.dart';
import 'package:my_app/Registo.dart';
import 'dart:convert' show json;

import 'informacao.dart';

class RegistoInicial extends StatelessWidget {
 
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(appBar: AppBar(
        title: Center(child:Text('')),
        backgroundColor: Colors.black,
      ),
    body: 
    Container( 
      child:  Column (
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget> [
          SizedBox(
          child:
          Text("Bem-vindo ao Nosso Shopping",
            textAlign: TextAlign.center, 
            
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 20)
        ),
        ),
        
              ButtonBar(            
                mainAxisSize: MainAxisSize.min,
                alignment: MainAxisAlignment.center,
                children: <Widget>[
                  SizedBox(child: 
                  RaisedButton(
                    child: Text('Registar'),
                    color: Colors.transparent,
                    onPressed: () {
                      Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => Registo()),
                              );               
                    }   
                                
                  ),
                height:  40,
                width: 200,
                ),    
              ],
            ),
            ButtonBar(            
                mainAxisSize: MainAxisSize.max,
                alignment: MainAxisAlignment.center,
                children: <Widget>[
                  SizedBox(child: 
                  RaisedButton(
                    child: Text('Login'),
                    color: Colors.transparent,
                    onPressed: () { 
                      Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => Login()),
                              );              
                    }               
                  ),
                  height: 40,
                  width: 200,
                ),    
              ],
            ), 
          ]),
        decoration: BoxDecoration(
          image: DecorationImage(
            image: NetworkImage('https://nossoshopping.pt/wp-content/uploads/2017/09/Logo_Monograma-01.png'),
            fit: BoxFit.cover,
          ),         
        ), 
      ),    
    );        
  }
}
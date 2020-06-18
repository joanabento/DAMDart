import 'dart:async';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:my_app/Login.dart';
import 'package:my_app/PerfilA.dart';
import 'dart:convert' show json;

import 'package:my_app/administrador.dart';


class Registo extends StatefulWidget {

  Registo();
  
  @override
  _RegistoState createState() => _RegistoState();
}

class _RegistoState extends State<Registo> {

final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
final SnackBar snackBar = const SnackBar(content: Text('Showing Snackbar'));
final nomeC = TextEditingController();
final emailC = TextEditingController();
final passC = TextEditingController();
final passCC = TextEditingController();
bool state = false;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
     return Scaffold(
        appBar: AppBar(
          title: const Text('Registar'),
          backgroundColor: Colors.green,
        ),        
        body: Center(child: 
            Column (children: [
            SizedBox(height: 15),
            Text(state ? "Faça o seu registo" : ""),
          Text(
                'Efetue o seu registo',  
                textAlign: TextAlign.center,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(fontSize: 20),
              ),
            TextField(
              controller: nomeC,
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              decoration: const InputDecoration(         
              icon: Icon(Icons.person),
              hintText: 'Nome',
              labelText: 'Nome',
            ),
          ),
            TextField(
              controller: emailC,
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              decoration: const InputDecoration(         
              icon: Icon(Icons.person),
              hintText: 'Email',
              labelText: 'Email',
            ),
          ),
            TextField(
              controller: passC,
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              decoration: const InputDecoration(
              labelText: 'Password',
              icon: const Padding(
              padding: const EdgeInsets.only(top: 15.0),
              child: const Icon(Icons.lock),
              )),
              obscureText: true,
            ),
            TextField(
              controller: passCC,
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              decoration: const InputDecoration(
              labelText: 'Password',
              icon: const Padding(
              padding: const EdgeInsets.only(top: 15.0),
              child: const Icon(Icons.lock),
              )),
              obscureText: true,
            ),          
          ButtonBar(                        
            mainAxisSize: MainAxisSize.max,
            alignment: MainAxisAlignment.center,
            children: <Widget>[
            FlatButton(
              child: Text('Registar'),
              color: Colors.green,
              onPressed: () {
              Administrador admin = new Administrador();
              admin.id = 0;
              admin.nome = nomeC.text;
              admin.email = emailC.text;
              admin.pass = passC.text;
             
              admin.createAdmin(admin).then((int onValue){
                if(onValue == 200){                   
                  Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => PerfilA())
                              );
                }
                else{
                  typeButton();
                }});
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

  



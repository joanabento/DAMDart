import 'dart:async';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:my_app/Login.dart';
import 'package:my_app/PerfilA.dart';
import 'package:my_app/PerfilL.dart';
import 'dart:convert' show json;

import 'utilizador.dart';



class Registo extends StatefulWidget {

  Registo();
  
  @override
  _RegistoState createState() => _RegistoState();
}

class _RegistoState extends State<Registo> {

final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
final SnackBar snackBar = const SnackBar(content: Text('Showing Snackbar'));
final nameC = TextEditingController();
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
          backgroundColor: Colors.black,
        ),        
        body: Center(child: 
            Column (children: [
            SizedBox(height: 15),
            Text(state ? "Faça o seu registo" : "Erro"),
          Text(
                'Efetue o seu registo',  
                textAlign: TextAlign.center,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(fontSize: 20),
              ),
            TextField(
              controller: nameC,
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              decoration: const InputDecoration(         
              icon: Icon(Icons.person),
              hintText: 'Name',
              labelText: 'Name',
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
            IconButton(
              icon: Icon(Icons.person),
              iconSize: 50,
              onPressed: () {
              Utilizador user = new Utilizador();
              user.idu = 0;
              user.nome = nameC.text;
              user.email = emailC.text;
              user.pass = passC.text;
              user.tipo = "Administrador";
              user.createUtilizador(user).then((int onValue){
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
            Text("Administrador"),
            IconButton(
              icon: Icon(Icons.person),
              iconSize: 50,
              onPressed: () {
                Utilizador user = new Utilizador();
                user.idu = 0;
                user.nome = nameC.text;
                user.email = emailC.text;
                user.pass = passC.text;
                user.tipo = "Lojista";
                user.createUtilizador(user).then((int onValue){
                if(onValue == 200){                   
                  Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => PerfilL())
                              );
                }
                else{
                  typeButton();
                }});
              },
              ),
              Text("Lojista"),
              IconButton(
              icon: Icon(Icons.person),
              iconSize: 50,
              onPressed: () {
                Utilizador user = new Utilizador();
                user.idu = 0;
                user.nome = nameC.text;
                user.email = emailC.text;
                user.pass = passC.text;
                user.tipo = "Cliente";
                user.createUtilizador(user).then((int onValue){
                if(onValue == 200){                   
                  Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => Login())
                              );
                }
                else{
                  typeButton();
                }});
              },
              ),
              Text("Cliente")
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

  



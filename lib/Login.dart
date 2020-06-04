import 'dart:async';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:my_app/PerfilA.dart';
import 'package:my_app/PerfilL.dart';
import 'package:my_app/Registo.dart';
import 'package:my_app/main.dart';
import 'dart:convert' show json;

import 'utilizador.dart';



class Login extends StatefulWidget {

  Login();
  
  @override
  _LoginState createState() => _LoginState();
}


  

class _LoginState extends State<Login> {

bool state = false;

final emailc = TextEditingController();
final passc = TextEditingController();

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
     return Scaffold(
        appBar: AppBar(
          title: const Text('Login'),
          backgroundColor: Colors.black,
        ),        
        body: 
        Center(child: 
            Column (mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
            SizedBox(height: 15),
            TextField(
              controller: emailc,
              decoration: const InputDecoration(         
              icon: Icon(Icons.person),
              hintText: 'Email',
              labelText: 'Email*',
            ),
          ),
            TextField(
              controller: passc,
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
            child: Text('Login'),
            color: Colors.black,
            onPressed: () {
              Utilizador user = new Utilizador();
              user.email = emailc.text;
              user.pass = passc.text;
              Future <int> verifica = user.makelogin(user.email, user.pass).then((Utilizador onValue){
                if(onValue.tipo == 'Administrador')
                  {
                    //var userr = Utilizador.isLogged();
                    Navigator.pushAndRemoveUntil(context, 
                    MaterialPageRoute(builder: (context) => PerfilA()),
                    ModalRoute.withName('/'));
                  }
                  else
                  {
                    Navigator.pushAndRemoveUntil(context, 
                    MaterialPageRoute(builder: (context) => PerfilL()),
                    ModalRoute.withName('/'));
                  }
              });
              
            },
            ),
            FlatButton(
            child: Text('Cancelar'),
            color: Colors.black,
            onPressed: () {},
            
            ),
          ],
        )
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
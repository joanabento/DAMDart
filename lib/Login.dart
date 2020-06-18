import 'dart:async';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:my_app/PerfilA.dart';
import 'package:my_app/Registo.dart';
import 'package:my_app/administrador.dart';
import 'package:my_app/main.dart';
import 'dart:convert' show json;




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
          backgroundColor: Colors.green,
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
            color: Colors.green,
            onPressed: () {
              Administrador admin = new Administrador();
              admin.email = emailc.text;
              admin.pass = passc.text;
              Future <int> verifica = admin.makelogin(admin.email, admin.pass).then((Administrador onValue){
               
                    //var userr = Utilizador.isLogged();
                    Navigator.pushAndRemoveUntil(context, 
                    MaterialPageRoute(builder: (context) => PerfilA()),
                    ModalRoute.withName('/'));
                
              });
              
            },
            ),
            FlatButton(
            child: Text('Cancelar'),
            color: Colors.green,
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
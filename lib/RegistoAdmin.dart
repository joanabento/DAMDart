import 'dart:async';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:my_app/Login.dart';
import 'package:my_app/administrador.dart';
import 'dart:convert' show json;

import 'utilizador.dart';



class RegistoAdmin extends StatefulWidget {
int _userId;
  RegistoAdmin(int userId){
    _userId = userId;
  }
  
  @override
  _RegistoState createState() => _RegistoState(_userId);
}


  

class _RegistoState extends State<RegistoAdmin> {

final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
final SnackBar snackBar = const SnackBar(content: Text('Showing Snackbar'));
final nameC = TextEditingController();
bool state = false;
int _userId;
_RegistoState(int userId){
  _userId = userId;
}
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
            //Text(state ? "Faça o seu registo" : "Erro"),
          Text(
                'Complete o seu registo',  
                textAlign: TextAlign.center,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(fontSize: 20),
              ),
            TextField(
              controller: nameC,
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              decoration: const InputDecoration(         
              icon: Icon(Icons.shopping_cart),
              hintText: 'Nome do Shopping',
              labelText: 'Nome do Shopping',
               
              
            ),
          ),         
          ButtonBar(            
            mainAxisSize: MainAxisSize.max,
            alignment: MainAxisAlignment.center,
            children: <Widget>[
            FlatButton(
            child: Text('Registar'),
            color: Colors.black,
            onPressed: () {
              Administrador admin = new Administrador();
              admin.idA = _userId;
              admin.nomeShopping = nameC.text;
              //retorna um inteiro
              Future <int> create = admin.createAdmin(admin).then((int onValue){
                if(onValue == 200){                   
                  Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => Login()),
                              );
                }
                else{
                  typeButton();
                }});
            },
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

  



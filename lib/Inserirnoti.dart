import 'dart:async';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:my_app/Login.dart';
import 'package:my_app/Perfil.dart';
import 'package:my_app/informacao.dart';
import 'package:my_app/noticia.dart';
import 'dart:convert' show json;

import 'utilizador.dart';



class Inserirnoti extends StatefulWidget {

  Inserirnoti();
  
  @override
  _inserirnoti createState() => _inserirnoti();
}


  

class _inserirnoti extends State<Inserirnoti> {

final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
final SnackBar snackBar = const SnackBar(content: Text('Showing Snackbar'));
final nomeC = TextEditingController();
final conteudoC = TextEditingController();
final fotografiaC = TextEditingController();

bool state = false;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
     return Scaffold(
        appBar: AppBar(
          title: const Text('Inserir Informação'),
          backgroundColor: Colors.black,
        ),        
        body: Center(child: 
            
            Column (children: [
            SizedBox(height: 15),
   
            TextField(
              controller: nomeC,
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              decoration: const InputDecoration(         
              icon: Icon(Icons.info),
              hintText: 'Nome',
              labelText: 'Nome',              
            ),
          ),
            TextField(
              controller: conteudoC,
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              decoration: const InputDecoration(         
              icon: Icon(Icons.phone),
              hintText: 'Conteudo',
              labelText: 'Conteudo',
            ),
          ),
          TextField(
              controller: fotografiaC,
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              decoration: const InputDecoration(         
              icon: Icon(Icons.image),
              hintText: 'Fotografia',
              labelText: 'Fotografia',
            ),
          ),
          //falta a hora mas é automático, secalhar tiramos para não complicar xD  
           
          ButtonBar(            
            mainAxisSize: MainAxisSize.max,
            alignment: MainAxisAlignment.center,
            children: <Widget>[
            FlatButton(
            child: Text('Criar'),
            color: Colors.black,
            onPressed: () {
              Noticia noti = new Noticia();
              noti.idN = 0;
              noti.nome = nomeC.text;
              noti.conteudo = conteudoC.text;
              noti.fotografia = fotografiaC.text;
              //retorna um inteiro
              Future <int> create = noti.createNoticia(noti).then((int onValue){
                if(onValue == 200){
                    
                  Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => Perfil()),
                              );

                }
                else{
                  typeButton();
                }});
            },
            ),
            FlatButton(
            child: Text('Cancelar'),
            
            color: Colors.black,
            onPressed: () {
              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => Perfil()),
                              );
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

  



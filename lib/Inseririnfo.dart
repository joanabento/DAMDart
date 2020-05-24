import 'dart:async';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:my_app/Login.dart';
import 'package:my_app/Perfil.dart';
import 'package:my_app/informacao.dart';
import 'dart:convert' show json;

import 'utilizador.dart';



class Inseririnfo extends StatefulWidget {

  Inseririnfo();
  
  @override
  _inseririnfo createState() => _inseririnfo();
}


  

class _inseririnfo extends State<Inseririnfo> {

final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
final SnackBar snackBar = const SnackBar(content: Text('Showing Snackbar'));
final nomeC = TextEditingController();
final horaC = TextEditingController();
final contactoC = TextEditingController();
final descricaoC = TextEditingController();

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
              controller: contactoC,
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              decoration: const InputDecoration(         
              icon: Icon(Icons.phone),
              hintText: 'Contacto',
              labelText: 'Contacto',
            ),
          ),
          TextField(
              controller: descricaoC,
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              decoration: const InputDecoration(         
              icon: Icon(Icons.pages),
              hintText: 'Descrição',
              labelText: 'Descrição',
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
              Informacao info = new Informacao();
              info.idInfo = 0;
              info.nome = nomeC.text;
              info.contacto = int.parse(contactoC.text);
              info.descricao = descricaoC.text; 
              //retorna um inteiro
              Future <int> create = info.createInfo(info).then((int onValue){
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

  



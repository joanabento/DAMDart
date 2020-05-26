import 'dart:async';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:my_app/Login.dart';
import 'package:my_app/PerfilA.dart';
import 'package:my_app/informacao.dart';
import 'package:my_app/noticia.dart';
import 'dart:convert' show json;

import 'utilizador.dart';



class InserirProd extends StatefulWidget {

  InserirProd();
  
  @override
  _inserirprod createState() => _inserirprod();
}


  

class _inserirprod extends State<InserirProd> {

final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
final SnackBar snackBar = const SnackBar(content: Text('Showing Snackbar'));
final nomeC = TextEditingController();
final lojaC = TextEditingController();
final precoC = TextEditingController();
final referenciaC = TextEditingController();
final fotografiaC = TextEditingController();
  
bool state = false;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
     return Scaffold(
        appBar: AppBar(
          title: const Text('Inserir Produto'),
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
              controller: lojaC,
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              decoration: const InputDecoration(         
              icon: Icon(Icons.store),
              hintText: 'Loja',
              labelText: 'Loja',
            ),
          ),
              TextField(
              controller: precoC,
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              decoration: const InputDecoration(         
              icon: Icon(Icons.money),
              hintText: 'Preco',
              labelText: 'Preco',
            ),
          ),
             TextField(
              controller: referenciaC,
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              decoration: const InputDecoration(         
              icon: Icon(Icons.store),
              hintText: 'Referencia',
              labelText: 'Referencia',
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
              Produto prod = new Produto();
              prod.idProduto = 0;
              prod.nome = nomeC.text;
              prod.loja = lojaC.text;
              prod.preco = precoC.text; //aqui deve dar erro dps temos de confirmar no programa
              prod.referencia = referenciaC.text;
              noti.fotografia = fotografiaC.text;
              //retorna um inteiro
              Future <int> create = prod.CreateProduto(prod).then((int onValue){
                if(onValue == 200){
                    
                  Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => PerfilL()),
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
                                MaterialPageRoute(builder: (context) => PerfilL()),
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

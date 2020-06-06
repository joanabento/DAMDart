import 'dart:async';
import 'dart:io';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';
import 'package:my_app/Login.dart';
import 'package:my_app/PerfilA.dart';
import 'package:my_app/PerfilL.dart';
import 'package:my_app/informacao.dart';
import 'package:my_app/noticia.dart';
import 'package:my_app/produto.dart';
import 'dart:convert' show json;

import 'utilizador.dart';



class InserirProd extends StatefulWidget {

  InserirProd();
  
  @override
  _inserirprod createState() => _inserirprod();
}


  

class _inserirprod extends State<InserirProd> {

File _image;
final picker = ImagePicker();

Future getImage() async{
  final pickedFile = await picker.getImage(source: ImageSource.gallery);

  setState((){
    _image = File(pickedFile.path);
  });
}

final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
final SnackBar snackBar = const SnackBar(content: Text('Showing Snackbar'));
final nomeC = TextEditingController();
final lojaC = TextEditingController();
final precoC = TextEditingController();
final referenciaC = TextEditingController();
//final fotografiaC = TextEditingController();
  
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
              icon: Icon(Icons.money_off),
              hintText: 'Preco',
              labelText: 'Preco',
            ),
          ),
             TextField(
              controller: referenciaC,
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              decoration: const InputDecoration(         
              icon: Icon(Icons.format_list_numbered),
              hintText: 'Referencia',
              labelText: 'Referencia',
            ),
          ),
          Text(
            "Insira uma fotografia",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold), textAlign: TextAlign.left,

          ),

          _image == null
            ? Text("Nenhuma imagem selecionada")
            : Image.file(_image, width: 200, height: 100,),
     
           
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
              prod.preco = int.parse(precoC.text); //aqui deve dar erro dps temos de confirmar no programa
              prod.referencia = referenciaC.text;
              List <int> list = _image.readAsBytesSync();
              Uint8List bytes = Uint8List.fromList(list);
              prod.fotografia = bytes;
              //retorna um inteiro
              Future <int> create = prod.createProduto(prod).then((int onValue){
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
      floatingActionButton: FloatingActionButton(
          onPressed: getImage,
          backgroundColor: Colors.black,
          tooltip: "Escolha uma imagem",
          child: Icon(Icons.add_a_photo),
          ),

      );
  }

  typeButton(){
     setState(() {
    state = !state;

    });
  }

    
}

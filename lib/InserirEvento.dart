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
import 'package:my_app/evento.dart';
import 'package:my_app/filme.dart';
import 'package:my_app/informacao.dart';
import 'package:my_app/noticia.dart';
import 'package:my_app/produto.dart';
import 'dart:convert' show json;

import 'utilizador.dart';



class InserirEvento extends StatefulWidget {

  InserirEvento();
  
  @override
  _inserirevento createState() => _inserirevento();
}


  

class _inserirevento extends State<InserirEvento> {

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
final dataC = TextEditingController();
final localC = TextEditingController();
final precoC = TextEditingController();
//final fotografiaC = TextEditingController();

  
bool state = false;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
     return Scaffold(
        appBar: AppBar(
          title: const Text('Inserir Evento'),
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
              hintText: 'Titulo',
              labelText: 'Nome do Evento',              
            ),
          ),
            TextField(
              controller: dataC,
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              decoration: const InputDecoration(         
              icon: Icon(Icons.info),
              hintText: 'Data',
              labelText: 'Data do Evento',
            ),
          ),
              TextField(
              controller: localC,
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              decoration: const InputDecoration(         
              icon: Icon(Icons.info),
              hintText: 'Local',
              labelText: 'Local do evento',
            ),
          ),
          TextField(
              controller: precoC,
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              decoration: const InputDecoration(         
              icon: Icon(Icons.info),
              hintText: 'Preco',
              labelText: 'Preco',
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
              Evento e = new Evento();
              e.idEvento = 0;
              e.nome = nomeC.text;
              e.preco = precoC.text;
              e.localE = localC.text;
              e.dataE = dataC.text;
              List <int> list = _image.readAsBytesSync();
              Uint8List bytes = Uint8List.fromList(list);
              e.fotografia = bytes;
              //retorna um inteiro
              Future <int> create = e.createEvento(e).then((int onValue){
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
            /*FlatButton(
            child: Text('Cancelar'),
            
            color: Colors.black,
            onPressed: () {
              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => PerfilL()),
                              );
            },
            ),*/
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

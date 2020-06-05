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
import 'package:my_app/filme.dart';
import 'package:my_app/informacao.dart';
import 'package:my_app/noticia.dart';
import 'package:my_app/produto.dart';
import 'dart:convert' show json;

import 'utilizador.dart';



class InserirFilme extends StatefulWidget {

  InserirFilme();
  
  @override
  _inserirfilme createState() => _inserirfilme();
}


  

class _inserirfilme extends State<InserirFilme> {

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
final tituloC = TextEditingController();
final idadeC = TextEditingController();
final generoC = TextEditingController();
final dataC = TextEditingController();
final realizadorC = TextEditingController();
final duracaoC = TextEditingController();
final versaoC = TextEditingController();
  
bool state = false;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
     return Scaffold(
        appBar: AppBar(
          title: const Text('Inserir Filme'),
          backgroundColor: Colors.black,
        ),        
        body: Center(child: 
            
            Column (children: [
            SizedBox(height: 15),
   
            TextField(
              controller: tituloC,
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              decoration: const InputDecoration(         
              icon: Icon(Icons.info),
              hintText: 'Titulo',
              labelText: 'Titulo do Filme',              
            ),
          ),
            TextField(
              controller: idadeC,
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              decoration: const InputDecoration(         
              icon: Icon(Icons.info),
              hintText: 'Idade',
              labelText: 'Idade',
            ),
          ),
              TextField(
              controller: generoC,
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              decoration: const InputDecoration(         
              icon: Icon(Icons.info),
              hintText: 'Genero',
              labelText: 'Genero do filme',
            ),
          ),
          TextField(
              controller: dataC,
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              decoration: const InputDecoration(         
              icon: Icon(Icons.info),
              hintText: 'Data',
              labelText: 'Data de Estreia',
            ),
          ),
             TextField(
              controller: realizadorC,
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              decoration: const InputDecoration(         
              icon: Icon(Icons.person),
              hintText: 'Realizador',
              labelText: 'Realizador do filme',
            ),
          ),
          TextField(
              controller: duracaoC,
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              decoration: const InputDecoration(         
              icon: Icon(Icons.timer),
              hintText: 'Duracao',
              labelText: 'Duração do filme',
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
              Filme f = new Filme();
              f.idF = 0;
              f.titulo = tituloC.text;
              f.idade = int.parse(idadeC.text);
              f.genero = generoC.text;
              f.realizador = realizadorC.text;
              f.duracao = duracaoC.text;
              f.versao = versaoC.text;
              f.dataEstreia = dataC.text;
              List <int> list = _image.readAsBytesSync();
              Uint8List bytes = Uint8List.fromList(list);
              f.fotografia = bytes;
              //retorna um inteiro
              Future <int> create = f.createFilme(f).then((int onValue){
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

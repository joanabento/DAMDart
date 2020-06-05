import 'dart:async';
import 'dart:io';
import 'dart:typed_data';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:my_app/Login.dart';
import 'package:my_app/PerfilA.dart';
import 'package:my_app/informacao.dart';
import 'package:my_app/noticia.dart';
import 'dart:convert' show json;
import 'package:image_picker/image_picker.dart';
import 'utilizador.dart';



class Inserirnoti extends StatefulWidget {

  Inserirnoti();
  
  @override
  _inserirnoti createState() => _inserirnoti();
}


  

class _inserirnoti extends State<Inserirnoti> {

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
final conteudoC = TextEditingController();
//final fotografiaC = TextEditingController();
 
//bool state = false;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
     return Scaffold(
        appBar: AppBar(
          title: const Text('Inserir Informação'),
          backgroundColor: Colors.black,
        ),        
        body: Center(
          child: Column(children: [
            SizedBox(height: 15,),
            TextField(
              controller: nomeC,
              style: TextStyle(fontSize:18, fontWeight:  FontWeight.bold),
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
              icon: Icon(Icons.comment),
              hintText: 'Conteudo',
              labelText: 'Conteudo',
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
              Noticia noti = new Noticia();
              noti.idN = 0;
              noti.nome = nomeC.text;
              noti.conteudo = conteudoC.text;
              List <int> list = _image.readAsBytesSync();
              Uint8List bytes = Uint8List.fromList(list);
              noti.fotografia = bytes;
              //noti.fotografia = _image.text;
              //retorna um inteiro
              Future <int> create = noti.createNoticia(noti).then((int onValue){
                if(onValue == 200){
                    
                  Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => PerfilA()),
                              );

                }
                else{
                  //typeButton();
                }});
            },
            ),
       ]) 
          ]),),
       
        floatingActionButton: FloatingActionButton(
          onPressed: getImage,
          backgroundColor: Colors.black,
          tooltip: "Escolha uma imagem",
          child: Icon(Icons.add_a_photo),
          ),
          
          
     );
  }
              
              
        
         
           
          /*TextField(
              controller: fotografiaC,
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              decoration: const InputDecoration(         
              icon: Icon(Icons.image),
              hintText: 'Fotografia',
              labelText: 'Fotografia',
            ),
          ),*/
          //falta a hora mas é automático, secalhar tiramos para não complicar xD  
           
          /*,ButtonBar(            
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
                                MaterialPageRoute(builder: (context) => PerfilA()),
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
                                MaterialPageRoute(builder: (context) => PerfilA()),
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

*/
}

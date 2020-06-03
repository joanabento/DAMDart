import 'dart:async';
import 'dart:io';
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

File imageFile;
_openGallary(BuildContext context) async{
  var picture = await ImagePicker.pickImage(source: ImageSource.gallery);
  this.setState(() {
    imageFile = picture;
  });

  Navigator.of(context).pop();
}
Future<void> _showChoiceDialog(BuildContext context){
  return showDialog(context: context, builder: (BuildContext context){
    return AlertDialog(
      title: Text("Escolha"),
      content: SingleChildScrollView(
      child: ListBody(
        children: <Widget>[
          GestureDetector(
            child: Text("Galeria") ,
            onTap: (){
              _openGallary(context);
            },
            ),
            Padding(padding: EdgeInsets.all(8.0)),
        ],
        )
    ),
    );
  });
  
}

/*final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
final SnackBar snackBar = const SnackBar(content: Text('Showing Snackbar'));
final nomeC = TextEditingController();
final conteudoC = TextEditingController();
final fotografiaC = TextEditingController();*/

//bool state = false;
Widget _decideImageView(){
  if(imageFile == null){
    return Text("Nenhuma imagem selecionada");
  }
  else{
    Image.file(imageFile, width: 400, height: 400);
  }
}
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
     return Scaffold(
        appBar: AppBar(
          title: const Text('Inserir Informação'),
          backgroundColor: Colors.black,
        ),        
        body: Container(
          child:Center(
          child: Column(
            mainAxisAlignment:MainAxisAlignment.spaceAround,
            children:<Widget>[
              
              
        /*Center(child: 
            
            Column (children: [
            SizedBox(height: 15),*/
   
            /*TextField(
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
              icon: Icon(Icons.comment),
              hintText: 'Conteudo',
              labelText: 'Conteudo',
            ),
          ),*/
          _decideImageView(),
          RaisedButton(
            
            onPressed: (){

              _showChoiceDialog(context);

            },
            child:Text("Selecione uma imagem"),)
            ],
          ),
          ),
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
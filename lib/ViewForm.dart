import 'dart:async';
import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' show json;

import 'PerfilA.dart';
import 'formulario.dart';
import 'main.dart';

class ViewForm extends StatefulWidget {

  ViewForm();
  
  @override
  _ViewFormState createState() => _ViewFormState();
}
class _ViewFormState extends State<ViewForm> {

final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
final SnackBar snackBar = const SnackBar(content: Text('Showing Snackbar'));
final nameC = TextEditingController();
final idadeC = TextEditingController();
final numeroccC = TextEditingController();
final generoC = TextEditingController();
final emailC = TextEditingController();
final contactoC = TextEditingController();
final dataCasoC = TextEditingController();
final moradaC = TextEditingController();
final problemaC = TextEditingController();
bool state = false;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
     return Scaffold(
        appBar: AppBar(
          title: const Text('Formulário'),
          backgroundColor: Colors.green,
        ),        
        body: Center(child: 
            Column (children: [
            SizedBox(height: 15),
            Text(state ? "Preencha o Formulário" : ""),
          Text(
                'Preencha o seguinte Formulário',  
                textAlign: TextAlign.center,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(fontSize: 20, color: Colors.green, fontWeight: FontWeight.bold),
              ),
              Text(
                '*Todos os campos são de preenchimento obrigatório',
                  textAlign: TextAlign.left,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(fontSize: 10),
              ),
            TextField(
              controller: nameC,
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              decoration: const InputDecoration(         
              icon: Icon(Icons.person),
              hintText: 'Nome',
              labelText: 'Nome',
            ),
          ),
            TextField(
              controller: idadeC,
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              decoration: const InputDecoration(         
              icon: Icon(Icons.note),
              hintText: 'Idade',
              labelText: 'Idade',
            ),
          ),
            TextField(
              controller: numeroccC,
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              decoration: const InputDecoration(
              icon: Icon(Icons.confirmation_number),
              hintText: 'Número CC',
              labelText: 'Número CC',
              ),
            ),
            TextField(
              controller: generoC,
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              decoration: const InputDecoration(
              icon: Icon(Icons.person),
              hintText: 'Género',
              labelText: 'Género',
              ),
            ), 
            TextField(
              controller: emailC,
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              decoration: const InputDecoration(
              icon: Icon(Icons.email),
              hintText: 'Email',
              labelText: 'Email',
              ),
            ),      
            TextField(
              controller: contactoC,
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              decoration: const InputDecoration(
              icon: Icon(Icons.contact_phone),
              hintText: 'Contacto',
              labelText: 'Contacto',
              ),
            ),   
            /*TextField(
              controller: dataCasoC,
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              decoration: const InputDecoration(
              icon: Icon(Icons.data_usage),
              hintText: 'Data',
              labelText: 'Data',
              ),
            ),  */    
            TextField(
              controller: moradaC,
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              decoration: const InputDecoration(
              icon: Icon(Icons.home),
              hintText: 'Morada',
              labelText: 'Morada',
              ),
            ),    
            TextField(
              controller: problemaC,
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              decoration: const InputDecoration(
              icon: Icon(Icons.report_problem),
              hintText: 'Problema de saude',
              labelText: 'Problema de saúde',
              ),
            ),                    
          ButtonBar(                        
            mainAxisSize: MainAxisSize.max,
            alignment: MainAxisAlignment.center,
            children: <Widget>[
            FlatButton(
              child: Text("Submeter Formulário"),
              color: Colors.green,
              onPressed: () {
              Formulario form = new Formulario();
              form.id = 0;
              form.nome = nameC.text;
              form.idade = int.parse(idadeC.text);
              form.numerocc= int.parse(numeroccC.text);
              form.genero = generoC.text;
              form.email = emailC.text;
              form.contacto = int.parse(contactoC.text);
              //form.dataCaso = DateTime.parse(dataCasoC.text);
              form.morada = moradaC.text;
              form.problema = problemaC.text;
              form.createFormulario(form).then((int onValue){
                if(onValue == 200){                   
                  Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => ViewForm())
                              );
                }
                else{
                  typeButton();
                }});
              },
              ),
           
          ],
        ),     
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

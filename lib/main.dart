// Flutter code sample for AppBar

// This sample shows an [AppBar] with two simple actions. The first action
// opens a [SnackBar], while the second action navigates to a new page.

import 'package:flutter/material.dart';

import 'ListarDist.dart';
import 'PerfilA.dart';
import 'RegistoInicial.dart';
import 'ViewForm.dart';
import 'administrador.dart';
import 'distrito.dart';
import 'formulario.dart';



void main() => runApp(MyApp());


/// This Widget is the main application widget.
class MyApp extends StatelessWidget {
  static const String _title = 'COVID-19';
  bool state = false;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: _title,
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}


class _HomePageState extends State<HomePage> {

  int _selectedIndex = 0;
  static const TextStyle optionStyle = TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static const List<Widget> _widgetOptions = <Widget>[
    Text(
      'Covid-19',
      textAlign: TextAlign.start,
      overflow: TextOverflow.ellipsis,
      style: optionStyle,
    ),
  ];

  @override
  Widget build(BuildContext context) {  
    var admin = Administrador.isLogged();
    return Scaffold(
      appBar: AppBar(
        title: const Text('COVID-19'),
        backgroundColor: Colors.green,
        actions: <Widget>[
          //get do utilizador, verificar tipo e mostrar perfil consoante o tipo 
          Visibility(
            child: IconButton(            
            icon: const Icon(Icons.person),
            tooltip: 'Profile',
            onPressed: () {
              
                Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => PerfilA()),
                              );
              
            } 
   
          ),
          visible: Administrador.isLogged() != null,
          ),
         Visibility(
           child:  IconButton(
            icon: const Icon(Icons.person_add),
            tooltip: 'Registar',
            onPressed: () {
              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => RegistoInicial()),
                              );
            }            
          ),
          visible: Administrador.isLogged() == null,
         ),         
        ]
      ),
    

    body: Center(
        child: 
        Column (children: [
        Text("COVID-19", textAlign: TextAlign.start, style: TextStyle(fontFamily: 'RobotoMono',color: Colors.blueGrey, fontSize: 25, fontWeight: FontWeight.bold)),
        Image.network("https://executivedigest.sapo.pt/wp-content/uploads/2020/03/coronavirus1-1.jpg"),
         ButtonBar(            
            mainAxisSize: MainAxisSize.max,
            alignment: MainAxisAlignment.center,
            children: <Widget>[
            FlatButton(
            child: Text('Situação atual do país'),
            color: Colors.blue,
            onPressed: () {
              Distrito distrito = new Distrito();
              Future <List<Distrito>> listar = distrito.getDistritos().then((List<Distrito> dists){
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ListarDist(distritos: dists)),
                  );
              });
          
            
            }
            ),
            FlatButton(
            child: Text('Preencher Formulário'),
            color: Colors.green,
            onPressed: (){
                 Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => ViewForm()),
                              );
            }            
          ),
            ],),
            ],
            ),
    ),
    );

      

     
    }

        
        //mais cenas que queremos que apareçam no main, é aqui que se põe
      



void newMyProfile(BuildContext context){
Navigator.push(context, MaterialPageRoute(
    builder: (BuildContext context) {
      return Scaffold(
        appBar: AppBar(
          title: const Text('Meu Perfil'),
          backgroundColor: Colors.green,
        ),        
        body: Center(child: 
            Column (mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
            SizedBox(height: 15),
           
         ButtonBar(            
            mainAxisSize: MainAxisSize.max,
            alignment: MainAxisAlignment.center,
            children: <Widget>[
            FlatButton(
            child: Text('Gerir Informacao'),
            color: Colors.green,
            onPressed: () {
              Administrador admin = new Administrador();
              //listar lista de situacao do pais
              /*Future <List<Utilizador>> listar = user.getUtilizadores().then((List<Utilizador> users){
                Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => ListarUti(utilizadores:users)),
                              );
                
              });*/
            }),
              
            
        ]        
      ), ],    
      ),
      ),
      );

      },
  ));


}
     


}

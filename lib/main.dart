// Flutter code sample for AppBar

// This sample shows an [AppBar] with two simple actions. The first action
// opens a [SnackBar], while the second action navigates to a new page.

import 'package:flutter/material.dart';
import 'package:my_app/Gerecontact.dart';
import 'package:my_app/Gerenotice.dart';
import 'package:my_app/Gereservico.dart';
import 'package:my_app/Login.dart';
import 'package:my_app/PerfilA.dart';
import 'package:my_app/PerfilL.dart';
import 'package:my_app/Registo.dart';
import 'package:my_app/ViewContactos.dart';

import 'package:my_app/ViewServicos.dart';
import 'package:my_app/informacao.dart';
import 'package:my_app/noticia.dart';
import 'package:my_app/utilizador.dart';

import 'ListarUti.dart';
import 'ViewHorarios.dart';


void main() => runApp(MyApp());


/// This Widget is the main application widget.
class MyApp extends StatelessWidget {
  static const String _title = 'Aplicação Nosso Shopping';
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
      'Nosso Shopping',
      textAlign: TextAlign.center,
      overflow: TextOverflow.ellipsis,
      
      style: optionStyle,
    ),
    Text(
      'Map',
      style: optionStyle,
    ),
  ];


  

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(
        title: const Text('Nosso Shopping'),
        backgroundColor: Colors.black,
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.person),
            tooltip: 'Profile',
            onPressed: () {
              //se não tiver login feito n pode dar
              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => PerfilL()),
                              );
            }  
          ),
          IconButton(
            icon: const Icon(Icons.person_add),
            tooltip: 'Registar',
            onPressed: () {
              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => Registo()),
                              );
            }            
          ),         
        ]
      ),
        drawer: Drawer(
          child: ListView(
          padding: EdgeInsets.zero,
          children:  <Widget>[
        DrawerHeader(
          decoration: BoxDecoration(
            color: Colors.white,
            image: const DecorationImage(
            image: NetworkImage('https://nossoshopping.pt/wp-content/themes/nosso/img/the_center_img.png'),
            ),
          ),
          child: Text(
            '',
            style: TextStyle(
              color: Colors.white,
              fontSize: 24,
            ),
          ),
        ),
        ListTile(
          leading: Icon(Icons.contacts),
          title: Text('Contactos'),
          onTap: (){
            Informacao contactos = new Informacao();            
            Future <List<Informacao>> listac = contactos.getInformacao().then((List<Informacao> contacts){
              Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ViewContactos(informacoes: contacts)),
                  );           
                }
              );
          },
        ),
        ListTile(
          leading: Icon(Icons.schedule),
          title: Text('Horários'),
          onTap: (){
            Informacao horarios = new Informacao();            
            Future <List<Informacao>> listac = horarios.getInformacao().then((List<Informacao> horario){
              Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ViewHorarios(informacoes: horario)),
                  );           
                }
              );
          },
        ),
        ListTile(
          leading: Icon(Icons.shop),
          title: Text('Promoções'),
          onTap: (){},      
        ),
        ListTile(
          leading: Icon(Icons.movie),
          title: Text('Cinema'),
          onTap: (){},
        ),
        ListTile(
          leading: Icon(Icons.theaters),
          title: Text('Teatro'),
          onTap: (){},
        ),
        ListTile(
          leading: Icon(Icons.info),
          title: Text('Serviços'),
          onTap: (){
            Informacao servicos = new Informacao();            
            Future <List<Informacao>> listac = servicos.getInformacao().then((List<Informacao> servico){
              Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ViewServicos(informacoes: servico)),
                  );           
                }
              );
          },
        ),
      ],
    ),
  ),
  
      body:Center( 
        child: _widgetOptions.elementAt(_selectedIndex)),
        bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        iconSize: 30,
        items: [
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          title: Text('Home'),
          
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.map),
          
          title: Text('Map'),
        ),
      ],
      onTap: (index) {
        setState(() {
      //navigationIndex = _selectedIndex;
      _selectedIndex = index;
      /*switch (index) {
        case 0:
          return Login();
          break;
        case 1:
          return Registo();
          break;
        case 2:
          return Login();
          break;
        default: 
          return Text('Erro');
                }*/
              }
            );
          }
        ),
      );
    } 
  } 



  /*List<Widget> getwidgets()
  {
    int _selectedIndex = 0;
    const TextStyle optionStyle = TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
    List<Widget> w = new List<Widget>();

    

     return w;
     
  }*/

void newMyProfile(BuildContext context){
Navigator.push(context, MaterialPageRoute(
    builder: (BuildContext context) {
      return Scaffold(
        appBar: AppBar(
          title: const Text('Meu Perfil'),
          backgroundColor: Colors.black,
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
            child: Text('Gerir Utilizadores'),
            color: Colors.black,
            onPressed: () {
              Utilizador user = new Utilizador();
              
              Future <List<Utilizador>> listar = user.getUtilizadores().then((List<Utilizador> users){
                Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => ListarUti(utilizadores:users)),
                              );
                
              });
            }),
              FlatButton(
            child: Text('Gerir Contactos'),
            color: Colors.black,
            onPressed: () {
             Informacao info = new Informacao();
              
              Future <List<Informacao>> listar = info.getInformacao().then((List<Informacao> infos){
                Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => Gerecontact(informacoes:infos)),
                              );
                
              });
            }),
             
              FlatButton(
            child: Text('Gerir Serviços'),
            color: Colors.black,
            onPressed: () {
            Informacao info = new Informacao();
              
              Future <List<Informacao>> listar = info.getInformacao().then((List<Informacao> infos){
                Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => Gereservico(informacoes:infos)),
                              );
                
              });
            }),
          FlatButton(
            child: Text('Gerir Noticias'),
            color: Colors.black,
            onPressed: () {
             Noticia noticia = new Noticia();
              
              Future <List<Noticia>> listar = noticia.getNoticias().then((List<Noticia> notices){
                Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => Gerenotice(noticias: notices)),
                              );
                
              });
            }),
            
        ]        
      ), ],    
      ),
      ),
      );

      },
  ));


}
     



/*void newContacto(BuildContext context){
Navigator.push(context, MaterialPageRoute(
    builder: (BuildContext context) {
      return Scaffold(
        appBar: AppBar(
          title: const Text('Contactos'),
          backgroundColor: Colors.black,
        ),        
        body: Center(child: 
            Column (mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
            SizedBox(height: 15),
           
           Text(
             'Contactos',  
                textAlign: TextAlign.center,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),

           ),
            Text(
             'NossoShopping',  
                textAlign: TextAlign.center,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),

           ),
           Text(
             '(+351) 259 309 060.',  
                textAlign: TextAlign.center,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(fontSize: 10),

           ),

        
            
        ]        
      ),     
      ),
      );
    },
  ));


}

/// This is the stateless widget that the main application instantiates.
class MyStatelessWidget extends StatelessWidget {
  MyStatelessWidget({Key key}) : super(key: key);

int _selectedIndex = 0;
static const TextStyle optionStyle = TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
static const List<Widget> _widgetOptions = <Widget>[
  Text(
    'Index 0: Home',
    style: optionStyle,
  ),
  Text(
     'Index 1: Person',
     style: optionStyle,
  ),
  Text(
     'Index 2: Map',
     style: optionStyle,
  ),
];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        
        title: const Text('Nosso Shopping'),
        backgroundColor: Colors.black,
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.person_add),
            tooltip: 'Registar',
            onPressed: () {
              openPage(context);
            },
          ),
          
        ],
      ),
       drawer: Drawer(
    child: ListView(
      padding: EdgeInsets.zero,
      children:  <Widget>[
        DrawerHeader(
          decoration: BoxDecoration(
            color: Colors.white,
            image: const DecorationImage(
            image: NetworkImage('https://nossoshopping.pt/wp-content/themes/nosso/img/the_center_img.png'),
            ),
          ),
          child: Text(
            '',
            style: TextStyle(
              color: Colors.white,
              fontSize: 24,
            ),
          ),
        ),
        ListTile(
          leading: Icon(Icons.contacts),
          title: Text('Contactos'),
          onTap: (){return newContacto(context);},
        ),
        ListTile(
          leading: Icon(Icons.schedule),
          title: Text('Horários'),
          onTap: (){return newHorarios(context);},
        ),
        ListTile(
          leading: Icon(Icons.event),
          title: Text('Eventos'),
          onTap: (){return newEventos(context);},
        ),
        ListTile(
          leading: Icon(Icons.shop),
          title: Text('Promoções'),
          onTap: (){return newPromo(context);},      
        ),
        ListTile(
          leading: Icon(Icons.movie),
          title: Text('Cinema'),
          onTap: (){return newCine(context);},
        ),
        ListTile(
          leading: Icon(Icons.theaters),
          title: Text('Teatro'),
          onTap: (){return newTeatro(context);},
        ),
        ListTile(
          leading: Icon(Icons.info),
          title: Text('Serviços'),
          onTap: (){return newService(context);},
        ),
      ],
    ),
  ),
      body:  Center(
        child: _widgetOptions.elementAt(_selectedIndex),
        ),
      bottomNavigationBar: BottomNavigationBar(
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          title: Text('Home'),
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person),
          title: Text('My Profile'),         
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.map),
          title: Text('Map'),
        ),
      ],
      ),
    );
  }
  

}*/

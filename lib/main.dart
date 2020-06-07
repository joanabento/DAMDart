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
import 'package:my_app/RegistoInicial.dart';
import 'package:my_app/ViewContactos.dart';
import 'package:my_app/ViewInformacoes.dart';
import 'package:my_app/ViewMapa.dart';
import 'package:my_app/ViewServicos.dart';
import 'package:my_app/informacao.dart';
import 'package:my_app/noticia.dart';
import 'package:my_app/produto.dart';
import 'package:my_app/utilizador.dart';
import 'ListarUti.dart';
import 'ViewEvento.dart';
import 'ViewFilme.dart';
import 'ViewHorarios.dart';
import 'ViewNoticia.dart';
import 'ViewProduto.dart';
import 'evento.dart';
import 'filme.dart';


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
      textAlign: TextAlign.start,
      overflow: TextOverflow.ellipsis,
      style: optionStyle,
    ),
  ];

  @override
  Widget build(BuildContext context) {  
    var user = Utilizador.isLogged();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Nosso Shopping'),
        backgroundColor: Colors.black,
        actions: <Widget>[
          //get do utilizador, verificar tipo e mostrar perfil consoante o tipo 
          Visibility(
            child: IconButton(            
            icon: const Icon(Icons.person),
            tooltip: 'Profile',
            onPressed: () {
              if(user.tipo == "Administrador"){
                Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => PerfilA()),
                              );
              }else{
                Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => PerfilL()),
                              );
              }
            }  
          ),
          visible: Utilizador.isLogged() != null,
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
          visible: Utilizador.isLogged() == null,
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
          leading: Icon(Icons.info),
          title: Text('Informações Gerais'),
          onTap: (){
            Informacao contactos = new Informacao();            
            Future <List<Informacao>> listac = contactos.getInformacao().then((List<Informacao> contacts){
              Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ViewInformacoes(informacoes: contacts)),
                  );           
                }
              );
          },
        ),
      /*ListTile(
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
        ),*/
        ListTile(
          leading: Icon(Icons.shop),
          title: Text('Promoções'),
          onTap: (){

            Produto produto = new Produto();            
            Future <List<Produto>> listap = produto.getProduto().then((List<Produto> products){
              Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ViewProduto(produtos: products)),
                  );           
                }
              );
            
            

          },      
        ),
        ListTile(
          leading: Icon(Icons.movie),
          title: Text('Cinema'),
          onTap: (){
            Filme filme = new Filme();            
            Future <List<Filme>> listaf = filme.getFilme().then((List<Filme> films){
              Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ViewFilme(filmes: films)),
                  );           
                }
              );
          
          },
        ),
        ListTile(
          leading: Icon(Icons.theaters),
          title: Text('Teatro'),
          onTap: (){
            Evento evento = new Evento();            
            Future <List<Evento>> listae = evento.getEvento().then((List<Evento> events){
              Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ViewEvento(eventos: events)),
                  );           
                }
              );
          },
        ),
        ListTile(
          leading: Icon(Icons.map),
          title: Text('Mapa'),
          onTap: (){
             Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => ViewMapa()),
                              );
          },
        ),
        /*ListTile(
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
        ),*/
      ],
    ),
  ),  
      body: Center(
        child: 
        Column (children: [
        Text("Bem vindo ao Nosso Shopping", textAlign: TextAlign.start, style: TextStyle(fontFamily: 'RobotoMono',color: Colors.blue, fontSize: 25, fontWeight: FontWeight.bold)),
        Image.network("https://nossoshopping.pt/wp-content/themes/nosso/img/the_center_img.png"),
         ButtonBar(            
            mainAxisSize: MainAxisSize.max,
            alignment: MainAxisAlignment.center,
            children: <Widget>[
            FlatButton(
            child: Text('Ver notícias'),
            color: Colors.blue,
            onPressed: () {
                   Noticia noticia = new Noticia();            
            Future <List<Noticia>> listan = noticia.getNoticias().then((List<Noticia> notices){
              Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ViewNoticia(noticias: notices)),
                  );           
                }
              );
            
            }
            ),],),
        //mais cenas que queremos que apareçam no main, é aqui que se põe
        ]

        )),
        
        
        bottomNavigationBar: Container(
         height: 70,
            color: Colors.white,
            child: InkWell(
              onTap: (null),
              child: Padding(
                padding: EdgeInsets.only(top: 8.0),
                child: Column(
                  children: <Widget>[
                    Icon(
                      Icons.home,
                      color: Colors.black,
                      size: 40,
                    ),
                    Text('Home', style: TextStyle(color: Colors.black)),
                  ],
                ),
              ),
            ),
        ),
      );
    } 
  }

class ViewFilmes {
} 


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

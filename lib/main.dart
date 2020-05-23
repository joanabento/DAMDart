// Flutter code sample for AppBar

// This sample shows an [AppBar] with two simple actions. The first action
// opens a [SnackBar], while the second action navigates to a new page.

import 'package:flutter/material.dart';
import 'package:my_app/Login.dart';
import 'package:my_app/Registo.dart';
import 'package:my_app/utilizador.dart';

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
      'My Profile',
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
          leading: Icon(Icons.person),
          title: Text('Meu Perfil'),
          onTap: (){newMyProfile(context);},
        ),
        ListTile(
          leading: Icon(Icons.contacts),
          title: Text('Contactos'),
          onTap: (){},
        ),
        ListTile(
          leading: Icon(Icons.schedule),
          title: Text('Horários'),
          onTap: (){/*return pagina que queremos*/},
        ),
        ListTile(
          leading: Icon(Icons.event),
          title: Text('Eventos'),
          onTap: (){},
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
          onTap: (){},
        ),
      ],
    ),
  ),
  
      body:Center( 
        child: _widgetOptions.elementAt(_selectedIndex)),
        bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        iconSize: 30,
        items: /*<BottomNavigationBarItem>*/[
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
      onTap: (index) {
        setState(() {
      //navigationIndex = _selectedIndex;
      _selectedIndex = index;
      /*switch (navigationIndex) {
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
           
         /*  ButtonBar(            
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
            }),*/
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

void newHorarios(BuildContext context){

Navigator.push(context, MaterialPageRoute(
    builder: (BuildContext context) {
      return Scaffold(
        appBar: AppBar(
          title: const Text('Horários'),
          backgroundColor: Colors.black,
        ),        
        body: Center(child: 
            Column (mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
            SizedBox(height: 15),
                 

           Text(
             'Horários',  
                textAlign: TextAlign.center,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),

           ),
           Text(
             'Centro Comercial',  
                textAlign: TextAlign.center,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),

           ),
           Text(
             '9h00 - 23h00',  
                textAlign: TextAlign.center,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(fontSize: 10),

           ),
            Text(
             'Lojas',  
                textAlign: TextAlign.center,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),

           ),
           Text(
             '10h00 - 23h00',  
                textAlign: TextAlign.center,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(fontSize: 10),

           ),
           Text(
             'Cinema',  
                textAlign: TextAlign.center,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),

           ),
           Text(
             'Segunda a Sábado - abertura às 13h00. \n Domingo  abertura às 10h30',  
                textAlign: TextAlign.center,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(fontSize: 10),

           ),
           Text(
             'Parafarmácia',  
                textAlign: TextAlign.center,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),

           ),
           Text(
             '9h00 - 23h00',  
                textAlign: TextAlign.center,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(fontSize: 10),

           ),
           Text(
             'Hipermercado',  
                textAlign: TextAlign.center,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),

           ),
           Text(
             '9h00 - 23h00 \n Domingo e feriados: 9h00 - 22h00',  
                textAlign: TextAlign.center,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(fontSize: 10),

           ),

           Text(
             'ACP',  
                textAlign: TextAlign.center,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),

           ),
           Text(
             '10h00 - 20h00 (encerra ao fim de semana)',  
                textAlign: TextAlign.center,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(fontSize: 10),

           ),
           Text(
             'Parque de Estacionamento',  
                textAlign: TextAlign.center,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),

           ),
           Text(
             'Parque A: \n segunda a quinta: 9h00 - 23-00h; \n sextas, sábados e véspera de feriado: 9h00 - 15min apos a última sessão de cine.',  
                textAlign: TextAlign.center,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(fontSize: 10),

           ),
           Text(
             'Parque B: \n 9h00 - 23-00h',  
                textAlign: TextAlign.center,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(fontSize: 10),

           ),
           Text(
             'Parque C: \n Segunda a sexta: 12h00 - 22-30h \n Sábado e domingo: 9h00 - 22h30',  
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
void newContactos(BuildContext context){

}

void newEventos(BuildContext context){

}
void newPromo(BuildContext context){

}

void newCine(BuildContext context){

}

void newTeatro(BuildContext context){

}

void newService(BuildContext context){

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

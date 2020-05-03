// Flutter code sample for AppBar

// This sample shows an [AppBar] with two simple actions. The first action
// opens a [SnackBar], while the second action navigates to a new page.

import 'package:flutter/material.dart';

void main() => runApp(MyApp());


/// This Widget is the main application widget.
class MyApp extends StatelessWidget {
  static const String _title = 'Aplicação Nosso Shopping';
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: _title,
      home: MyStatelessWidget(),
    );
  }
}

final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
final SnackBar snackBar = const SnackBar(content: Text('Showing Snackbar'));

void openPage(BuildContext context) {
  Navigator.push(context, MaterialPageRoute(
    builder: (BuildContext context) {
      return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
          title: const Text('Registar'),
        ),
        body: Center(child: 
        Column (children: [
          SizedBox(height: 15),
          TextFormField(
         decoration: const InputDecoration(         
         icon: Icon(Icons.person),
          hintText: 'Name?',
          labelText: 'Name *',
  ),
        ),
        TextFormField(
          decoration: const InputDecoration(         
         icon: Icon(Icons.person),
          hintText: 'Email?',
          labelText: 'Email*',
  ),
        

        ),
        TextFormField(
          decoration: const InputDecoration(         
         icon: Icon(Icons.person),
          hintText: 'Password?',
          labelText: 'Password*',
  ),),
  TextFormField(
          decoration: const InputDecoration(         
         icon: Icon(Icons.person),
          hintText: 'Confirmar Password?',
          labelText: 'Confirmar Password*',
  ),),
    
    
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
      children: const <Widget>[
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
        ),
        ListTile(
          leading: Icon(Icons.schedule),
          title: Text('Horários'),
        ),
        ListTile(
          leading: Icon(Icons.event),
          title: Text('Eventos'),
        ),
        ListTile(
          leading: Icon(Icons.shop),
          title: Text('Promoções'),
        ),
        ListTile(
          leading: Icon(Icons.movie),
          title: Text('Cinema'),
        ),
        ListTile(
          leading: Icon(Icons.theaters),
          title: Text('Teatro'),
        ),
        ListTile(
          leading: Icon(Icons.info),
          title: Text('Serviços'),
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
}

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
<<<<<<< HEAD
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Nosso Shopping'),
=======
      title: _title,
      home: MyStatelessWidget(),
>>>>>>> be15d3689efccf29708d42cb76faa5fdc6efe868
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
          title: const Text('Registar'),
        ),
        body: TextField(
        obscureText: true,
        decoration: InputDecoration(
        border: OutlineInputBorder(),
        labelText: 'Password',
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

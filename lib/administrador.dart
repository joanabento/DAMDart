import 'package:flutter/material.dart';
import 'dart:typed_data';
import 'package:http/http.dart' as http;
import 'package:scoped_model/scoped_model.dart';
import 'dart:convert' show json, jsonDecode;

class Administrador extends Model
{
int id;  //todas as variaveis em minuscula
String nome;
String email;
String pass;

final url = 'http://298d6af40aef.ngrok.io/';

static Administrador _logado;

Administrador({int id, String name, String em, String password})
{
  this.id = id;
  //this.nomeShopping = nameS; 
  this.nome = name;
  this.email = em;
  this.pass = password; 

}

factory Administrador.isLogged(){
  return _logado;
}
factory Administrador.logout(){
  _logado = null;
}
factory Administrador.fromJson(Map<String, dynamic> json)
{
  return Administrador(
    id: json['id'] as int,
    name: json['nome'] as String,
    em: json['email'] as String,
    password: json['pass'] as String
   
  );
}

Future<List<Administrador>> getAdministradores() async{
  var url = this.url +'api/Administrador';
  http.Response resposta = await http.get(url, headers:{"Accept" : "application/json"});

  List lista = json.decode(resposta.body);

  List<Administrador> listaAdm = new List<Administrador>();

  for(int i = 0; i<lista.length; i++)
    listaAdm.add(Administrador.fromJson(lista[i]));
    return listaAdm;
}

Future<Administrador> getAdministradors(int id) async {
  var url = this.url + 'api/Administrador/';
  http.Response response = await http.get(
    Uri.encodeFull(url + id.toString()),
    headers: {
      "Accept":"application/json"
    }
  );

  Administrador administrador = Administrador.fromJson(json.decode(response.body));

  return administrador;
}

Future<int> createAdmin(Administrador administrador) async {
  var url = this.url + 'api/Administrador';
  var body = json.encode(<String,Object>{
    'id':administrador.id,
    'nome':administrador.nome, //mm nomes como no c#
    'email': administrador.email,
    'pass': administrador.pass
    
    
  });
  print(body);

  http.Response response = await http.post(url,
      headers: {"Content-Type": "application/json"},
      body: body);
      return response.statusCode;
}

void UpdateAdmin(int idA, String what, String NS) async{
  var url = 'link ngrok' + idA.toString() + "/" + what;
  var body = json.encode(NS);  //aqui ele tem value e eu queria por nome, pass mas n dá. como fazer?????

  http.put(url,
    headers: {"Content-Type" : "application/json"},
    body: body).then((http.Response response){

    });
  
  
}

Future<Administrador> makelogin(String email, String pass) async
{
  var url = this.url + 'api/Login';

  var body = json.encode(<String,Object>{
    'email': email,
    'pass': pass
  });

  http.Response response = await http.post(url,
      headers: {"Content-Type": "application/json"},
      body: body); 
  
  if(response.statusCode == 200){
    var admin = new Administrador.fromJson(jsonDecode(response.body));
    _logado = admin;
    return admin;
  }
  throw new Exception('Failed on login');
}
}
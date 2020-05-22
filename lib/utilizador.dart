import 'package:flutter/material.dart';
import 'dart:typed_data';
import 'package:http/http.dart' as http;
import 'package:scoped_model/scoped_model.dart';
import 'dart:convert' show json;

class Utilizador extends Model
{
int idu;  //todas as variaveis em minuscula
String nome; 
String email; 
String pass;
String tipo;


Utilizador({int id, String name, String email, String password, String tipo})
{
  this.idu = id;
  this.nome = name;  
  this.pass = password;
  this.tipo = tipo;
}

factory Utilizador.fromJson(Map<String, dynamic> json)
{
  return Utilizador(
    id: json['idU'] as int,
    name: json['nome'] as String,
    email: json['email'] as String, //as variaveis a laranja sao iguais as da api
    password: json['pass'] as String,
    tipo: json['tipo'] as String
  );
}

Future<List> getUtilizadores() async{
  http.Response resposta = await http.get(Uri.encodeFull('link do ngrok'), headers:{"Accept" : "application/json"});

  List lista = json.decode(resposta.body);

  List<Utilizador> listau = new List<Utilizador>();

  for(int i = 0; i<lista.length; i++)
    listau.add(Utilizador.fromJson(lista[i]));
    return listau;
}

Future<Utilizador> getUtilizadors(int id) async {
  http.Response response = await http.get(
    Uri.encodeFull("link do ngrok" + id.toString()),
    headers: {
      "Accept":"application/json"
    }
  );

  Utilizador user = Utilizador.fromJson(json.decode(response.body));

  return user;
}

Future <int> createUtilizador(Utilizador user) async {
  var url = 'http://330821d7.ngrok.io/api/Utilizador';
  var body = json.encode(<String,Object>{
    'idU':user.idu,
    'nome':user.nome, //mm nomes como no c#
    'email':user.email,
    'pass':user.pass,
    //'tipo':user.tipo
  });
  print(body);

  http.Response response = await http.post(url,
      headers: {"Content-Type": "application/json"},
      body: body);
    return response.statusCode;
}

void UpdateUtilizador(int idU, String what, String nome, String pass) async{
  var url = 'link ngrok' + idU.toString() + "/" + what;
  var body = json.encode(nome);  //aqui ele tem value e eu queria por nome, pass mas n dá. como fazer?????

  http.put(url,
    headers: {"Content-Type" : "application/json"},
    body: body).then((http.Response response){

    });
  
  
}
}
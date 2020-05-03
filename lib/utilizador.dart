import 'package:flutter/material.dart';
import 'dart:typed_data';
import 'package:http/http.dart' as http;
import 'package:scoped_model/scoped_model.dart';
import 'dart:convert' show json;

class Utilizador extends Model
{
int idu; 
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
    email: json['email'] as String,
    password: json['pass'] as String,
    tipo: json['tipo'] as String
  );
}

Future<List> getUtilizadores() async{
  http.Response resposta = await http.get(Uri.encodeFull('link do ngrok'), headers:{"Accept" : "application/json"});

  List lista = json.decode(resposta.body);
}

}
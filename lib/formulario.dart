import 'package:flutter/material.dart';
import 'dart:typed_data';
import 'package:http/http.dart' as http;
import 'package:scoped_model/scoped_model.dart';
import 'dart:convert' show json, jsonDecode;

class Formulario extends Model
{

int id;  //todas as variaveis em minuscula
String nome; 
int idade;
int numerocc;
String genero; 
String email;
int contacto;
DateTime dataCaso;
String morada;
String problema;


final url = 'http://298d6af40aef.ngrok.io/';

Formulario({int id, String name, int age, int nr, String gen, String em, DateTime date,int contact, String mora, String prob})
{
  this.id = id;
  this.nome = name;  
  this.idade = age;
  this.numerocc = nr;
  this.genero = gen;
  this.email = em;
  this.contacto = contact;
  this.dataCaso = date;
  this.morada = mora;
  this.problema = prob;

}

factory Formulario.fromJson(Map<String, dynamic> json)
{
  return Formulario(
    id: json['id'] as int,
    name: json['nome'] as String,
    age: json['idade'] as int,
    nr: json['numerocc'] as int,
    gen: json['genero'] as String,
    em: json['email'] as String, //as variaveis a laranja sao iguais as da api
    contact: json['contacto'] as int,
    date: json['dataCaso'] as DateTime,
    mora: json['morada'] as String,
    prob: json['problema'] as String
  );
}

Future<List<Formulario>> getFormularios() async{
  var url = this.url + 'api/Caso';
  http.Response resposta = await http.get(url, headers:{"Accept" : "application/json"});

  List lista = json.decode(resposta.body);

  List<Formulario> listaf = new List<Formulario>();

  for(int i = 0; i<lista.length; i++)
    listaf.add(Formulario.fromJson(lista[i]));
    return listaf;
}

Future<Formulario> getFormulars(int id) async {
  var url = this.url + 'api/Caso/';
  http.Response response = await http.get(
    Uri.encodeFull(url + id.toString()),
    headers: {
      "Accept":"application/json"
    }
  );

  Formulario form = Formulario.fromJson(json.decode(response.body));

  return form;
}

Future <int> createFormulario(Formulario form) async {
  var url = this.url + 'api/Caso';
  var body = json.encode(<String,Object>{
    'id': form.id,
    'nome': form.nome, //mm nomes como no c#
    'idade': form.idade,
    'numerocc': form.numerocc,
    'genero':form.genero,
    'email': form.email,
    'contacto': form.contacto,
    //'dataCaso': form.dataCaso.toString(),
    'morada': form.morada,
    'problema': form.problema
  });
  print(body);

  http.Response response = await http.post(url,
      headers: {"Content-Type": "application/json"},
      body: body);
    return response.statusCode;
}


Future<int> eliminarForm(int idU) async {
  print(idU);
  var url = 'http://298d6af40aef.ngrok.io/api/Caso/' + id.toString();


  http.Response response = await http.delete(url,
  headers: {"Content-Type": "application/json"},
  );

  return response.statusCode;
  
}




}
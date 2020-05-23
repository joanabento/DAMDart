import 'package:flutter/material.dart';
import 'dart:typed_data';
import 'package:http/http.dart' as http;
import 'package:scoped_model/scoped_model.dart';
import 'dart:convert' show json;

class Informacao extends Model
{
int idInfo;  //todas as variaveis em minuscula
String nome; 
DateTime hora; 
int contacto;
String descricao;


Informacao({int id, String name, DateTime hour, int contact, String description})
{
  this.idInfo = id;
  this.nome = name;  
  this.hora = hour;
  this.contacto = contact;
  this.descricao = description;
}

factory Informacao.fromJson(Map<String, dynamic> json)
{
  return Informacao(
    id: json['idInfo'] as int,
    name: json['nome'] as String,
    hour: json['hora'] as DateTime, //as variaveis a laranja sao iguais as da api
    contact: json['contacto'] as int,
    description: json['descricao'] as String
  );
}

Future<List> getInformacao() async{
  http.Response resposta = await http.get(Uri.encodeFull('link do ngrok'), headers:{"Accept" : "application/json"});

  List lista = json.decode(resposta.body);

  List<Informacao> listai = new List<Informacao>();

  for(int i = 0; i<lista.length; i++)
    listai.add(Informacao.fromJson(lista[i]));
    return listai;
}

Future<Informacao> getInformacoes(int id) async {
  http.Response response = await http.get(
    Uri.encodeFull("link do ngrok" + id.toString()),
    headers: {
      "Accept":"application/json"
    }
  );

  Informacao informacao = Informacao.fromJson(json.decode(response.body));

  return informacao;
}

Future <int> createInfo(Informacao informacao) async {
  var url = 'link ngrok';
  var body = json.encode(<String,Object>{
    'idInfo':informacao.idInfo,
    'nome':informacao.nome, //mm nomes como no c#
    'hora':informacao.hora.toString(),
    'contacto':informacao.contacto,
    'descricao': informacao.descricao
  });
  print(body);

  http.Response response = await http.post(url,
      headers: {"Content-Type": "application/json"},
      body: body);
     return response.statusCode; 
      
}

void updateInfo(int idInfo, String what, DateTime hora, String nome, int contacto, String descricao) async{
  var url = 'link ngrok' + idInfo.toString() + "/" + what;
  var body = json.encode(hora);  //aqui ele tem value e eu queria por nome, pass mas n dá. como fazer?????

  http.put(url,
    headers: {"Content-Type" : "application/json"},
    body: body).then((http.Response response){

    });
}
}
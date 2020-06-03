import 'package:flutter/material.dart';
import 'dart:typed_data';
import 'package:http/http.dart' as http;
import 'package:scoped_model/scoped_model.dart';
import 'dart:convert' show json;

class Lojista extends Model
{
int idL;  //todas as variaveis em minuscula
String loja; 
String tipo;


Lojista({int id, String name, String tipo})
{
  this.idL = id;
  this.loja = name;  
  this.tipo = tipo;
}

factory Lojista.fromJson(Map<String, dynamic> json)
{
  return Lojista(
    id: json['idL'] as int,
    name: json['loja'] as String,
    tipo: json['tipo'] as String
  );
}

Future<List> getLojistas() async{
  http.Response resposta = await http.get(Uri.encodeFull('http://ab8d68853b54.ngrok.io/api/Lojista'), headers:{"Accept" : "application/json"});

  List lista = json.decode(resposta.body);

  List<Lojista> listal = new List<Lojista>();

  for(int i = 0; i<lista.length; i++)
    listal.add(Lojista.fromJson(lista[i]));
    return listal;
}

Future<Lojista> getLojista(int id) async {
  http.Response response = await http.get(
    Uri.encodeFull("http://ab8d68853b54.ngrok.io/api/Lojista" + id.toString()),
    headers: {
      "Accept":"application/json"
    }
  );

  Lojista lojista = Lojista.fromJson(json.decode(response.body));

  return lojista;
}

void CreateLojista(Lojista lojista) async {
  var url = 'http://ab8d68853b54.ngrok.io/api/Lojista';
  var body = json.encode(<String,String>{
    'idL':lojista.idL.toString(),
    'loja':lojista.loja, //mm nomes como no c#
    'tipo': lojista.tipo
  });
  print(body);

  http.post(url,
      headers: {"Content-Type": "application/json"},
      body: body).then((http.Response response){

      

});
}

void UpdateLojista(int id, String what, String loja) async{
  var url = 'link ngrok' + id.toString() + "/" + what;
  var body = json.encode(loja);  

  http.put(url,
    headers: {"Content-Type" : "application/json"},
    body: body).then((http.Response response){

    });
  
  
}
}
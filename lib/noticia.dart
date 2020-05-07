import 'package:flutter/material.dart';
import 'dart:typed_data';
import 'package:http/http.dart' as http;
import 'package:scoped_model/scoped_model.dart';
import 'dart:convert' show json;

class Noticia extends Model
{
int idN;  //todas as variaveis em minuscula
String nome; 
DateTime dataN;
String conteudo; 
String fotografia;



Noticia({int id, String name, DateTime date, String content, String pic})
{
  this.idN = id;
  this.nome = name;  
  this.dataN = date;
  this.conteudo = content;
  this.fotografia = pic;
}

factory Noticia.fromJson(Map<String, dynamic> json)
{
  return Noticia(
    id: json['idN'] as int,
    name: json['nome'] as String,
    date: json['dataN'] as DateTime, //as variaveis a laranja sao iguais as da api
    content: json['conteudo'] as String,
    pic: json['fotografia'] as String
  );
}

Future<List> getNoticias() async{
  http.Response resposta = await http.get(Uri.encodeFull('link do ngrok'), headers:{"Accept" : "application/json"});

  List lista = json.decode(resposta.body);

  List<Noticia> listan = new List<Noticia>();

  for(int i = 0; i<lista.length; i++)
    listan.add(Noticia.fromJson(lista[i]));
    return listan;
}

Future<Noticia> getNotices(int id) async {
  http.Response response = await http.get(
    Uri.encodeFull("link do ngrok" + id.toString()),
    headers: {
      "Accept":"application/json"
    }
  );

  Noticia noticia = Noticia.fromJson(json.decode(response.body));

  return noticia;
}

void CreateNoticia(Noticia noticia) async {
  var url = 'link ngrok';
  var body = json.encode(<String,String>{
    'idN':noticia.idN.toString(),
    'nome':noticia.nome, //mm nomes como no c#
    'dataN': noticia.dataN.toString(),
    'conteudo': noticia.conteudo,
    'fotografia': noticia.fotografia
  });
  print(body);

  http.post(url,
      headers: {"Content-Type": "application/json"},
      body: body).then((http.Response response){

      

});
}

void UpdateNoticia(int idN, String what, String nome, DateTime data, String conteudo, String foto) async{
  var url = 'link ngrok' + idN.toString() + "/" + what;
  var body = json.encode(nome);  //aqui ele tem value e eu queria por nome, pass mas n dá. como fazer?????

  http.put(url,
    headers: {"Content-Type" : "application/json"},
    body: body).then((http.Response response){

    });
  
  
}
}
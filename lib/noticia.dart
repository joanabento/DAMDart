import 'dart:io';

//import 'package:byte_array/byte_array.dart';
import 'package:flutter/material.dart';
import 'dart:typed_data';
import 'package:http/http.dart' as http;
import 'package:scoped_model/scoped_model.dart';
import 'dart:convert' show base64Decode, json;

class Noticia extends Model
{
int idN;  //todas as variaveis em minuscula
String nome; 
String conteudo; 
Uint8List fotografia;

final url = 'http://25ae316ec689.ngrok.io/';

Noticia({int id, String name, DateTime date, String content, Uint8List pic})
{
  this.idN = id;
  this.nome = name;  
  this.conteudo = content;
  this.fotografia = pic;
}

factory Noticia.fromJson(Map<String, dynamic> json)
{
  var bytes = base64Decode(json['fotografia'] as String);
  //String bystring = json['fotografia'] as String;
  //List <int> list = bystring.codeUnits;
  //Uint8List bytes = Uint8List.fromList(list);

  return Noticia(
    id: json['idN'] as int,
    name: json['nome'] as String,
    content: json['conteudo'] as String,
    pic: bytes
  );
}

Future<List<Noticia>> getNoticias() async{
  var url = this.url + 'api/Noticia';
  http.Response resposta = await http.get(url, headers:{"Accept" : "application/json"});

  List lista = json.decode(resposta.body);

  List<Noticia> listan = new List<Noticia>();

  for(int i = 0; i<lista.length; i++)
    listan.add(Noticia.fromJson(lista[i]));
    return listan;
}

Future<Noticia> getNotices(int id) async {
  var url = this.url + 'api/Noticia/';
  http.Response response = await http.get(
    Uri.encodeFull(url + id.toString()),
    headers: {
      "Accept":"application/json"
    }
  );

  Noticia noticia = Noticia.fromJson(json.decode(response.body));

  return noticia;
}

Future<int> createNoticia(Noticia noticia) async {
  var url = this.url + 'api/Noticia';
 // var bytes = ByteArray.fromBuffer(noticia.fotografia.buffer)
 var list = new List.from(noticia.fotografia);
 print(list);
  var body = json.encode(<String,Object>{
    'idN':noticia.idN,
    'nome':noticia.nome, //mm nomes como no c#
    'conteudo': noticia.conteudo,
    'fotografia': list
  });
 
  http.Response response = await http.post(url,
      headers: {"Content-Type": "application/json"},
      body: body);
  return response.statusCode;
}

void updateNoticia(int idN, String what, String nome, DateTime data, String conteudo, String foto) async{
  var url = 'http://25ae316ec689.ngrok.io/api/Noticia' + idN.toString() + "/" + what;
  var body = json.encode(nome);  //aqui ele tem value e eu queria por nome, pass mas n dá. como fazer?????

  http.put(url,
    headers: {"Content-Type" : "application/json"},
    body: body).then((http.Response response){

    });
  
  
}
Future<int> eliminarN (int idN) async{
  print(idN);
  var url = 'http://25ae316ec689.ngrok.io/api/Noticia/' + idN.toString();


  http.Response response = await http.delete(url,
  headers: {"Content-Type": "application/json"},
  );

  return response.statusCode;
}
}

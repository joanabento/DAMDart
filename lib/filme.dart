import 'dart:ffi';

import 'package:flutter/material.dart';
import 'dart:typed_data';
import 'package:http/http.dart' as http;
import 'package:scoped_model/scoped_model.dart';
import 'dart:convert' show json;


class Filme extends Model{
  int idF; 
  String titulo; 
  int idade;
  String genero;
  String dataEstreia;
  String realizador; 
  String duracao; 
  String versao;

  Filme({int id, String titulo, int idade, String data, String genero, String realizador, String duracao, String versao}){
    this.idF = id;
    this.titulo = titulo;
    this.dataEstreia = data;
    this.idade = idade; 
    this.realizador = realizador;
    this.duracao = duracao;
    this.versao = versao;
    this.genero = genero;
  }

  factory Filme.fromJson(Map<String, dynamic> json){
    return Filme(
      id: json['idF'] as int,
      titulo: json['titulo'] as String,
      idade: json['idade'] as int, 
      genero: json['genero'] as String, 
      data: json['dataEstreia'] as String,
      realizador: json['realizador'] as String, 
      duracao: json['duracao'] as String,
      versao: json['versao'] as String
    );
  }

  Future<List<Filme>> getFilme() async{
    http.Response resposta = await http.get(Uri.encodeFull('http://7a687372785c.ngrok.io/api/Filme'), headers:{ "Accept" : "application/json"});

    List lista = json.decode(resposta.body);

    List<Filme> listaf = new List<Filme>();
    for (int i = 0; i< lista.length; i++)
      listaf.add(Filme.fromJson(lista[i]));
      return listaf;
    
  }

  Future<Filme> getFilmes(int id) async {
  http.Response resposta = await http.get(
    Uri.encodeFull("http://7a687372785c.ngrok.io/api/Filme" + id.toString()),
    headers: {
      "Accept":"application/json"
    }
  );

  Filme f = Filme.fromJson(json.decode(resposta.body));

  return f;
}

Future<int> createFilme(Filme f) async {
  var url = 'http://7a687372785c.ngrok.io/api/Filme';
  var body = json.encode(<String,Object>{
    'idF':f.idF,
    'titulo':f.titulo, //mm nomes como no c#
    'idade': f.idade,
    'genero': f.genero,
    'dataEstreia': f.dataEstreia,
    'realizador': f.realizador,
    'duracao': f.duracao,
    'versao': f.versao
  });
  print(body);

  http.Response response = await http.post(url,
      headers: {"Content-Type": "application/json"},
      body: body);
      return response.statusCode;
}

void UpdateFilme(int idF, String what,String titulo, int idade, String genero, String realizador, DateTime data, String versao, Float duracao) async{
  var url = 'http://7a687372785c.ngrok.io/api/Filme' + idF.toString() + "/" + what;
  var body = json.encode(what);  //aqui ele tem value e eu queria por nome, pass mas n dá. como fazer?????

  http.put(url,
    headers: {"Content-Type" : "application/json"},
    body: body).then((http.Response response){

    });
  
  
}
Future<int> EliminarFilme (int idF) async{
  print(idF);
  var url = 'http://7a687372785c.ngrok.io/api/Filme/' + idF.toString();


  http.Response response = await http.delete(url,
  headers: {"Content-Type": "application/json"},
  );

  return response.statusCode;
}

}
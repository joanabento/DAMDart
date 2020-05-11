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
  DateTime dataEstreia;
  String realizador; 
  Float duracao; 
  String versao;

  Filme({int id, String titulo, int idade, DateTime data, String genero, String realizador, Float duracao, String versao}){
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
      data: json['dataEstreia'] as DateTime,
      realizador: json['realizador'] as String, 
      duracao: json['duracao'] as Float,
      versao: json['versao'] as String
    );
  }

  Future<List> getFilme() async{
    http.Response resposta = await http.get(Uri.encodeFull('link do ngrok'), headers:{ "Accept" : "application/json"});

    List lista = json.decode(resposta.body);

    List<Filme> listaf = new List<Filme>();
    for (int i = 0; i< lista.length; i++){
      listaf.add(Filme.fromJson(lista[i]));
      return lista;
    }
  }

  Future<Filme> getFilmes(int id) async {
  http.Response resposta = await http.get(
    Uri.encodeFull("link do ngrok" + id.toString()),
    headers: {
      "Accept":"application/json"
    }
  );

  Filme f = Filme.fromJson(json.decode(resposta.body));

  return f;
}

void CreateFilme(Filme f) async {
  var url = 'link ngrok';
  var body = json.encode(<String,String>{
    'idF':f.idF.toString(),
    'titulo':f.titulo, //mm nomes como no c#
    'idade': f.idade.toString(),
    'genero': f.genero,
    'data': f.dataEstreia.toString(),
    'realizador': f.realizador,
    'duracao': f.duracao.toString(),
    'versao': f.versao
  });
  print(body);

  http.post(url,
      headers: {"Content-Type": "application/json"},
      body: body).then((http.Response response){
});
}

void UpdateFilme(int idF, String what,String titulo, int idade, String genero, String realizador, DateTime data, String versao, Float duracao) async{
  var url = 'link ngrok' + idF.toString() + "/" + what;
  var body = json.encode(what);  //aqui ele tem value e eu queria por nome, pass mas n dá. como fazer?????

  http.put(url,
    headers: {"Content-Type" : "application/json"},
    body: body).then((http.Response response){

    });
  
  
}

}
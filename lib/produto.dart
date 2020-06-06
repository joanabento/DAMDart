import 'dart:ffi';
import 'package:byte_array/byte_array.dart';

import 'package:flutter/material.dart';
import 'dart:typed_data';
import 'package:http/http.dart' as http;
import 'package:scoped_model/scoped_model.dart';
import 'dart:convert' show base64Decode, json;

class Produto extends Model{
  int idProduto;
  String nome;
  String loja;
  int preco;
  String referencia;
  Uint8List fotografia;

final url = 'http://e07b173cd6a7.ngrok.io/';

  Produto({int id, String nome, String loja, int p, Uint8List pic, String referencia}){
    this.idProduto = id;
    this.nome = nome;
    this.loja = loja; 
    this.preco = p;
    this.referencia = referencia; 
    this.fotografia = pic; 
  }

  factory Produto.fromJson(Map<String, dynamic> json)
  {
  var bytes = base64Decode(json['fotografia'] as String);

  return Produto(
    id: json['idProduto'] as int,
    nome: json['nome'] as String,
    loja: json['loja'] as String, //as variaveis a laranja sao iguais as da api
    p: json['preco'] as int,
    referencia: json['referencia'] as String,
    pic: bytes
  );
  }

  Future<List<Produto>> getProduto() async{
  
  var url = this.url + 'api/Produto';
  http.Response resposta = await http.get(url, headers:{"Accept" : "application/json"});

  List lista = json.decode(resposta.body);

  List<Produto> listai = new List<Produto>();

  for(int i = 0; i<lista.length; i++)
    listai.add(Produto.fromJson(lista[i]));
    return listai;
  }

  Future<Produto> getInformacoes(int id) async {
  var url = this.url + 'api/Produto/';
  http.Response response = await http.get(
    Uri.encodeFull(url + id.toString()),
    headers: {
      "Accept":"application/json"
    }
  );

  Produto p = Produto.fromJson(json.decode(response.body));

  return p;
}

Future<int> createProduto(Produto p) async {
  var url = this.url + 'api/Produto';
  var list = new List.from(p.fotografia);
  print(list);
  var body = json.encode(<String,Object>{
    'idProduto': p.idProduto,
    'nome':p.nome, //mm nomes como no c#
    'loja': p.loja,
    'preco':p.preco,
    'referencia': p.referencia,
    'fotografia': list
  });


  http.Response response = await http.post(url,
      headers: {"Content-Type": "application/json"},
      body: body);
      return response.statusCode;
}


void UpdateProduto(int idP, String what, Float preco, String nome, String loja, String referencia, String foto) async{
  var url = 'link ngrok' + idP.toString() + "/" + what;
  var body = json.encode(what);  //aqui ele tem value e eu queria por nome, pass mas n dá. como fazer?????

  http.put(url,
    headers: {"Content-Type" : "application/json"},
    body: body).then((http.Response response){

    });
  
  
}

Future<int> EliminarProduto (int idP) async{
  print(idP);
  var url = 'http://e07b173cd6a7.ngrok.io/api/Produto/' + idP.toString();

  http.Response response = await http.delete(url,
  headers: {"Content-Type": "application/json"},
  );

  return response.statusCode;
}
}

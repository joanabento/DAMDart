import 'dart:ffi';

import 'package:flutter/material.dart';
import 'dart:typed_data';
import 'package:http/http.dart' as http;
import 'package:scoped_model/scoped_model.dart';
import 'dart:convert' show json;

class Produto extends Model{
  int idProduto;
  String nome;
  String loja;
  int preco;
  String referencia;
  String fotografia;

  Produto({int id, String nome, String loja, int p, String foto, String referencia}){
    this.idProduto = id;
    this.nome = nome;
    this.loja = loja; 
    this.preco = p;
    this.referencia = referencia; 
    this.fotografia = foto; 
  }

  factory Produto.fromJson(Map<String, dynamic> json)
  {
  return Produto(
    id: json['idProduto'] as int,
    nome: json['nome'] as String,
    loja: json['loja'] as String, //as variaveis a laranja sao iguais as da api
    p: json['preco'] as int,
    referencia: json['referencia'] as String,
    foto: json['fotografia'] as String
  );
  }

  Future<List<Produto>> getProduto() async{
  http.Response resposta = await http.get(Uri.encodeFull('http://3eabdb0ef074.ngrok.io/api/Produto'), headers:{"Accept" : "application/json"});

  List lista = json.decode(resposta.body);

  List<Produto> listai = new List<Produto>();

  for(int i = 0; i<lista.length; i++)
    listai.add(Produto.fromJson(lista[i]));
    return listai;
  }

  Future<Produto> getInformacoes(int id) async {
  http.Response response = await http.get(
    Uri.encodeFull("http://3eabdb0ef074.ngrok.io/api/Produto" + id.toString()),
    headers: {
      "Accept":"application/json"
    }
  );

  Produto p = Produto.fromJson(json.decode(response.body));

  return p;
}

Future<int> createProduto(Produto p) async {
  var url = 'http://3eabdb0ef074.ngrok.io/api/Produto';
  var body = json.encode(<String,Object>{
    'idProduto': p.idProduto,
    'nome':p.nome, //mm nomes como no c#
    'loja': p.loja,
    'preco':p.preco,
    'referencia': p.referencia,
    'fotografia': p.fotografia
  });
  print(body);

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
}

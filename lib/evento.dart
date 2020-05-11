import 'dart:ffi';
import 'package:flutter/material.dart';
import 'dart:typed_data';
import 'package:http/http.dart' as http;
import 'package:scoped_model/scoped_model.dart';
import 'dart:convert' show json;

class Evento extends Model{
  int idEvento;
  String nome;
  DateTime dataE;
  String localE;
  Float preco;
  String fotografia;

  Evento({int id, String nome, DateTime data, String local, Float preco, String foto}){
    this.idEvento = id;
    this.nome = nome;
    this.dataE = data;
    this.localE = local;
    this.preco = preco; 
    this.fotografia = foto;
  }

  factory Evento.fromJson(Map<String, dynamic> json){
    return Evento(
      id: json['idEvento'] as int,
      nome: json['nome'] as String, 
      data: json['dataE'] as DateTime,
      local: json['localE'] as String, 
      preco: json['preco'] as Float, 
      foto: json['fotografia'] as String
    );
  }

  Future<List> getEvento() async{
    http.Response resposta = await http.get(Uri.encodeFull('link do ngrok'), headers:{ "Accept" : "application/json"});

    List lista = json.decode(resposta.body);

    List<Evento> listae = new List<Evento>();
    for (int i = 0; i< lista.length; i++){
      listae.add(Evento.fromJson(lista[i]));
      return lista;
    }
  }

   Future<Evento> getEventos(int id) async {
    http.Response resposta = await http.get(
    Uri.encodeFull("link do ngrok" + id.toString()),
    headers: {
      "Accept":"application/json"
    });
    Evento e = Evento.fromJson(json.decode(resposta.body));
    return e;
  }

  void CreateEvento(Evento e) async{
    var url = 'link ngrok';
    var body = json.encode(<String, String>{
        'idEvento' : e.idEvento.toString(),
        'nome': e.nome,
        'dataE': e.dataE.toString(),
        'localE': e.localE,
        'preco': e.preco.toString(),
        'fotografia': e.fotografia
    });
    print(body);
    http.post(url,
      headers: {"Content-Type": "application/json"},
      body: body).then((http.Response response){
    });   
  }

  void UpdateEvento(int idF, String what,String nome, String localE, String foto, DateTime data, Float preco) async{
  var url = 'link ngrok' + idF.toString() + "/" + what;
  var body = json.encode(what);  //aqui ele tem value e eu queria por nome, pass mas n dá. como fazer?????

  http.put(url,
    headers: {"Content-Type" : "application/json"},
    body: body).then((http.Response response){

    });
  
  
}

}
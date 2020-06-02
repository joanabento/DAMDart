import 'dart:ffi';
import 'package:flutter/material.dart';
import 'dart:typed_data';
import 'package:http/http.dart' as http;
import 'package:scoped_model/scoped_model.dart';
import 'dart:convert' show json;

class Evento extends Model{
  int idEvento;
  String nome;
  String dataE;
  String localE;
  String preco;
  String fotografia;

  Evento({int id, String nome, String data, String local, String preco, String foto}){
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
      data: json['dataE'] as String,
      local: json['localE'] as String, 
      preco: json['preco'] as String, 
      foto: json['fotografia'] as String
    );
  }

  Future<List<Evento>> getEvento() async{
    http.Response resposta = await http.get(Uri.encodeFull('http://79d05b72761d.ngrok.io/api/Evento'), headers:{ "Accept" : "application/json"});

    List lista = json.decode(resposta.body);

    List<Evento> listae = new List<Evento>();
    for (int i = 0; i< lista.length; i++)
      listae.add(Evento.fromJson(lista[i]));
      return listae;
    
  }

   Future<Evento> getEventos(int id) async {
    http.Response resposta = await http.get(
    Uri.encodeFull("http://79d05b72761d.ngrok.io/api/Evento" + id.toString()),
    headers: {
      "Accept":"application/json"
    });
    Evento e = Evento.fromJson(json.decode(resposta.body));
    return e;
  }

Future<int> createEvento(Evento e) async{
    var url = 'http://79d05b72761d.ngrok.io/api/Evento';
    var body = json.encode(<String, Object>{
        'idEvento' : e.idEvento,
        'nome': e.nome,
        'dataE': e.dataE,
        'localE': e.localE,
        'preco': e.preco,
        'fotografia': e.fotografia
    });
    print(body);
    http.Response response = await http.post(url,
      headers: {"Content-Type": "application/json"},
      body: body);
      return response.statusCode; 
  }

  void UpdateEvento(int idF, String what,String nome, String localE, String foto, DateTime data, Float preco) async{
  var url = 'link ngrok' + idF.toString() + "/" + what;
  var body = json.encode(what);  //aqui ele tem value e eu queria por nome, pass mas n dá. como fazer?????

  http.put(url,
    headers: {"Content-Type" : "application/json"},
    body: body).then((http.Response response){

    });
  
  
}
Future<int> EliminarEvento (int idEvento) async{
  print(idEvento);
  var url = 'link ngrok' + idEvento.toString();

  var body = json.encode("");

  http.Response response = await http.delete(url,
  headers: {"Content-Type": "application/json"},
  );

  return response.statusCode;
}

}
import 'dart:ffi';
import 'package:flutter/material.dart';
import 'dart:typed_data';
import 'package:http/http.dart' as http;
import 'package:scoped_model/scoped_model.dart';
import 'dart:convert' show base64Decode, json;

class Evento extends Model{
  int idEvento;
  String nome;
  String dataE;
  String localE;
  String preco;
  Uint8List fotografia;

final url = 'http://e07b173cd6a7.ngrok.io/';

  Evento({int id, String nome, String data, String local, String preco, Uint8List pic}){
    this.idEvento = id;
    this.nome = nome;
    this.dataE = data;
    this.localE = local;
    this.preco = preco; 
    this.fotografia = pic;
  }

  factory Evento.fromJson(Map<String, dynamic> json){
    
  var bytes = base64Decode(json['fotografia'] as String);

    return Evento(
      id: json['idEvento'] as int,
      nome: json['nome'] as String, 
      data: json['dataE'] as String,
      local: json['localE'] as String, 
      preco: json['preco'] as String, 
      pic: bytes
    );
  }

  Future<List<Evento>> getEvento() async{
  
  var url = this.url + 'api/Evento';

    http.Response resposta = await http.get(url, headers:{ "Accept" : "application/json"});

    List lista = json.decode(resposta.body);

    List<Evento> listae = new List<Evento>();
    for (int i = 0; i< lista.length; i++)
      listae.add(Evento.fromJson(lista[i]));
      return listae;
    
  }

   Future<Evento> getEventos(int id) async {
     var url = this.url + 'api/Evento/';
    http.Response resposta = await http.get(
    Uri.encodeFull(url + id.toString()),
    headers: {
      "Accept":"application/json"
    });
    Evento e = Evento.fromJson(json.decode(resposta.body));
    return e;
  }

Future<int> createEvento(Evento e) async{
  var url = this.url + 'api/Evento';
  var list = new List.from(e.fotografia);
  print(list);
    var body = json.encode(<String, Object>{
        'idEvento' : e.idEvento,
        'nome': e.nome,
        'dataE': e.dataE,
        'localE': e.localE,
        'preco': e.preco,
        'fotografia': list
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
  var url = 'http://e07b173cd6a7.ngrok.io/api/Evento/' + idEvento.toString();


  http.Response response = await http.delete(url,
  headers: {"Content-Type": "application/json"},
  );

  return response.statusCode;
}

}
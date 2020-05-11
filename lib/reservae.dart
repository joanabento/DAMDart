import 'package:flutter/material.dart';
import 'dart:typed_data';
import 'package:http/http.dart' as http;
import 'package:scoped_model/scoped_model.dart';
import 'dart:convert' show json;

class Reservae extends Model{
  int idre;
  int lotacao;
  DateTime datar;
  int idc;
  int ide;

  Reservae ({int idre, int lotacao, DateTime data, int ide, int idc}){
    this.idre = idre;
    this.lotacao = lotacao;
    this.datar = data;
    this.ide = ide;
    this.idc = idc;
  }

  factory Reservae.fromJson(Map<String, dynamic> json){
    return Reservae(
      idre: json['idre'] as int, 
      idc: json['idc'] as int, 
      ide: json['ide'] as int, 
      lotacao: json['lotacao'] as int, 
      data: json['dataR'] as DateTime
      );
  }

  Future<List> getReserva() async{
  http.Response resposta = await http.get(Uri.encodeFull('link do ngrok'), headers:{"Accept" : "application/json"});

  List lista = json.decode(resposta.body);

  List<Reservae> listar = new List<Reservae>();

  for(int i = 0; i<lista.length; i++)
    listar.add(Reservae.fromJson(lista[i]));
    return listar;
}

Future<Reservae> getReservas(int id) async {
  http.Response response = await http.get(
    Uri.encodeFull("link do ngrok" + id.toString()),
    headers: {
      "Accept":"application/json"
    }
  );

  Reservae reservas = Reservae.fromJson(json.decode(response.body));

  return reservas;
}

void CreateReserva(Reservae reserva) async {
  var url = 'link ngrok';
  var body = json.encode(<String,String>{
    'idRE':reserva.idre.toString(),
    'ide': reserva.ide.toString(),
    'lotacao': reserva.lotacao.toString(),
    'idc': reserva.idc.toString(),
    'dataR': reserva.datar.toString()
  });
  print(body);

  http.post(url,
      headers: {"Content-Type": "application/json"},
      body: body).then((http.Response response){
});
}

void UpdateReserva(int idre, String what, int lotacao, DateTime data) async{
  var url = 'link ngrok' + idre.toString() + "/" + what;
  var body = json.encode(lotacao);  //aqui ele tem value e eu queria por nome, pass mas n dá. como fazer?????

  http.put(url,
    headers: {"Content-Type" : "application/json"},
    body: body).then((http.Response response){

    });
}
}
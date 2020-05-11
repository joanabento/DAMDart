import 'package:flutter/material.dart';
import 'dart:typed_data';
import 'package:http/http.dart' as http;
import 'package:scoped_model/scoped_model.dart';
import 'dart:convert' show json;

class ReservaF extends Model{
  int idRF;
  int idFilme;
  int lotacao;
  int idc;

  ReservaF({int idrf, int idf, int lotacao, int idc}){
     this.idRF = idrf;
     this.idFilme = idf;
     this.lotacao = lotacao;
     this.idc = idc;
  }

  factory ReservaF.fromJson(Map<String, dynamic> json)
{
  return ReservaF(
    idrf: json['idRF'] as int,
    idf: json['idFilme'] as int,
    idc: json['idc'] as int,
    lotacao: json['lotacao'] as int,  
  );
}

Future<List> getReserva() async{
  http.Response resposta = await http.get(Uri.encodeFull('link do ngrok'), headers:{"Accept" : "application/json"});

  List lista = json.decode(resposta.body);

  List<ReservaF> listar = new List<ReservaF>();

  for(int i = 0; i<lista.length; i++)
    listar.add(ReservaF.fromJson(lista[i]));
    return listar;
}

Future<ReservaF> getReservas(int id) async {
  http.Response response = await http.get(
    Uri.encodeFull("link do ngrok" + id.toString()),
    headers: {
      "Accept":"application/json"
    }
  );

  ReservaF reservas = ReservaF.fromJson(json.decode(response.body));

  return reservas;
}

void CreateReserva(ReservaF reservaf) async {
  var url = 'link ngrok';
  var body = json.encode(<String,String>{
    'idRF':reservaf.idRF.toString(),
    'idFilme': reservaf.idFilme.toString(),
    'lotacao': reservaf.lotacao.toString(),
    'idc': reservaf.idc.toString()
  });
  print(body);

  http.post(url,
      headers: {"Content-Type": "application/json"},
      body: body).then((http.Response response){
});
}

void UpdateReserva(int idrf, String what, int lotacao) async{
  var url = 'link ngrok' + idrf.toString() + "/" + what;
  var body = json.encode(lotacao);  //aqui ele tem value e eu queria por nome, pass mas n dá. como fazer?????

  http.put(url,
    headers: {"Content-Type" : "application/json"},
    body: body).then((http.Response response){

    });
}
}
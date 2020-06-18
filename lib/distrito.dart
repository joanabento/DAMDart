import 'package:flutter/material.dart';
import 'dart:typed_data';
import 'package:http/http.dart' as http;
import 'package:scoped_model/scoped_model.dart';
import 'dart:convert' show json, jsonDecode;

class Distrito extends Model{

int id;
String Country;
String CountryCode;
int Confirmed;
int Deaths;
int Recovered;
int Active;
DateTime Date;



final url = 'https://api.covid19api.com//live/country/Portugal';

Distrito({int id, String cidade, String cc, int confirmados, int mortes, int recuperados, int ativos, DateTime data}){
  this.id = id;
  this.Country = cidade;
  this.CountryCode = cc;
  this.Confirmed = confirmados;
  this.Deaths = mortes;
  this.Recovered = recuperados;
  this.Active = ativos;
  this.Date = data;

}

factory Distrito.fromJson(Map<String, dynamic> json){
  return Distrito(
    id: json['id'] as int,
    cidade: json['Country'] as String,
    cc: json['CountryCode'] as String,
    confirmados: json['Confirmed'] as int,
    mortes: json['Deaths'] as int,
    recuperados: json['Recovered'] as int,
    ativos: json['Active'] as int,
    //data: json['Date'] as DateTime
  );
}

Future<List<Distrito>> getDistritos() async{
  var url = this.url;

  http.Response resposta = await http.get(url, headers:{"Accept" : "application/json"});
  
  List lista = json.decode(resposta.body);

  List<Distrito> listaDistrito = new List<Distrito>();

  for(int i = 0; i<lista.length; i++)
    listaDistrito.add(Distrito.fromJson(lista[i]));
    return listaDistrito;


}

Future<int> eliminarDist(int id) async {
  print(id);
  var url = 'https://api.covid19api.com//live/country/Portugal' + id.toString();


  http.Response response = await http.delete(url,
  headers: {"Content-Type": "application/json"},
  );

  return response.statusCode;
  
}
}
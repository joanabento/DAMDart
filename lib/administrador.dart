import 'package:flutter/material.dart';
import 'dart:typed_data';
import 'package:http/http.dart' as http;
import 'package:scoped_model/scoped_model.dart';
import 'dart:convert' show json;

class Administrador extends Model
{
int idA;  //todas as variaveis em minuscula
String nomeShopping; 



Administrador({int id, String nameS})
{
  this.idA = id;
  this.nomeShopping = nameS;  

}

factory Administrador.fromJson(Map<String, dynamic> json)
{
  return Administrador(
    id: json['idA'] as int,
    nameS: json['NomeShopping'] as String,
   
  );
}

Future<List<Administrador>> getAdministradores() async{
  http.Response resposta = await http.get(Uri.encodeFull('http://7f8e25bcdcfe.ngrok.io/api/Administrador'), headers:{"Accept" : "application/json"});

  List lista = json.decode(resposta.body);

  List<Administrador> listaAdm = new List<Administrador>();

  for(int i = 0; i<lista.length; i++)
    listaAdm.add(Administrador.fromJson(lista[i]));
    return listaAdm;
}

Future<Administrador> getAdministradors(int id) async {
  http.Response response = await http.get(
    Uri.encodeFull("http://7f8e25bcdcfe.ngrok.io/api/Administrador" + id.toString()),
    headers: {
      "Accept":"application/json"
    }
  );

  Administrador administrador = Administrador.fromJson(json.decode(response.body));

  return administrador;
}

Future<int> createAdmin(Administrador administrador) async {
  var url = 'http://7f8e25bcdcfe.ngrok.io/api/Administrador';
  var body = json.encode(<String,Object>{
    'idA':administrador.idA,
    'NomeShopping':administrador.nomeShopping //mm nomes como no c#
    
  });
  print(body);

  http.Response response = await http.post(url,
      headers: {"Content-Type": "application/json"},
      body: body);
      return response.statusCode;
}

void UpdateAdmin(int idA, String what, String NS) async{
  var url = 'link ngrok' + idA.toString() + "/" + what;
  var body = json.encode(NS);  //aqui ele tem value e eu queria por nome, pass mas n dá. como fazer?????

  http.put(url,
    headers: {"Content-Type" : "application/json"},
    body: body).then((http.Response response){

    });
  
  
}
}
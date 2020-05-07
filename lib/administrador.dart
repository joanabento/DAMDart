import 'package:flutter/material.dart';
import 'dart:typed_data';
import 'package:http/http.dart' as http;
import 'package:scoped_model/scoped_model.dart';
import 'dart:convert' show json;

class Administrador extends Model
{
int idA;  //todas as variaveis em minuscula
String NomeShopping; 



Administrador({int id, String nameS})
{
  this.idA = id;
  this.NomeShopping = nameS;  

}

factory Administrador.fromJson(Map<String, dynamic> json)
{
  return Administrador(
    id: json['idA'] as int,
    nameS: json['NomeShopping'] as String,
   
  );
}

Future<List> getAdministradores() async{
  http.Response resposta = await http.get(Uri.encodeFull('link do ngrok'), headers:{"Accept" : "application/json"});

  List lista = json.decode(resposta.body);

  List<Administrador> listaAdm = new List<Administrador>();

  for(int i = 0; i<lista.length; i++)
    listaAdm.add(Administrador.fromJson(lista[i]));
    return listaAdm;
}

Future<Administrador> getAdministradors(int id) async {
  http.Response response = await http.get(
    Uri.encodeFull("link do ngrok" + id.toString()),
    headers: {
      "Accept":"application/json"
    }
  );

  Administrador administrador = Administrador.fromJson(json.decode(response.body));

  return administrador;
}

void CreateAdmin(Administrador administrador) async {
  var url = 'link ngrok';
  var body = json.encode(<String,String>{
    'idA':administrador.idA.toString(),
    'NomeShopping':administrador.NomeShopping //mm nomes como no c#
    
  });
  print(body);

  http.post(url,
      headers: {"Content-Type": "application/json"},
      body: body).then((http.Response response){

      

});
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
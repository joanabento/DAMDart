import 'package:flutter/material.dart';
import 'dart:typed_data';
import 'package:http/http.dart' as http;
import 'package:scoped_model/scoped_model.dart';
import 'dart:convert' show json;

class Cliente extends Model
{
int idC;  //todas as variaveis em minuscula


Cliente({int id})
{
  this.idC = id;

}

factory Cliente.fromJson(Map<String, dynamic> json)
{
  return Cliente(
    id: json['idC'] as int
    
  );
}

Future<List> getClientes() async{
  http.Response resposta = await http.get(Uri.encodeFull('link do ngrok'), headers:{"Accept" : "application/json"});

  List lista = json.decode(resposta.body);

  List<Cliente> listaC = new List<Cliente>();

  for(int i = 0; i<lista.length; i++)
    listaC.add(Cliente.fromJson(lista[i]));
    return listaC;
}

Future<Cliente> getClients(int id) async {
  http.Response response = await http.get(
    Uri.encodeFull("link do ngrok" + id.toString()),
    headers: {
      "Accept":"application/json"
    }
  );

  Cliente cliente = Cliente.fromJson(json.decode(response.body));

  return cliente;
}


}
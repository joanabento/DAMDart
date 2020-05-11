import 'dart:ffi';
import 'package:flutter/material.dart';
import 'dart:typed_data';
import 'package:http/http.dart' as http;
import 'package:scoped_model/scoped_model.dart';
import 'dart:convert' show json;


class Guardado extends Model{
  int idP;
  int idC;

  Guardado({int idp, int idc}){
    this.idC = idc;
    this.idP = idp;
  }

  factory Guardado.fromJson(Map<String,dynamic> json){
    return Guardado(
      idp: json['idP'] as int, 
      idc: json['idC'] as int
    );
  }

  Future<List> getGuardado() async{
    http.Response resposta = await http.get(Uri.encodeFull('link do ngrok'), headers:{ "Accept" : "application/json"});

    List lista = json.decode(resposta.body);

    List<Guardado> listae = new List<Guardado>();
    for (int i = 0; i< lista.length; i++){
      listae.add(Guardado.fromJson(lista[i]));
      return lista;
    }
  }

  Future<Guardado> getEventos(int id) async {
    http.Response resposta = await http.get(
    Uri.encodeFull("link do ngrok" + id.toString()),
    headers: {
      "Accept":"application/json"
    });
    Guardado g = Guardado.fromJson(json.decode(resposta.body));
    return g;
  }

}
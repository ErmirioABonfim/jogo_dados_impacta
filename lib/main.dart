import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(MaterialApp(
    home: Home(),
    debugShowCheckedModeBanner: false,
  ));
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  var _fraseGerada = "QUAL SERÁ?";
  var _numeroEscolhido = "Aguardando";
  final _controllerCampoEscolha = TextEditingController();
  var _numeroSortedoAux = "...";
  var _vitorias = 0;
  var _derrotas = 0;
  var _jogadas = 0;

  void _jogarDados() {
    // 0, 1

    setState(() {
      var _numeroSorteado = Random().nextInt(6);
      _numeroSortedoAux = _numeroSorteado.toString();
      _numeroEscolhido = _controllerCampoEscolha.text;
      _jogadas = _vitorias + _derrotas;
    });
    ;
    if (_numeroEscolhido == _numeroSortedoAux) {
      _fraseGerada = "Acertou";
      _vitorias = _vitorias +1;
      debugPrint(_vitorias.toString());
    } else {
      _fraseGerada = "Errou";
      _derrotas = _derrotas +1;
    }

    debugPrint(_numeroEscolhido);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        brightness: Brightness.dark,
        foregroundColor: Colors.black87,
        title: Text('Jogo de Dados'),
        backgroundColor: Colors.cyan,
      ),
      body: Center(
        child: Container(
          padding: EdgeInsets.all(18),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Row(
                children: [
                  Icon(Icons.check_box),
                  Text("Acertos "),
                  Text(_vitorias.toString()),

                  Text("        Erros "),
                  Text(_derrotas.toString()),

                  Text("           Jogadas"),
                  Text(_jogadas.toString()),
                ],
              ),
              Image.network(
                  "https://www.imagensanimadas.com/data/media/710/dado-imagem-animada-0100.gif"),
              Text(
                "JOGAR DADOS",
                textAlign: TextAlign.justify,
                style: TextStyle(
                    fontSize: 20,
                    fontStyle: FontStyle.italic,
                    color: Colors.red),
              ),
              Text(
                _fraseGerada,
                textAlign: TextAlign.justify,
                style: TextStyle(
                    fontSize: 20,
                    fontStyle: FontStyle.italic,
                    color: Colors.black),
              ),
              Column(children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(16),
                  child: TextField(
                    controller: _controllerCampoEscolha,
                    style: TextStyle(fontSize: 16),
                    decoration: InputDecoration(
                        icon: Icon(Icons.arrow_right_alt),
                        labelText: 'Escolha um número de 1 a 6',
                        hintText: '1..6'),
                    keyboardType: TextInputType.number,
                  ),
                )
              ]),
              Row(
                children: [
                  Text("                      ÚLTIMO RESULTADO: "),
                  Text(_numeroSortedoAux),
                ],
              ),
              RaisedButton(
                child: Text(
                  "LANÇAR SORTE",
                  style: TextStyle(
                      fontSize: 25,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                ),
                color: Colors.blue,
                onPressed: _jogarDados,
              )
            ],
          ),
        ),
      ),
    );
  }
}

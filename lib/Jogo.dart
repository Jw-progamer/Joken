import 'dart:math';

import 'package:flutter/material.dart';

class Jogo extends StatefulWidget {
  @override
  _JogoState createState() => _JogoState();
}

class _JogoState extends State<Jogo> {
  var _imagemApp = AssetImage("images/padrão");

  var _mensagem = "Escolha do Jogador";

  void _opcaoSelecionada(String escolhaUsuario) {
    var opcoes = ["papel", "pedra", "tesoura"];
    var jogadaCpu = Random().nextInt(opcoes.length);
    var escolhaCpu = opcoes[jogadaCpu];

    switch (escolhaCpu) {
      case "pedra":
        setState(() {
          _imagemApp = AssetImage("images/pedra.png");
        });
        break;
      case "tesoura":
        setState(() {
          _imagemApp = AssetImage("images/tesoura.png");
        });
        break;
      case "papel":
        setState(() {
          _imagemApp = AssetImage("images/papel.png");
        });
        break;
    }

    if ((escolhaUsuario == "pedra" && escolhaCpu == "tesoura") ||
        (escolhaUsuario == "tesoura" && escolhaCpu == "papel") ||
        (escolhaUsuario == "papel" && escolhaCpu == "pedra")) {
      setState(() {
        _mensagem = "Parabens!! Você ganhou";
      });
    } else if (escolhaUsuario == escolhaCpu) {
      setState(() {
        _mensagem = "Empatou";
      });
    } else {
      setState(() {
        _mensagem = "Você perdeu. E a porta da escuridão se abre para você";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Pedra, Papel, Tesoura"),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(top: 32, bottom: 16),
            child: Text(
              "Escolha do App",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
            ),
          ),
          Image(image: this._imagemApp),
          Padding(
            padding: EdgeInsets.only(top: 32, bottom: 16),
            child: Text(
              "$_mensagem",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              GestureDetector(
                  onTap: () {
                    _opcaoSelecionada("papel");
                  },
                  child: Image.asset("images/papel.png", height: 95)),
              GestureDetector(
                  onTap: () {
                    _opcaoSelecionada("pedra");
                  },
                  child: Image.asset("images/pedra.png", height: 95)),
              GestureDetector(
                  onTap: () {
                    _opcaoSelecionada("tesoura");
                  },
                  child: Image.asset("images/tesoura.png", height: 95)),
            ],
          )
        ],
      ),
    );
  }
}

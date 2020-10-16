import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Jogo extends StatefulWidget {
  @override
  _JogoState createState() => _JogoState();
}

class _JogoState extends State<Jogo> {

  var _imageApp = AssetImage("./lib/images/padrao.png");
  var _mensagem = "escolha uma opão abaixo";


  void _opcaoSelecioanda(String escolha){

    var opcoes = ["pedra","papel","tesoura"];
    var numero= Random().nextInt(3);
    var escolhaApp = opcoes[numero];

    switch (escolhaApp){
      case "pedra":
        setState(() {
          this._imageApp=AssetImage("./lib/images/pedra.png");
        });
        break;
      case "papel":
        setState(() {
          this._imageApp=AssetImage("./lib/images/papel.png");
        });
        break;

        case "tesoura":
        setState(() {
          this._imageApp=AssetImage("./lib/images/tesoura.png");
        });
        break;
    }

    if((escolha== "pedra" && escolhaApp == "tesoura") ||
       (escolha== "tesoura" && escolhaApp == "papel")||
        (escolha== "papel" && escolhaApp == "pedra")
    ) {

      setState(() {
        this._mensagem="Parabéns você ganhou";
      });
    }else if((escolhaApp== "tesoura" && escolha == "papel")||
        (escolhaApp== "tesoura" && escolha == "papel")||
        (escolhaApp== "tesoura" && escolha == "papel")){
      setState(() {
        this._mensagem="Você perdeu";
      });
}else{
      setState(() {
        this._mensagem="Empate";
      });

    }


}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Jokenpo"),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Padding(
          padding:EdgeInsets.only(top: 32, bottom: 16),
          child: Text(
            "Escolha do App",
             textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold
            ),
          ),

        ),
        Image(image: this._imageApp),
        Padding(
          padding:EdgeInsets.only(top: 32, bottom: 16),
          child: Text(
            "Escolha um opção abaixo",
            textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold
            ),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[

        GestureDetector(
          onTap: ()=> _opcaoSelecioanda("pedra"),
          child: Image.asset("./lib/images/pedra.png", height: 100,),
        ),
            GestureDetector(
              onTap: ()=> _opcaoSelecioanda("papel"),
              child: Image.asset("./lib/images/papel.png", height: 100,),
            ),
            GestureDetector(
              onTap: ()=> _opcaoSelecioanda("tesoura"),
              child: Image.asset("./lib/images/tesoura.png", height: 100,),
            ),

         //   Image.asset("./lib/images/pedra.png", height: 100,),
         //   Image.asset("./lib/images/papel.png", height: 100),
         //   Image.asset("./lib/images/tesoura.png", height: 100),
          ],
        ),
      ],
      ),
    );
  }
}

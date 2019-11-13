import 'dart:math';

import 'package:flutter/material.dart';

void main() => runApp(BasitCekilis());

class BasitCekilis extends StatefulWidget {
  @override
  _BasitCekilisState createState() => _BasitCekilisState();
}

class _BasitCekilisState extends State<BasitCekilis> {
  var metinController = TextEditingController();
  String asTalihli = " ";
  String yedekTalihli = " ";
  Random salla = Random();

  List<String> elemanlar = [];

  listeHazirla() {
    setState(() {
      elemanlar = metinController.text.split("\n");
      asTalihli = elemanlar[salla.nextInt(elemanlar.length)];
      elemanlar.remove("$asTalihli");
      yedekTalihli = elemanlar[salla.nextInt(elemanlar.length)];
    });
  }

  @override
  Widget build(BuildContext context) => MaterialApp(
        theme: ThemeData.dark(),
        title: "Basit Çekiliş",
        home: Scaffold(
          appBar: AppBar(
            title: Text("Basit Çekiliş"),
          ),
          body: Container(
            child: Column(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(
                      right: 20.0, left: 20.0, top: 20.0, bottom: 5.0),
                  child: TextField(
                    controller: metinController,
                    maxLines: 8,
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: "İsimleri Giriniz",
                        hintText:
                            "Her satıra bir isim yazınız.\nÖR:\nAli\nAhmet\nMehmet\nAyşe\nFatma"),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                      right: 20.0, left: 20.0, top: 5.0, bottom: 5.0),
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        child: RaisedButton(
                          child: Text("Kura Çek"),
                          color: Colors.blueGrey,
                          onPressed: () => listeHazirla(),
                        ),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                      right: 20.0, left: 20.0, top: 5.0, bottom: 5.0),
                  child: Container(
                    child: Column(
                      children: <Widget>[
                        Row(
                          children: <Widget>[
                            SelectableText("As Talihli : "),
                            SelectableText("$asTalihli"),
                          ],
                        ),
                        Row(
                          children: <Widget>[
                            SelectableText("Yedek Talihli : "),
                            SelectableText("$yedekTalihli"),
                          ],
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      );
}

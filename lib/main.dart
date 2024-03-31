import "package:flutter/material.dart";

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: "Chat Application",
      home: Iskele(),
    );
  }
}

class Iskele extends StatelessWidget {
  const Iskele({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Chat Application"),
      ),
      body: const AnaEkran(),
    );
  }
}

class AnaEkran extends StatefulWidget {
  const AnaEkran({super.key});

  @override
  State<AnaEkran> createState() => _AnaEkranState();
}

class _AnaEkranState extends State<AnaEkran> {
  TextEditingController t1 = TextEditingController();

  List mesajListesi = [];

  mesajlariEkle(String metin) {
    setState(() {
      mesajListesi.insert(0, metin);
      t1.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(40.20),
      child: Column(
        children: <Widget>[
          Flexible(
            child: ListView.builder(
              reverse: true,
              itemCount: mesajListesi.length,
              itemBuilder: (context, int indexNumarasi) =>
                  Text(mesajListesi[indexNumarasi]),
            ),
          ),
          Row(
            children: <Widget>[
              Flexible(
                child: TextField(
                  onSubmitted: mesajlariEkle,
                  controller: t1,
                ),
              ),
              ElevatedButton(
                  onPressed: mesajlariEkle(t1.text),
                  child: const Text("Mesaj Gönder")),
            ],
          ),
        ],
      ),
    );
  }
}

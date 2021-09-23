import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  //const MyApp({Key? key}) : super(key: key);

  final sugestaocontroller = TextEditingController();
  final melhoriacontroller = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.deepPurple,
            //leading: Image.asset('assets/Sorriso.png'),
            centerTitle: true,
            title: Text(
              "Helpers Delivery",
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.white, fontSize: 28),
            ),
          ),
          body: Form(
            key: _formKey,
            child: Container(
              padding: EdgeInsets.only(top: 15, left: 40, right: 40),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.bottomRight,
                  end: Alignment(0.0, 0.0),
                  colors: <Color>[Colors.deepPurpleAccent, Colors.deepPurple],
                ),
                image: DecorationImage(
                  image: AssetImage("assets/hero-circles2.png"),
                  fit: BoxFit.fill,
                ),
              ),
              child: ListView(children: <Widget>[
                SizedBox(
                  height: 220,
                  child: Image.asset("assets/ideias.png"),
                ),
                Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 8),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Expanded(
                            child: SingleChildScrollView(
                              child: ListTile(
                                title: Text(
                                  'Envie sua Sugestões',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontSize: 28.0,
                                    color: Colors.deepOrange,
                                  ),
                                ),
                                subtitle: Text(
                                  "Deixe sua sugestão anonimamente e nos ajude a melhorar cada vez mais!  \u{1F604}",
                                  //inserir icone === http://unicode.org/Public/emoji/1.0/emoji-data.txt
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontSize: 20.0,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                          )
                        ])),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 8),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Expanded(
                          child: Text(
                            'Sugestões :',
                            textAlign: TextAlign.left,
                            style: TextStyle(
                              fontSize: 20.0,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ]),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
                  child: TextFormField(
                    style: const TextStyle(color: Colors.white),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Campo Obrigatorio';
                      }
                      return null;
                    },
                    minLines: 2,
                    maxLines: 8,
                    controller: sugestaocontroller,
                    decoration: const InputDecoration(
                      enabledBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.black, width: 2)),
                      border: OutlineInputBorder(),
                      hintText: 'Escreva:',
                      hintStyle: TextStyle(fontSize: 16.0, color: Colors.white),
                    ),
                    keyboardType: TextInputType.text,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 8),
                  child: Text(
                    'Melhorias :',
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      fontSize: 18.0,
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
                  child: TextFormField(
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Campo Obrigatorio';
                      }
                      return null;
                    },
                    style: const TextStyle(color: Colors.white),
                    minLines: 5,
                    maxLines: 10,
                    controller: melhoriacontroller,
                    decoration: const InputDecoration(
                      enabledBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.black, width: 2)),
                      border: OutlineInputBorder(),
                      hintText: 'Escreva:',
                      hintStyle: TextStyle(fontSize: 16.0, color: Colors.white),
                    ),
                    keyboardType: TextInputType.text,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                      left: 20, top: 20, right: 20, bottom: 40),
                  child: Row(
                    children: <Widget>[
                      const Spacer(),
                      Expanded(
                        child: FloatingActionButton.extended(
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              print(sugestaocontroller.text);
                              print(melhoriacontroller.text);
                            }
                          },
                          label: const Text('Enviar'),
                          icon: const Icon(Icons.send),
                          backgroundColor: Colors.deepPurple,
                        ),
                      ),
                    ],
                  ),
                ),
              ]),
            ),
          ),
        ));
  }
}

Future sendSuggestion(title) {
    return http.post(
      Uri.parse('https://jsonplaceholder.typicode.com/albums'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'sugestao': title,
        'melhorias': title,
      }),
   );
}

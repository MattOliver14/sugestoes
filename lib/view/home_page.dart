import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:sugestao/model/sugestao_model.dart';
import 'package:sugestao/repositorio/repo.dart';
import 'package:sugestao/view/drawer_menu.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key key}) : super(key: key);


  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final sugestaocontroller = TextEditingController();
  final melhoriacontroller = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const NavDrawer(),
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        centerTitle: true,
        title: const Text(
          "Helpers Delivery",
          textAlign: TextAlign.center,
          style: TextStyle(color: Colors.white, fontSize: 26),
        ),
      ),
      body: Form(
        key: _formKey,
        child: Container(
          padding: const EdgeInsets.only(top: 2, left: 40, right: 40),
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment(0.0, 0.0),
              colors: <Color>[
                Colors.deepOrange,
                Colors.deepPurple,
              ],
            ),
            image: DecorationImage(
              image: AssetImage("assets/bolhas.png"),
              fit: BoxFit.fill,
            ),
          ),
          child: ListView(children: <Widget>[
            SizedBox(
              height: 220,
              child: Image.asset("assets/ideias.png"),
            ),
            Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 2),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
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
            const SizedBox(height: 30,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 2),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
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
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
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
                      borderSide: BorderSide(color: Colors.black, width: 2)),
                  border: OutlineInputBorder(),
                  hintText: 'Escrever: ',
                  hintStyle: TextStyle(fontSize: 16.0, color: Colors.white),
                ),
                keyboardType: TextInputType.text,
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 8),
              child: Text(
                'Melhorias : ',
                textAlign: TextAlign.left,
                style: TextStyle(
                  fontSize: 18.0,
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
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
                      borderSide: BorderSide(color: Colors.black, width: 2)),
                  border: OutlineInputBorder(),
                  hintText: 'Escrevar: ',
                  hintStyle: TextStyle(fontSize: 16.0, color: Colors.white),
                ),
                keyboardType: TextInputType.text,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  left: 20, top: 10, right: 20, bottom: 40),
              child: Row(
                children: <Widget>[
                  const Spacer(),
                  Expanded(
                    child: FloatingActionButton.extended(
                      onPressed: () {
                        if (_formKey.currentState.validate()) {
                          String sugestaotext = sugestaocontroller.text;
                          String melhoriatext = melhoriacontroller.text;
                          /////////                   ////////////////
                          sendSugestao(sugestaotext,melhoriatext);
                          //Navigator.push(context, MaterialPageRoute(builder: (context) => ProductionData()),
                        }
                      },
                      label: const Text(
                        'Enviar',
                        style: TextStyle(
                          fontSize: 18.0,
                          color: Colors.deepPurple,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      icon: const Icon(Icons.send, color: Colors.deepPurple),
                      backgroundColor: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
          ]),
        ),
      ),
    );
  }
}

Future<SugesModel>sendSugestao(sugestaotext, melhoriatext) async {

   Map<String, dynamic> body = {'sugestao': sugestaotext, 'melhoria': melhoriatext};

   final response = await http.post(Uri.parse('https://helpersbrasil.com.br/api_sugestao/add.php'),
       body: body,
       headers: {
         "Accept": "application/json",
         "Content-Type": "application/x-www-form-urlencoded"
       },
       encoding: Encoding.getByName("utf-8")
   );

   if (response.statusCode == 200) {
     // If the call to the server was successful, parse the JSON
     log(response.body);
     return SugesModel.fromJson(json.decode(response.body));
   } else {
     // If that call was not successful, throw an error.
     throw Exception('Failed to load post');
   }
 
}


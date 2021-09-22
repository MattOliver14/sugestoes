import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  //const MyApp({Key? key}) : super(key: key);

  final sugestaocontroller = TextEditingController();
  final melhoriacontroller = TextEditingController();

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
            body: Container(
                padding: EdgeInsets.only(top: 40, left: 40, right: 40),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.bottomRight,
                    end: Alignment(0.9, 0.1),
                    colors: <Color>[
                      Colors.white,
                      Colors.deepPurple
                    ],
                  ),
                  image: DecorationImage(
                    image: AssetImage("assets/bolhas.png"),
                    fit: BoxFit.fill,
                  ),
                ),
                child: ListView(children: <Widget>[
                  SizedBox(
                    height: 250,
                    child: Image.asset("assets/ideias.png"),
                  ),
                  Center(
                    child: Row(
                      children: [
                        const Expanded(
                          flex: 2,
                          child: SingleChildScrollView(
                            child: ListTile(
                              title: Text(
                                'Sugestões',
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
                        ),
                        Expanded(
                          flex: 3,
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: <Widget>[
                                Padding(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 20, vertical: 16),
                                  child: Text(
                                    'Deixe sua Sugestão',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      fontSize: 26.0,
                                      color: Colors.white,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 20, vertical: 16),
                                  child: TextFormField(
                                    minLines: 5,
                                    maxLines: 10,
                                    controller: sugestaocontroller,
                                    decoration: const InputDecoration(
                                      border: OutlineInputBorder(),
                                      hintText: 'Escreva:',
                                    ),
                                    keyboardType: TextInputType.text,
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 20, vertical: 16),
                                  child: Text(
                                    'Melhorias',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      fontSize: 26.0,
                                      color: Colors.white,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 20, vertical: 16),
                                  child: TextFormField(
                                    minLines: 5,
                                    maxLines: 10,
                                    controller: melhoriacontroller,
                                    decoration: const InputDecoration(
                                      border: OutlineInputBorder(),
                                      hintText: 'Escreva:',
                                    ),
                                    keyboardType: TextInputType.text,
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      left: 20, top: 20, right: 20, bottom: 40 ),
                                  child: Row(
                                    children: <Widget>[
                                      const Spacer(),
                                      Expanded(
                                        child: Center(
                                          child: FloatingActionButton.extended(

                                            onPressed: () {
                                              print(sugestaocontroller.text);
                                              print(melhoriacontroller.text);
                                            },
                                            label: const Text('Enviar'),
                                            icon: const Icon(Icons.send),
                                            backgroundColor: Colors.deepPurple,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ]),
                        ),
                      ],
                    ),
                  )
                ]))));
  }
}

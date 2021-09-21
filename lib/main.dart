import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
            appBar: AppBar(
              leading: Image.asset('assets/helpers.jfif'),
              // you can put any Widget
              title: const Text(
                "Helpers Delivery",
                style: TextStyle(color: Colors.white, fontSize: 28),
              ),
              flexibleSpace: Container(
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment(1.9, 0.1),
                    // 10% of the width, so there are ten blinds.
                    colors: <Color>[
                      Colors.deepPurple,
                      Colors.purple
                    ], // red to yellow/ repeats the gradient over the canvas
                  ),
                ),
              ),
            ),
            body: Container(
                padding: const EdgeInsets.only(top: 40, left: 40, right: 40),
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.bottomRight,
                    end: Alignment(0.9, 0.1),
                    colors: <Color>[
                      Colors.white,
                      Colors.deepPurple
                    ], // red to yellow// repeats the gradient over the canvas
                  ),
                  image: DecorationImage(
                    image: AssetImage("assets/bolhas.png"),
                    fit: BoxFit.cover,
                  ),
                ),
                child: ListView(children: <Widget>[
                  SizedBox(
                    height: 250,
                    child: Image.asset("assets/ideias.png"),
                  ),
                  Center(child: Row(
                    children: [
                      const Expanded(
                        flex: 2,
                        child: SingleChildScrollView(
                          child: ListTile(
                            title: Text('Sugestões',style: TextStyle(
                              fontSize: 30.0,
                              color: Colors.deepOrange,
                            ),),
                            subtitle:
                            Text(" Deixe sua sugestão anonimamente e nos ajude a melhorar cada vez mais!:D.", style: TextStyle(
                              fontSize: 22.0,
                              color: Colors.white,
                            ),),
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 3,
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              const Padding(
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
                                child: TextField(
                                  decoration: const InputDecoration(
                                    border: OutlineInputBorder(),
                                    hintText: 'Escreva:',
                                  ),
                                  keyboardType: TextInputType.number,
                                  inputFormatters: <TextInputFormatter>[
                                    WhitelistingTextInputFormatter.digitsOnly,
                                    LengthLimitingTextInputFormatter(6),
                                  ], // Only numbers can be entered
                                ),
                              ),
                              Row(
                                children: <Widget>[
                                  const Spacer(),
                                  Expanded(
                                    child: Center(
                                      child: FloatingActionButton.extended(
                                        onPressed: () {
                                          // Add your onPressed code here!
                                        },
                                        label: const Text('Enviar'),
                                        icon: const Icon(Icons.send),
                                        backgroundColor: Colors.deepPurple,
                                      ),
                                    ),
                                  ),
                                ],

                              )
                            ])),
                    ],
                  ),


                         )
                ]))));
  }
}


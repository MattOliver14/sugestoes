import 'package:flutter/material.dart';
import 'package:sugestao/view/drawer_menu.dart';

class Marketing extends StatefulWidget {
  const Marketing({Key key}) : super(key: key);

  @override
  _MarketingState createState() => _MarketingState();
}

class _MarketingState extends State<Marketing> {
  final sugestaomarketingcontroller = TextEditingController();
  final melhoriamarketingcontroller = TextEditingController();
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
            padding: const EdgeInsets.only(top: 0, left: 40, right: 40),
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment(0.0, 0.0),
                colors: <Color>[Color(0xFF2A508D), Color(0xFF203D6D)],
              ),
              image: DecorationImage(
                image: AssetImage("assets/bolhas.png"),
                repeat: ImageRepeat.repeat,
              ),
            ),
            child: SingleChildScrollView(
              child: Column(children: <Widget>[
                Image.asset("assets/marketing.png"),
                const Text(
                  'Que tal nos ajudar a ter ideias inovadoras?',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 28.0,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 2),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Expanded(
                          child: Text(
                            "Nos envie sua sugestão de marketing! \u{1F4A1}",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 20.0,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ]),
                ),
                const SizedBox(
                  height: 25,
                ),
                const Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Sugestões para o Marketing :",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 20.0,
                      color: Colors.white,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                TextFormField(
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Campo Obrigatorio';
                    }
                    return null;
                  },
                  minLines: 2,
                  maxLines: 8,
                  controller: sugestaomarketingcontroller,
                  style: const TextStyle(color: Colors.white),
                  decoration: const InputDecoration(
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white, width: 2)),
                    border: OutlineInputBorder(),
                    hintText: 'Escrever: ',
                    hintStyle: TextStyle(fontSize: 16.0, color: Colors.white),
                  ),
                ),
                const SizedBox(
                  height: 25,
                ),
                const Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Melhorias para o Marketing : ',
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      fontSize: 20.0,
                      color: Colors.white,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                TextFormField(
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Campo Obrigatorio';
                    }
                    return null;
                  },
                  minLines: 5,
                  maxLines: 10,
                  controller: melhoriamarketingcontroller,
                  style: const TextStyle(color: Colors.white),
                  decoration: const InputDecoration(
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white, width: 2)),
                    border: OutlineInputBorder(),
                    hintText: 'Escrevar: ',
                    hintStyle: TextStyle(fontSize: 16.0, color: Colors.white),
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
                          onPressed: () {},
                          label: const Text(
                            'Enviar',
                            style: TextStyle(
                              fontSize: 18.0,
                              color: Colors.deepPurple,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          icon:
                              const Icon(Icons.send, color: Colors.deepPurple),
                          backgroundColor: Colors.white70,
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

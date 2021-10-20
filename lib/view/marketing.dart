import 'package:flutter/material.dart';
import 'package:sugestao/view/drawer_menu.dart';

class Marketing extends StatefulWidget {
  const Marketing({Key key}) : super(key: key);


  @override
  _MarketingState createState() => _MarketingState();
}

class _MarketingState extends State<Marketing> {
  // final sugestaocontroller = TextEditingController();
  // final melhoriacontroller = TextEditingController();
  // final _formKey = GlobalKey<FormState>();

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
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.only(top: 0, left: 40, right: 40),
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment(0.0, 0.0),
              colors: <Color>[
                Color(0xFF7E57C2),
                Color(0xffd1c4e9)
              ],
            ),
            image: DecorationImage(
              image: AssetImage("assets/bolhas.png"),
              // fit: BoxFit.fill,
              repeat: ImageRepeat.repeat,
            ),
          ),
          child: Column(children: <Widget>[
         Image.asset("assets/marketing.png"),
            Row(
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
                                color: Colors.black,
                              ),
                            ),
                          ),
                        ),
                      )
                    ]),
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
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ]),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
              child: TextFormField(
                style: const TextStyle(color: Colors.black),
                decoration: const InputDecoration(
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black, width: 2)),
                  border: OutlineInputBorder(),
                  hintText: 'Escrever: ',
                  hintStyle: TextStyle(fontSize: 16.0, color: Colors.black),
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 8),
              child: Text(
                'Melhorias : ',
                textAlign: TextAlign.left,
                style: TextStyle(
                  fontSize: 18.0,
                  color: Colors.black,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
              child: TextFormField(
                style: const TextStyle(color: Colors.black),
                minLines: 5,
                maxLines: 10,
                decoration: const InputDecoration(
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black, width: 2)),
                  border: OutlineInputBorder(),
                  hintText: 'Escrevar: ',
                  hintStyle: TextStyle(fontSize: 16.0, color: Colors.black),
                ),
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
                      backgroundColor: Colors.black,
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

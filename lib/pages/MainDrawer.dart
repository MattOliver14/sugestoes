import 'package:flutter/material.dart';
import 'package:sugestao/pages/settings.dart';
import 'SugestoesPage.dart';
import 'drawer_body.dart';
import 'NotificationsPage.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePageSugestoes(),
    );
  }
}

class HomePageSugestoes extends StatefulWidget {
  @override
  _HomePageSugestoesState createState() => _HomePageSugestoesState();
}

class _HomePageSugestoesState extends State<HomePageSugestoes> {
  var currentPage = DrawerSections.home;

  @override
  Widget build(BuildContext context) {
    var container;
    if (currentPage == DrawerSections.home) {
      container = SugestoesPage();
    } else if (currentPage == DrawerSections.configuracoes) {
      container = SettingsPage();
    } else if (currentPage == DrawerSections.notificacao) {
      container = NotificationsPage();
    }
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        centerTitle: true,
        title: Text(
          "Helpers Delivery",
          textAlign: TextAlign.center,
          style: TextStyle(color: Colors.white, fontSize: 28),
        ),
      ),
      body: container,
      drawer: Drawer(
        child: SingleChildScrollView(
          child: Container(
            child: Column(
              children: [
                DrawerBody(),
                MyDrawerList(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget MyDrawerList() {
    return Container(
      padding: EdgeInsets.only(
        top: 15,
      ),
      child: Column(
        children: [
          menuItem(1, "Home de Sugestões", Icons.home_sharp,
              currentPage == DrawerSections.home ? true : false),
          menuItem(2, "Notícias Helpers Delivery.", Icons.fiber_new_sharp,
              currentPage == DrawerSections.notificacao ? true : false),
          Divider(),
          menuItem(3, "Configurações", Icons.tune_sharp,
              currentPage == DrawerSections.configuracoes ? true : false),
        ],
      ),
    );
  }

  Widget menuItem(int id, String title, IconData icon, bool selected) {
    return Material(
      color: selected ? Colors.deepPurple : Colors.transparent,
      child: InkWell(
        onTap: () {
          Navigator.pop(context);
          setState(() {
            if (id == 1) {
              currentPage = DrawerSections.home;
            }
            else if (id == 2) {
              currentPage = DrawerSections.notificacao;
            }
              else if (id == 3) {
              currentPage = DrawerSections.configuracoes;
            }
          });
        },
        child: Padding(
          padding: EdgeInsets.all(15.0),
          child: Row(
            children: [
              Expanded(
                child: Icon(
                  icon,
                  size: 20,
                  color: Colors.black,
                ),
              ),
              Expanded(
                flex: 3,
                child: Text(
                  title,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

enum DrawerSections {
  home,
  notificacao,
  configuracoes,


}

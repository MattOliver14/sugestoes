import 'package:flutter/material.dart';

class NavDrawer extends StatelessWidget {
  const NavDrawer({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(padding: const EdgeInsets.all(0.0), children: <Widget>[
        const UserAccountsDrawerHeader(
          accountName: Text(
            '',
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
          ),
          accountEmail: Text(
            '',
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
          ),
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("assets/logo.png"), fit: BoxFit.fitWidth)),
          ),
          ListView(
            padding: const EdgeInsets.all(0.0),
            children: <Widget>[
            ListTile(
              leading: const Icon(Icons.account_circle),
              title: const Text('Home'),
              onTap: () => {Navigator.of(context).pushNamed('/Perfil')},
            ),
            ListTile(
              leading: const Icon(Icons.cloud_upload_rounded),
              title: const Text('Sincronizar'),
              onTap: () => {},
            ),
            ListTile(
              leading: const Icon(Icons.message),
              title: const Text('Mensagem'),
              onTap: () => {Navigator.of(context).pushNamed('/DailyReport')},
            ),
            const ListTile(
              leading: Icon(Icons.settings),
              title:Text('Configuração'),
              //onTap: () => {Navigator.of(context).pushNamed('/TestDba')},
            ),
            ListTile(
              leading: const Icon(Icons.exit_to_app),
              title: const Text('Logout'),
              onTap: () => {
                Navigator.of(context).pushNamedAndRemoveUntil(
                    '/Login', (Route<dynamic> route) => false)
              },
            ),
          ],
        ),
      ]),
    );
  }
}

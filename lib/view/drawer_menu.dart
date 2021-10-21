import 'package:flutter/material.dart';
import 'package:sugestao/view/home_page.dart';

import 'marketing.dart';

class NavDrawer extends StatelessWidget {
  const NavDrawer({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: const EdgeInsets.all(0.0),
        children: <Widget>[
          const UserAccountsDrawerHeader(
            accountName: Text(
              'Janna da Silva',
              style:
                  TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
            ),
            accountEmail: Text(
              'Janna@Helpersbrasil.com.br',
              style: TextStyle(
                  color: Colors.deepPurple, fontWeight: FontWeight.bold),
            ),
            currentAccountPicture: CircleAvatar(
              backgroundImage: ExactAssetImage('assets/Janna.jpg'),
            ),
            decoration: BoxDecoration(
              color: Colors.white,
              // image: DecorationImage(
              //             image: AssetImage("assets/logo.png"), fit: BoxFit.fitWidth)),
            ),
          ),
          ListTile(
            leading: const Icon(Icons.account_circle, color: Colors.indigo),
            title: const Text('Home',
                style: TextStyle(color: Colors.black, fontSize: 17)),
            onTap: () => {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const HomePage()),
              )
            },
          ),
          ListTile(
            leading:
                const Icon(Icons.lightbulb,color: Colors.amberAccent),
            title: const Text('Ideias de Markerting',
                style: TextStyle(color: Colors.black, fontSize: 17)),
            onTap: () => {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const Marketing()),
              )
            },
          ),
          ListTile(
            leading:
                const Icon(Icons.cloud_upload_rounded, color: Colors.blueGrey),
            title: const Text('Sincronizar',
                style: TextStyle(color: Colors.black, fontSize: 17)),
            onTap: () => {},
          ),
          ListTile(
            leading: const Icon(Icons.message, color: Colors.green),
            title: const Text(
              'Mensagem',
              style: TextStyle(color: Colors.black, fontSize: 17),
            ),
            onTap: () => {Navigator.of(context).pushNamed('/DailyReport')},
          ),
          const ListTile(
            leading: Icon(Icons.settings, color: Colors.black),
            title: Text(
              'Configuração',
              style: TextStyle(color: Colors.black, fontSize: 17),
            ),
            //onTap: () => {Navigator.of(context).pushNamed('/TestDba')},
          ),
          ListTile(
            leading: const Icon(Icons.exit_to_app, color: Colors.red),
            title: const Text(
              'Logout',
              style: TextStyle(color: Colors.black, fontSize: 17),
            ),
            onTap: () => {
              Navigator.of(context).pushNamedAndRemoveUntil(
                  '/Login', (Route<dynamic> route) => false)
            },
          ),
        ],
      ),
    );
  }
}

//       Drawer(
//       child: ListView(padding: const EdgeInsets.all(0.0), children: <Widget>[
//         const UserAccountsDrawerHeader(
//           accountName: Text(
//             '',
//             style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
//           ),
//           accountEmail: Text(
//             '',
//             style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
//           ),
//           decoration: BoxDecoration(
//               image: DecorationImage(
//                   image: AssetImage("assets/logo.png"), fit: BoxFit.fitWidth)),
//           ),
//           ListView(
//             padding: const EdgeInsets.all(0.0),
//             children: <Widget>[
//             ListTile(
//               leading: const Icon(Icons.account_circle),
//               title: const Text('Home'),
//               onTap: () => {Navigator.of(context).pushNamed('/Perfil')},
//             ),
//             ListTile(
//               leading: const Icon(Icons.cloud_upload_rounded),
//               title: const Text('Sincronizar'),
//               onTap: () => {},
//             ),
//             ListTile(
//               leading: const Icon(Icons.message),
//               title: const Text('Mensagem'),
//               onTap: () => {Navigator.of(context).pushNamed('/DailyReport')},
//             ),
//             const ListTile(
//               leading: Icon(Icons.settings),
//               title:Text('Configuração'),
//               //onTap: () => {Navigator.of(context).pushNamed('/TestDba')},
//             ),
//             ListTile(
//               leading: const Icon(Icons.exit_to_app),
//               title: const Text('Logout'),
//               onTap: () => {
//                 Navigator.of(context).pushNamedAndRemoveUntil(
//                     '/Login', (Route<dynamic> route) => false)
//               },
//             ),
//           ],
//         ),
//       ]),
//     );
//   }
// }

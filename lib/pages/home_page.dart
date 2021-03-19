import 'package:estudos/models/time.dart';
import 'package:estudos/pages/home_controller.dart';
import 'package:flutter/material.dart';
import 'home_controller.dart';
import 'time_page.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var controller;

  @override
  void initState() {
    super.initState();
    controller = HomeController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Brasileirão'),
      ),
      body: ListView.separated(
          padding: EdgeInsets.all(16),
          itemBuilder: (BuildContext context, int time) {
            final List<Time> tabela = controller.tabela;
            return ListTile(
              leading: Image.network(tabela[time].brasao),
              title: Text(tabela[time].nome),
              trailing: Text(
                tabela[time].pontos.toString(),
              ),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => TimePage(
                        key: Key(tabela[time].nome),
                        time: tabela[time],
                      ),
                    ));
              },
            );
          },
          separatorBuilder: (_, __) => Divider(),
          itemCount: controller.tabela.length),
    );
  }
}

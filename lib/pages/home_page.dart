import 'package:estudos/pages/home_controller.dart';
import 'package:flutter/material.dart';
import 'home_controller.dart';

class HomePage extends StatelessWidget {
  final HomeController controller = HomeController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Brasileirão'),
        backgroundColor: Colors.red,
      ),
      body: ListView.separated(
          padding: EdgeInsets.all(16),
          itemBuilder: (BuildContext context, int i) {
            return ListTile(
              leading: Image.network(controller.tabela[i].brasao),
              title: Text(controller.tabela[i].nome),
              trailing: Text(
                controller.tabela[i].pontos.toString(),
              ),
            );
          },
          separatorBuilder: (_, __) => Divider(),
          itemCount: controller.tabela.length),
    );
  }
}

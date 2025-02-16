// ignore_for_file: non_constant_identifier_names, no_leading_underscores_for_local_identifiers, camel_case_types


import 'package:flutter/material.dart';
import 'package:myapp/telas/tela_planeta.dart';

import 'modelos/planeta.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Planetas',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'App - Planetas',),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({
    super.key,
    required this.title,
  });

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

abstract class _MyHomePageState extends State<MyHomePage> {
  final ControlePlaneta _controlePlaneta = ControlePlaneta();
List<Planeta> _planetas = [];

@override
void initState() {
  super.initState();
  lerPlanetas();
}

Future<void> -lerPlanetas () async {
 final resultado = await _controlePlaneta.lerPlaneta();
 setState(() {
   _planetas = resultado;
 });

 void _incluirPlaneta(BuildContext context){
   Navigator.push(
    context,
    MaterialPageRoute(
      builder: (context) => TelaPlaneta(
        isIncluir: true,
        planeta: Planeta.vazio(),
        onFinalizado: () {
          lerPlanetas();
        },
      )),
   );
  }
}
void _alterarPlaneta(BuildContext context, Planeta planeta	){
   Navigator.push(
    context,
    MaterialPageRoute(
      builder: (context) => TelaPlaneta(
        isIncluir: false,
       planeta: planeta, 
        onFinalizado: () {
          lerPlanetas();
        },
      )),
   );
  }
}

void _excluirPlaneta(int? id, dynamic _controlePlaneta) async {
  await _controlePlaneta.excluirPlaneta(id);
 // _LerPlanetas();
  }
}

  @override
  Widget build(BuildContext context, dynamic widget, dynamic _planetas) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body:ListView.builder(
                itemCount: _planetas.length,
                itemBuilder: (context, index) {
                  final _ = _planetas[index];
                  return ListTile(
                    title: Text(_planetas.nome),
                    subtitle: Text(_planetas.apelido!),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        IconButton(
                          icon: const Icon(Icons.edit),
                          onPressed: () => _alterarPlaneta(context, planeta),
                    )
                     IconButton(
                      icon: const Icon(Icons.delete),
                      onPressed: () => _excluirPlaneta(planeta.id!),
                    ),
                  );
                },
              ),
          
      floatingActionButton: FloatingActionButton(
        onPressed: () {
           _incluirPlaneta(context);
        }
        child: const Icon(Icons.add),
      ),
    );
  }
  
  class _incluirPlaneta {
  _incluirPlaneta(BuildContext context);
  }
  
  Widget _alterarPlaneta(BuildContext context, Type planeta) {
  }
  
  Widget _excluirPlaneta(param0) {
  }
  
  mixin planeta {
  }




class _pLaneta {
  static var nome;
}

class _planeta {
  static var tamanho;
  
  static var distancia;
}
}

extension on List<Planeta> {
  String get nome => null;
  
  get distancia => null;
  
  get apelido => null;
}
// ignore_for_file: prefer_typing_uninitialized_variables

import 'dart:ffi';
import package:path;/path.dart';
import 'package:sqflite/sqflite.dart';

class ControlePlaneta {
  static Database? _bd;

 Future<Database> get bd async {
  if (_bd == null) return _bd!;
  _bd = await _initBD('planetas.db') as Database?;
  return _bd!;
}
 Future<Datebase>_initBD(String localArquivo) async {
  final caminhoBD = await getDatebasesPath();
  final caminho = join(caminhoBD, localArquivo);
  return await openDatebase(
    caminho,
    version: 1,
    onCreate: _criarBD,
  );
}
Future<void> _criarBD(Database bd, int versao) async {
const sql = '''
CREATE TABLE planetas (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  nome TEXT NOT NULL,
  tamanho REAL NOT NULL,
  distancia REAL NOT NULL,
  apelido TEXT
)
''';
await bd.execute(sql);
}
Future<list<Planeta>> lerPlanetas() async {
final bd = await ControlePlaneta().bd;
final lista = await bd.query('planetas');
return lista.map((item) => Planeta.fromMap(item)).toList();
}
Future<int> inserirPlaneta(Planeta planeta) async {
final bd = await ControlePlaneta().bd;
return await bd.insert('planetas', planeta.toMap());
}
Future<int> alterarPlaneta(Planeta planeta) async {
final bd = await ControlePlaneta().bd;
return await bd.update(
  'planetas',
  planeta.toMap(),
  where: 'id = ?',
  whereArgs: [planeta.id],
);
}
Future<int> excluirPlaneta(int id) async {
final bd = await ControlePlaneta().bd;
return await bd.delete('planetas', where: 'id = ?', whereArgs: [id]);
}


mixin Planeta {
  toMap() {}
}

join(caminhoBD, String localArquivo) {
}

mixin Datebase {
}

openDatebase(caminho, {required int version, required Future<void> Function(Database bd, int versao) onCreate}) {
}

mixin Database {
  insert(String s, map) {}
}

getDatebasesPath() {
}

extension on Function() {
  Future<dynamic> fromMap(e) {}
}
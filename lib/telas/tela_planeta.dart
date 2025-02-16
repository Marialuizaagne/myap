

import 'package:flutter/material.dart';
import 'package:myapp/modelos/planeta.dart' show Planeta;

class TelaPlaneta extends StatefulWidget {
  final bool isIncluir;
  final Planeta planeta;
  final Function() onFinalizado;

  const TelaPlaneta({
    super.key, 
    required this.isIncluir,
    required this.planeta,
    required this.onFinalizado,
    });

  @override
  State<TelaPlaneta> createState() => _TelaPlanetaState();
}

class _TelaPlanetaState extends State<TelaPlaneta> {
final _formKey = GlobalKey<FormState();

final TextEditingController _nameController = TextEditingController();
final TextEditingController _tamanhoController = TextEditingController();
final TextEditingController _distanciaController = TextEditingController();
final TextEditingController _apelidoController = TextEditingController();

 ControlePlaneta _controlePlaneta = ControlePlaneta();

late Planeta _planeta;

  get groupId => null;

  @override
  void initState() {
_planeta = widget.planeta;
_nameController.text = _planeta.nome;
_tamanhoController.text = _planeta.tamanho.toString();
_distanciaController.text = _planeta.distancia.toString();
_apelidoController.text = _planeta.apelido ?? '';
    super.initState();
  }
  @override
  void dispose() {
    _nameController.dispose();
    _tamanhoController.dispose();
    _distanciaController.dispose();
    _apelidoController.dispose();
    super.dispose();
  }

Future<void> _inserirPlaneta() async {
await _controlePlaneta.inserirPlaneta(_planeta);
}
Future<void> _alterarPlaneta() async {
await _controlePlaneta.alterarPlaneta(_planeta);
}

  @override
  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      // Dados validados com sucesso
      _formKey.currentState!.save();
      if (widget.isIncluir) {
        _inserirPlaneta();
      } else {
        _alterarPlaneta();
      }
      // Faça algo com os dados do planeta
      ScaffoldMessenger.of(context).showSnackBar(
       SnackBar(
        content: Text('Dados do planeta foram ${widget.isIncluir ?'incluir': 'alterado'} salvos com sucesso!'),),
      );

      _inserirPlaneta();
      Navigator.of(context).pop();
      widget.onFinalizado();
    }
    }
  @override
  Widget build(BuildContext context,  autovalidateMode) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Cadastrar Planetas')
        ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 40.0, vertical: 20.0),
        child: Form(
        key:_formKey, 
        child: SingleChildScrollView(child: 
         Column(
          children: [
            TextFormField(
              controller: _nameController,
              decoration: InputDecoration(
                labelText: 'Nome',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(
                    10.0), // define os cantos arredondados
                ),
               ),
            )
               autovalidateMode: AutovalidateMode.onUserInteraction,
              validator: (value) {
                if (value == null || value.isEmpty || value.length < 3) {
                  return 'Por favor, informe o nome do planeta (3 ou mais caracteres)';
                }
                return null;
              },
              onSaved: (value) {
                _planeta.nome = value!;
              },
                groupId: TextFormField(
              controller: _tamanhoController,
              decoration: 
                  const InputDecoration(labelText: 'Tamanho (em km)' ),
                  keyboardType: TextInputType.number,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Por favor, informe o tamanho do planeta';
                    }
                    if (double.tryParse(value) == null) {
                      return 'Por favor, informe um valor numérico válido';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    _planeta.tamanho = double.parse(value!);
                  },
                groupId: TextFormField(
                    controller: _distanciaController,
                    decoration: 
                    const InputDecoration(labelText: 'Distância (em km)'
// Suggested code may be subject to a license. Learn more: ~LicenseLog:779478876.
                    ),)
                  
                    keyboardType: TextInputType.number,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Por favor, informe a distância do planeta';
                      }
                      if (double.tryParse(value) == null) {
                        return 'Por favor, informe um valor numérico válido';
                      }
                      return null;
                    },
                    onSaved: (value) {
                      _planeta.distancia = double.parse(value!);
                    },
                    groupId: TextFormField(
                      controller: _apelidoController,
                      decoration: const InputDecoration(labelText: 'Apelido'
                      ), 
                      onSaved: (value) {
                        _planeta.apelido = value;
                      },
                      groupId: 
                const SizedBox(
                  height: 20.0
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                     ElevatedButton(
                      onPressed:() => Navigator.of(context).pop(),
                      child: const Text('Cancelar')
                      ),
                      ElevatedButton(
                  onPressed: _submitForm, //_submitForm
                  child: const Text('Salvar')
                  ,)  ,]
                  ,)  
                ,)
            ),
            ],
          ),
        ),
       ),);
  }
}

extension on ControlePlaneta {
  inserirPlaneta(Planeta planeta) {}
}

class ControlePlaneta {
  lerPlaneta() {}
  
  alterarPlaneta(Planeta planeta) {}
}

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../viewmodels/musica_viewmodel.dart';

class AdicionarMusicaScreen extends StatelessWidget {
  final TextEditingController _tituloController = TextEditingController();
  final TextEditingController _descricaoController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final viewModel = Provider.of<MusicaViewModel>(context, listen: false);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Adicionar Música'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
          tooltip: '', // Remove o tooltip "Back"
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _tituloController,
              decoration: const InputDecoration(labelText: 'Título'),
            ),
            TextField(
              controller: _descricaoController,
              decoration: const InputDecoration(labelText: 'Descrição'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                if (_tituloController.text.isEmpty || _descricaoController.text.isEmpty) {
                  // Exibir mensagem de erro se algum campo estiver vazio
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Preencha todos os campos para salvar!'),
                      backgroundColor: Colors.red,
                    ),
                  );
                } else {
                  viewModel.adicionarMusica(
                    _tituloController.text,
                    _descricaoController.text,
                  );
                  Navigator.pop(context);

                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Música adicionada com sucesso!'),
                      backgroundColor: Colors.green,
                    ),
                  );
                }
              },
              child: const Text('Salvar'),
            ),
          ],
        ),
      ),
    );
  }
}

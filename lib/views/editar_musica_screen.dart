import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/musica.dart';
import '../viewmodels/musica_viewmodel.dart';

class EditarMusicaScreen extends StatelessWidget {
  final Musica musica;
  final TextEditingController _tituloController = TextEditingController();
  final TextEditingController _descricaoController = TextEditingController();

  EditarMusicaScreen({required this.musica}) {
    _tituloController.text = musica.titulo;
    _descricaoController.text = musica.descricao;
  }

  @override
  Widget build(BuildContext context) {
    final viewModel = Provider.of<MusicaViewModel>(context, listen: false);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Editar Música'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
          tooltip: null,
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
                      content: Text('Preencha todos os campos para salvar as alterações!'),
                      backgroundColor: Colors.red,
                    ),
                  );
                } else {
                  viewModel.atualizarMusica(
                    musica.id,
                    _tituloController.text,
                    _descricaoController.text,
                  );
                  Navigator.pop(context);

                  // Exibir SnackBar de sucesso
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Música atualizada com sucesso!'),
                      backgroundColor: Colors.green,
                    ),
                  );
                }
              },
              child: const Text('Salvar Alterações'),
            ),
          ],
        ),
      ),
    );
  }
}

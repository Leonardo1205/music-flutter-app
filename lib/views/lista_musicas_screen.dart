import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../viewmodels/musica_viewmodel.dart';
import 'adicionar_musica_screen.dart';
import 'editar_musica_screen.dart';

class ListaMusicasScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final viewModel = Provider.of<MusicaViewModel>(context);

    return Scaffold(
      appBar: AppBar(title: const Text('Catálogo de Músicas Favoritas')),
      body: ListView.builder(
        itemCount: viewModel.musicas.length,
        itemBuilder: (context, index) {
          final musica = viewModel.musicas[index];
          return ListTile(
            title: Text(musica.titulo),
            subtitle: Text(musica.descricao),
            trailing: IconButton(
              icon: const Icon(Icons.delete, color: Colors.red),
              tooltip: 'Excluir música',
              onPressed: () {
                viewModel.removerMusica(musica.id);
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Música removida com sucesso!')),
                );
              },
            ),
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => EditarMusicaScreen(musica: musica),
              ),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => AdicionarMusicaScreen()),
        ),
        child: const Icon(Icons.add),
      ),
    );
  }
}


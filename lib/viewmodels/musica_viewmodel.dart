import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';
import '../models/musica.dart';

class MusicaViewModel extends ChangeNotifier {
  final List<Musica> _musicas = [];
  final Uuid _uuid = Uuid();

  List<Musica> get musicas => List.unmodifiable(_musicas);

  void adicionarMusica(String titulo, String descricao) {
    final novaMusica = Musica(
      id: _uuid.v4(),
      titulo: titulo,
      descricao: descricao,
    );
    _musicas.add(novaMusica);
    notifyListeners();
  }

  void atualizarMusica(String id, String titulo, String descricao) {
    final index = _musicas.indexWhere((musica) => musica.id == id);
    if (index != -1) {
      _musicas[index] = Musica(id: id, titulo: titulo, descricao: descricao);
      notifyListeners();
    }
  }

  void removerMusica(String id) {
    _musicas.removeWhere((musica) => musica.id == id);
    notifyListeners();
  }
}

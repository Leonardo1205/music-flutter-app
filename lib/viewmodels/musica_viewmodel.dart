import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import '../models/musica.dart';

class MusicaViewModel extends ChangeNotifier {
  final List<Musica> _musicas = [];
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  List<Musica> get musicas => List.unmodifiable(_musicas);

  MusicaViewModel() {
    carregarMusicas();
  }

  Future<void> carregarMusicas() async {
    final snapshot = await _firestore.collection('musicas').get();
    _musicas.clear();
    for (var doc in snapshot.docs) {
      _musicas.add(
        Musica(
          id: doc.id,
          titulo: doc['titulo'],
          descricao: doc['descricao'],
        ),
      );
    }
    notifyListeners();
  }

  Future<void> adicionarMusica(String titulo, String descricao) async {
    final doc = await _firestore.collection('musicas').add({
      'titulo': titulo,
      'descricao': descricao,
    });
    _musicas.add(Musica(id: doc.id, titulo: titulo, descricao: descricao));
    notifyListeners();
  }

  Future<void> atualizarMusica(String id, String titulo, String descricao) async {
    await _firestore.collection('musicas').doc(id).update({
      'titulo': titulo,
      'descricao': descricao,
    });
    final index = _musicas.indexWhere((musica) => musica.id == id);
    if (index != -1) {
      _musicas[index] = Musica(id: id, titulo: titulo, descricao: descricao);
      notifyListeners();
    }
  }

  Future<void> removerMusica(String id) async {
    await _firestore.collection('musicas').doc(id).delete();
    _musicas.removeWhere((musica) => musica.id == id);
    notifyListeners();
  }
}

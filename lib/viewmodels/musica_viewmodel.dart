import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import '../models/musica.dart';

class MusicaViewModel extends ChangeNotifier {
  final List<Musica> _musicas = [];
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  List<Musica> get musicas => List.unmodifiable(_musicas);

  // Construtor que chama o carregamento das músicas ao inicializar a classe
  MusicaViewModel() {
    carregarMusicas();
  }

  // Carrega as músicas do Firestore e as adiciona à lista local
  Future<void> carregarMusicas() async {
    // Obtém todos os documentos da coleção 'musicas' no Firestore
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
    // Notifica os ouvintes que os dados foram atualizados
    notifyListeners();
  }

  // Adiciona uma nova música ao Firestore e atualiza a lista local
  Future<void> adicionarMusica(String titulo, String descricao) async {
    final doc = await _firestore.collection('musicas').add({
      'titulo': titulo,
      'descricao': descricao,
    });
    // Adiciona a nova música à lista local com o ID gerado pelo Firestore
    _musicas.add(Musica(id: doc.id, titulo: titulo, descricao: descricao));
    notifyListeners();
  }

  // Atualiza uma música existente no Firestore e reflete a mudança na lista local
  Future<void> atualizarMusica(String id, String titulo, String descricao) async {
    await _firestore.collection('musicas').doc(id).update({
      'titulo': titulo,
      'descricao': descricao,
    });
    // Busca o índice da música na lista local e a atualiza
    final index = _musicas.indexWhere((musica) => musica.id == id);
    if (index != -1) {
      _musicas[index] = Musica(id: id, titulo: titulo, descricao: descricao);
      notifyListeners();
    }
  }

  // Remove uma música do Firestore e da lista local
  Future<void> removerMusica(String id) async {
    await _firestore.collection('musicas').doc(id).delete();
    // Remove a música da lista local pelo ID
    _musicas.removeWhere((musica) => musica.id == id);
    notifyListeners();
  }
}

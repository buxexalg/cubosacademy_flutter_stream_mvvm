import 'dart:async';

import 'package:streamexample/home_model.dart';

class HomeViewModel {
  HomeModel _model = HomeModel();

  Future<List<int>> get lista => _model.lista;

  StreamController<List<int>> streamLista = StreamController();

  void loadLista() {
    _model.loadLista();
    _model.lista.then((value) {
      streamLista.add(value);
    });
  }
}

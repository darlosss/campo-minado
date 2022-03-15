import 'package:campo_minado/app/store/settings_tabuleiro/settings_tabuleiro.dart';

class Caixa {
  bool isBomba;
  int position = 0;
  int bombasEmTorno = 0;

  Caixa(this._settingsTabuleiro, {required this.isBomba});

  SettingsTabuleiro _settingsTabuleiro;

  set setPosition(int value) => position = value;

  void incrementBombas() => bombasEmTorno++;

  List<int> get coordenadas {
    int y = position ~/ _settingsTabuleiro.qtdRow;
    int x = position % _settingsTabuleiro.qtdRow;
    return [y, x];
  }

  int topLeft(List<Caixa> caixas) {
    var y = coordenadas[0] - 1;
    var x = coordenadas[1] - 1;
    return _settingsTabuleiro.coordenadaToIndex([y, x]);
  }

  int topCenter(List<Caixa> caixas) {
    var y = coordenadas[0] - 1;
    var x = coordenadas[1];
    return _settingsTabuleiro.coordenadaToIndex([y, x]);
  }

  int topRight(List<Caixa> caixas) {
    var y = coordenadas[0] - 1;
    var x = coordenadas[1] + 1;
    return _settingsTabuleiro.coordenadaToIndex([y, x]);
  }

  int left(List<Caixa> caixas) {
    var y = coordenadas[0];
    var x = coordenadas[1] - 1;
    return _settingsTabuleiro.coordenadaToIndex([y, x]);
  }

  int right(List<Caixa> caixas) {
    var y = coordenadas[0];
    var x = coordenadas[1] + 1;
    return _settingsTabuleiro.coordenadaToIndex([y, x]);
  }

  int bottomLeft(List<Caixa> caixas) {
    var y = coordenadas[0] + 1;
    var x = coordenadas[1] - 1;
    return _settingsTabuleiro.coordenadaToIndex([y, x]);
  }

  int bottomCenter(List<Caixa> caixas) {
    var y = coordenadas[0] + 1;
    var x = coordenadas[1];
    return _settingsTabuleiro.coordenadaToIndex([y, x]);
  }

  int bottomRight(List<Caixa> caixas) {
    var y = coordenadas[0] + 1;
    var x = coordenadas[1] + 1;
    return _settingsTabuleiro.coordenadaToIndex([y, x]);
  }
}

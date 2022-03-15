import 'dart:math';

import 'package:campo_minado/app/store/settings_tabuleiro/settings_tabuleiro.dart';
import 'package:mobx/mobx.dart';

import '../../bloc/caixa.dart';
part 'tabuleiro.g.dart';

class Tabuleiro = _TabuleiroBase with _$Tabuleiro;

abstract class _TabuleiroBase with Store {
  @observable
  var settingsTabuleiro = SettingsTabuleiro.zero;

  @observable
  var caixas = ObservableList<Caixa>();

  @action
  void _setSettings(SettingsTabuleiro value) => settingsTabuleiro = value;

  @action
  setCaixas(int qtd, int qtdBombas) {
    _setSettings(SettingsTabuleiro(tamanhoTabuleiro: qtd, qtdColumn: 5));
    var res = qtd - qtdBombas;

    var bombas = List.generate(
        qtdBombas, (index) => Caixa(settingsTabuleiro, isBomba: true));

    var outras =
        List.generate(res, (index) => Caixa(settingsTabuleiro, isBomba: false));

    caixas = (bombas + outras).asObservable();

    caixas.shuffle();
    for (var index = 0; index < caixas.length; index++) {
      caixas[index].setPosition = index;
    }
    searchInList();
  }

  @action
  void searchInList() {
    _inTopLeft();
    _inTopCenter();
    _inTopRight();
    _inLeft();
    _inRight();
    _inBottomLeft();
    _inBottomCenter();
    _inBottomRight();
  }

  void _inTopLeft() {
    for (var c in caixas) {
      var coordenadas = c.coordenadas;
      if (coordenadas[1] == 0 || coordenadas[0] == 0 || c.isBomba) continue;

      if (caixas[c.topLeft(caixas)].isBomba) {
        c.incrementBombas();
      }
    }
  }

  void _inTopCenter() {
    for (var c in caixas) {
      var coordenadas = c.coordenadas;
      if (coordenadas[0] == 0 || c.isBomba) continue;
      if (caixas[c.topCenter(caixas)].isBomba) {
        c.incrementBombas();
      }
    }
  }

  void _inTopRight() {
    for (var c in caixas) {
      var coordenadas = c.coordenadas;
      if (coordenadas[0] == 0 ||
          coordenadas[1] == settingsTabuleiro.qtdRow ||
          c.isBomba) continue;

      if (caixas[c.topRight(caixas)].isBomba) {
        c.incrementBombas();
      }
    }
  }

  void _inLeft() {
    for (var c in caixas) {
      var coordenadas = c.coordenadas;
      if (coordenadas[1] == 0 || c.isBomba) continue;

      if (caixas[c.left(caixas)].isBomba) {
        c.incrementBombas();
      }
    }
  }

  void _inRight() {
    for (var c in caixas) {
      var coordenadas = c.coordenadas;
      if (coordenadas[1] == settingsTabuleiro.qtdRow - 1 || c.isBomba) continue;

      if (caixas[c.right(caixas)].isBomba) {
        c.incrementBombas();
      }
    }
  }

  void _inBottomLeft() {
    for (var c in caixas) {
      var coordenadas = c.coordenadas;
      if (coordenadas[0] == settingsTabuleiro.qtdColumn - 1 ||
          coordenadas[1] == 0 ||
          c.isBomba) continue;
      if (caixas[c.bottomLeft(caixas)].isBomba) {
        c.incrementBombas();
      }
    }
  }

  void _inBottomCenter() {
    for (var c in caixas) {
      var coordenadas = c.coordenadas;
      if (coordenadas[0] == settingsTabuleiro.qtdColumn - 1 || c.isBomba) {
        continue;
      }
      if (caixas[c.bottomCenter(caixas)].isBomba) {
        c.incrementBombas();
      }
    }
  }

  void _inBottomRight() {
    for (var c in caixas) {
      var coordenadas = c.coordenadas;
      if (coordenadas[0] == settingsTabuleiro.qtdColumn - 1 ||
          coordenadas[1] == settingsTabuleiro.qtdRow - 1 ||
          c.isBomba) {
        continue;
      }
      if (caixas[c.bottomRight(caixas)].isBomba) {
        c.incrementBombas();
      }
    }
  }
}

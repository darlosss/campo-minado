// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tabuleiro.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$Tabuleiro on _TabuleiroBase, Store {
  final _$settingsTabuleiroAtom =
      Atom(name: '_TabuleiroBase.settingsTabuleiro');

  @override
  SettingsTabuleiro get settingsTabuleiro {
    _$settingsTabuleiroAtom.reportRead();
    return super.settingsTabuleiro;
  }

  @override
  set settingsTabuleiro(SettingsTabuleiro value) {
    _$settingsTabuleiroAtom.reportWrite(value, super.settingsTabuleiro, () {
      super.settingsTabuleiro = value;
    });
  }

  final _$caixasAtom = Atom(name: '_TabuleiroBase.caixas');

  @override
  ObservableList<Caixa> get caixas {
    _$caixasAtom.reportRead();
    return super.caixas;
  }

  @override
  set caixas(ObservableList<Caixa> value) {
    _$caixasAtom.reportWrite(value, super.caixas, () {
      super.caixas = value;
    });
  }

  final _$_TabuleiroBaseActionController =
      ActionController(name: '_TabuleiroBase');

  @override
  void _setSettings(SettingsTabuleiro value) {
    final _$actionInfo = _$_TabuleiroBaseActionController.startAction(
        name: '_TabuleiroBase._setSettings');
    try {
      return super._setSettings(value);
    } finally {
      _$_TabuleiroBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setCaixas(int qtd, int qtdBombas) {
    final _$actionInfo = _$_TabuleiroBaseActionController.startAction(
        name: '_TabuleiroBase.setCaixas');
    try {
      return super.setCaixas(qtd, qtdBombas);
    } finally {
      _$_TabuleiroBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void searchInList() {
    final _$actionInfo = _$_TabuleiroBaseActionController.startAction(
        name: '_TabuleiroBase.searchInList');
    try {
      return super.searchInList();
    } finally {
      _$_TabuleiroBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
settingsTabuleiro: ${settingsTabuleiro},
caixas: ${caixas}
    ''';
  }
}

class SettingsTabuleiro {
  SettingsTabuleiro({required this.tamanhoTabuleiro, required this.qtdColumn});

  int tamanhoTabuleiro;
  int qtdColumn;

  static SettingsTabuleiro zero =
      SettingsTabuleiro(qtdColumn: 0, tamanhoTabuleiro: 0);

  int get qtdRow {
    if (this == zero) return 0;
    return tamanhoTabuleiro ~/ qtdColumn;
  }

  int coordenadaToIndex(List<int> coordenadas) {
    var y = coordenadas[0];
    var x = coordenadas[1];
    return y * qtdRow + x;
  }
}

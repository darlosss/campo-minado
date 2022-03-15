import 'package:campo_minado/app/store/tabuleiro_store/tabuleiro.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _realIndex(
      {required int indexC, required int indexR, required int qtdRow}) {
    if (indexC == 0) return indexR;
    return (indexR + indexC * qtdRow);
  }

  @override
  Widget build(BuildContext context) {
    var _tabuleiro = Tabuleiro();
    return Builder(builder: (context) {
      _tabuleiro.setCaixas(25, 5);
      return Column(
          children: List<Widget>.generate(
              _tabuleiro.settingsTabuleiro.qtdColumn, (indexC) {
        return Expanded(
          child: Container(
            margin: EdgeInsets.only(top: 10, left: 10),
            child: Row(
              children:
                  List.generate(_tabuleiro.settingsTabuleiro.qtdRow, (indexR) {
                var index = _realIndex(
                    indexC: indexC,
                    indexR: indexR,
                    qtdRow: _tabuleiro.settingsTabuleiro.qtdRow);

                var caixa = _tabuleiro.caixas[index];

                var margin = const EdgeInsets.only(right: 10);

                return Expanded(
                  child: Container(
                    margin: margin,
                    color: caixa.isBomba
                        ? Colors.red
                        : caixa.bombasEmTorno == 0
                            ? Colors.grey
                            : Colors.green,
                    child: Center(
                        child: Column(
                      children: [
                        Text('${caixa.coordenadas}'),
                        Text('${caixa.bombasEmTorno}'),
                      ],
                    )),
                  ),
                );
              }),
            ),
          ),
        );
      }));
    });
  }
}

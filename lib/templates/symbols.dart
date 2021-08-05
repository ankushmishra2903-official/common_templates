import 'package:flutter/material.dart';
import 'package:special_symbols/special_symbols.dart';

/// flutter pub add special_symbols //my own in pub.dev

class SpecialSymbolsExample extends StatelessWidget {
  final Map _symbols = {
    'SpecialSymbols.om': '${SpecialSymbols.om}',
    'SpecialSymbols.indianRupee': '${SpecialSymbols.indianRupee}',
    'SpecialSymbols.arrowLeft': '${SpecialSymbols.arrowLeft}',
    'SpecialSymbols.doubleArrowLeft': '${SpecialSymbols.doubleArrowLeft}',
    'SpecialSymbols.arrowUp': '${SpecialSymbols.arrowUp}',
    'SpecialSymbols.doubleArrowUp': '${SpecialSymbols.doubleArrowUp}',
    'SpecialSymbols.arrowRight': '${SpecialSymbols.arrowRight}',
    'SpecialSymbols.doubleArrowRight': '${SpecialSymbols.doubleArrowRight}',
    'SpecialSymbols.arrowDown': '${SpecialSymbols.arrowDown}',
    'SpecialSymbols.doubleArrowDown': '${SpecialSymbols.doubleArrowDown}',
    'SpecialSymbols.arrowLeftRight': '${SpecialSymbols.arrowLeftRight}',
    'SpecialSymbols.doubleArrowLeftRight':
    '${SpecialSymbols.doubleArrowLeftRight}',
    'SpecialSymbols.arrowUpDown': '${SpecialSymbols.arrowUpDown}',
    'SpecialSymbols.doubleArrowUpDown': '${SpecialSymbols.doubleArrowUpDown}',
    'SpecialSymbols.bulletPoint': '${SpecialSymbols.bulletPoint}',
    'SpecialSymbols.doubleBulletPoint': '${SpecialSymbols.doubleBulletPoint}',
    'SpecialSymbols.bulletPointEmpty': '${SpecialSymbols.bulletPointEmpty}',
    'SpecialSymbols.doubleBulletPointEmpty':
    '${SpecialSymbols.doubleBulletPointEmpty}',
    'SpecialSymbols.bulletPointTriangle':
    '${SpecialSymbols.bulletPointTriangle}',
    'SpecialSymbols.squareRoot': '${SpecialSymbols.squareRoot}',
    'SpecialSymbols.cubeRoot': '${SpecialSymbols.cubeRoot}',
    'SpecialSymbols.copyright': '${SpecialSymbols.copyright}',
    'SpecialSymbols.registered': '${SpecialSymbols.registered}',
    'SpecialSymbols.degreeCelsius': '${SpecialSymbols.degreeCelsius}',
    'SpecialSymbols.degreeFahrenheit': '${SpecialSymbols.degreeFahrenheit}',
    'SpecialSymbols.forAll': '${SpecialSymbols.forAll}',
    'SpecialSymbols.greaterThenOrEqualTo':
    '${SpecialSymbols.greaterThenOrEqualTo}',
    'SpecialSymbols.lessThenOrEqualTo': '${SpecialSymbols.lessThenOrEqualTo}',
    'SpecialSymbols.infinity': '${SpecialSymbols.infinity}',
    'SpecialSymbols.notEqual': '${SpecialSymbols.notEqual}',
    'SpecialSymbols.equal': '${SpecialSymbols.equal}',
    'SpecialSymbols.partialDifferential':
    '${SpecialSymbols.partialDifferential}',
    'SpecialSymbols.thereExists': '${SpecialSymbols.thereExists}',
    'SpecialSymbols.thereNotExists': '${SpecialSymbols.thereNotExists}',
    'SpecialSymbols.ohm': '${SpecialSymbols.ohm}',
    'SpecialSymbols.ohmInverted': '${SpecialSymbols.ohmInverted}',
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Special Symbols Examples"),
      ),
      body: Center(
        child: ListView(
          children: <Widget>[
            for (int i = 0; i < _symbols.length; i++) ...[
              ListTile(
                leading: Text(
                  _symbols.values.toList()[i],
                  style: TextStyle(fontSize: 20),
                  textAlign: TextAlign.center,
                ),
                title: Text(_symbols.keys.toList()[i]),
              ),
            ]
          ],
        ),
      ),
    );
  }
}

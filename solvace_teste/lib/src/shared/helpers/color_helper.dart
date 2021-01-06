import 'package:flutter/material.dart';
import 'package:html_color/html_color.dart';

// NOTE site para pegar os nomes das cores
// http://chir.ag/projects/name-that-color/#AD44BB
enum ColorLib {
  colorPrimary,
  textColor,
  chateauGreen,
  vulcan,
  seance, // NOTE cor default do app valuu
  concrete,
  anakiwa,
  wildSand,
  codGray,
  alto,
  malachite,
  boulder,
  regentGray,
  fern,
  gossip,
  emperor,
  grayChateau,
  forestGreen,
  seashell,
  athensGray,
  bombay,
  silver,
  black,
  shamrock,
  mantis,
  doveGray,
  alabaster,
  jaguar,
  greenVariation,
  green,
  red,
  grey,
  white,
  greyShadow,
  darkGrey,
  lightPurple,
  redError,
  link,
}

extension ColorLibExtension on ColorLib {
  static const Map<ColorLib, String> names = {
    ColorLib.colorPrimary: '0e0e0e',
    ColorLib.textColor: '1C1C1C',
    ColorLib.chateauGreen: '44BB53',
    ColorLib.vulcan: '0C0F18',
    ColorLib.seance: '822DA4',
    ColorLib.concrete: 'F3F3F3',
    ColorLib.anakiwa: '9EFFF6',
    ColorLib.wildSand: 'F6F6F6',
    ColorLib.codGray: '121212',
    ColorLib.alto: 'D0D0D0',
    ColorLib.malachite: '21D63D',
    ColorLib.boulder: '7D7D7D',
    ColorLib.regentGray: '959EA4',
    ColorLib.fern: '55B47B',
    ColorLib.gossip: 'CDF5AE',
    ColorLib.emperor: '4F4F4F',
    ColorLib.grayChateau: '99A2A8',
    ColorLib.forestGreen: '439926',
    ColorLib.seashell: 'F1F1F1',
    ColorLib.athensGray: 'F3F5F7',
    ColorLib.bombay: 'AFB6BB',
    ColorLib.silver: 'C8C8C8',
    ColorLib.black: '000000',
    ColorLib.shamrock: '2ECC71',
    ColorLib.mantis: '63C576',
    ColorLib.doveGray: '707070',
    ColorLib.alabaster: 'F8F8F8',
    ColorLib.jaguar: '1E1D22',
    ColorLib.greenVariation: '1CAE81',
    ColorLib.green: '00a595',
    ColorLib.red: 'd8214e',
    ColorLib.grey: '828282',
    ColorLib.white: 'FFFFFF',
    ColorLib.greyShadow: 'E0E0E0',
    ColorLib.darkGrey: '777272',
    ColorLib.lightPurple: '8921AA',
    ColorLib.redError: 'CC0000',
    ColorLib.link : '3366BB',
  };

  String get hex => names[this];

  Color get color => HTMLColor.hex(names[this]);

  Color colorO(double opacity) => HTMLColor.hex(names[this], opcity: opacity);
}

extension ColorExtension on String {

  Color get color => HTMLColor.hex(this, opcity: 1);
}
import 'package:diacritic/diacritic.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class Statut {
  static const String toponyme = "toponyme";
  static const String frToponyme = "Toponyme";
  static const int iToponyme = 0;

  static const String capitale = "capitale";
  static const String frCapitale = "Capitale";
  static const int iCapitale = 1;

  static const String privilegie = "privilegie";
  static const String frPrivilegie = "Terme";
  static const int iPrivilegie = 2;

  static const String siege = "siege";
  static const String frSiege = "Siège";
  static const int iSiege = 3;

  static const String synonyme = "synonyme";
  static const String frSynonyme = "Synonyme(s)";
  static const int iSynonyme = 4;

  static const String antonyme = "antonyme";
  static const String frAntonyme = "Antonyme(s)";
  static const int iAntonyme = 5;

  static const String equivalent = "equivalent";
  static const String frEquivalent = "Équivalent(s) étrangé(s)";
  static const int iEquivalent = 6;

  static const String unknown = "unknown";
  static const int iUnknown = 7;

  static int fromStr(String statut) {
    final String statutSimplified = removeDiacritics(statut.toLowerCase());
    switch (statutSimplified) {
      case toponyme:
        return iToponyme;
      case capitale:
        return iCapitale;
      case privilegie:
        return iPrivilegie;
      case siege:
        return iSiege;
      case synonyme:
        return iSynonyme;
      case antonyme:
        return iAntonyme;
      case equivalent:
        return iEquivalent;
      default:
        return iUnknown;
    }
  }

  static String fromInt(statut) {
    switch (statut) {
      case iToponyme:
        return toponyme;
      case iCapitale:
        return capitale;
      case iPrivilegie:
        return privilegie;
      case iSiege:
        return siege;
      case iSynonyme:
        return synonyme;
      case iAntonyme:
        return antonyme;
      case iEquivalent:
        return equivalent;
      default:
        return unknown;
    }
  }

  static String fromIntToLang(BuildContext context, int statut) {
    switch (statut) {
      case iToponyme:
        return AppLocalizations.of(context)!.toponym;
      case iCapitale:
        return AppLocalizations.of(context)!.capital;
      case iPrivilegie:
        return AppLocalizations.of(context)!.term;
      case iSiege:
        return AppLocalizations.of(context)!.headquarters;
      case iSynonyme:
        return AppLocalizations.of(context)!.synonyms;
      case iAntonyme:
        return AppLocalizations.of(context)!.antonyms;
      case iEquivalent:
        return AppLocalizations.of(context)!.equivalents;
      default:
        return unknown;
    }
  }
}

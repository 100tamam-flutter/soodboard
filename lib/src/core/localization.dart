import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

export 'package:flutter_gen/gen_l10n/app_localizations.dart';

extension Localization on BuildContext {
  AppLocalizations get localizations {
    return AppLocalizations.of(this)!;
  }
}

class LocaleProvider extends ChangeNotifier {
  Locale? _locale = const Locale('en');

  Locale? get locale => _locale;

  void setLocale(final Locale? newLocale) {
    _locale = newLocale;
    notifyListeners();
  }
}

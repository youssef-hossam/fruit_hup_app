import 'package:flutter/widgets.dart';

bool isArabic(BuildContext context) =>
    Localizations.localeOf(context).languageCode == 'ar';

import 'package:flutter/cupertino.dart';
import 'package:media_app/res/Resources.dart';

extension AppContextExtension on BuildContext {
  Resources get resources => Resources.of(this);
}

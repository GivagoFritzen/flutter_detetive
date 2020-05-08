import 'dart:math';
import 'dart:ui';

import 'package:flutterdetetive/utils/gameManagersUtil.dart';
import 'package:flutterdetetive/utils/messagesUtil.dart';

class PlayerController {
  String name, playerImage;
  Color playerColor;
  List<String> tips;
  Random random = new Random();

  PlayerController(this.name) {
    playerImage = GameManagersUtil.getImageNameKiller(name);
    tips = MessagesUtil.getListTips();
    playerColor = GameManagersUtil.getColorByName(name);
  }

  String getAndRemoveOneTip() {
    if (tips.length == 0) tips = MessagesUtil.getListTips();

    int tipIndex = random.nextInt(tips.length);
    String tip = tips[tipIndex];
    tips.removeAt(tipIndex);

    return tip;
  }
}

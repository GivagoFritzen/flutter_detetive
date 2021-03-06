import 'dart:math';
import 'dart:ui';

import 'package:flutterdetetive/utils/gameManagersUtil.dart';
import 'package:flutterdetetive/utils/messagesUtil.dart';

class PlayerController {
  String name, playerImage;
  Color playerColor;
  List<String> tips;
  Random random = new Random();
  String killer = '';
  String scene = '';
  String weapon = '';

  PlayerController(this.name, this.killer, this.scene, this.weapon) {
    playerImage = GameManagersUtil.getImageNameKiller(name);
    tips = MessagesUtil.getListTips(killer, scene, weapon);
    playerColor = GameManagersUtil.getColorByName(name);
  }

  String getAndRemoveOneTip() {
    if (tips.length == 0)
      tips = MessagesUtil.getListTips(killer, scene, weapon);

    int tipIndex = random.nextInt(tips.length);
    String tip = tips[tipIndex];
    tips.removeAt(tipIndex);

    return tip;
  }
}

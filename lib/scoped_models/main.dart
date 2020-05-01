import 'package:scoped_model/scoped_model.dart';

class MainModel extends Model {
  List<String> _players = new List<String>();
  String _killer = "";
  String _crimeScene = "";
  String _murderWeapon = "";

  List<String> get players {
    return _players;
  }

  String get killer {
    return _killer;
  }

  String get crimeScene {
    return _crimeScene;
  }

  String get murderWeapon {
    return _murderWeapon;
  }

  void updateListPlayers(List<String> players) {
    _players = players;
  }

  void updateKiller(String killer) {
    _killer = killer;
  }

  void updateCrimeScene(String crimeScene) {
    _crimeScene = crimeScene;
  }

  void updateMurderWeapon(String murderWeapon) {
    _murderWeapon = murderWeapon;
  }
}

import 'dart:math';

import 'package:flutterdetetive/controllers/PlayerController.dart';
import 'package:scoped_model/scoped_model.dart';

class MainModel extends Model {
  List<PlayerController> _playerControllers = new List<PlayerController>();
  List<String> _players = new List<String>();
  String _currentPlayer = "";
  String _killer = "";
  String _crimeScene = "";
  String _murderWeapon = "";

  void startGame() {
    _playerControllers.clear();

    for (String player in _players)
      _playerControllers.add(PlayerController(player));
  }

  PlayerController randomPlayerController() {
    Random random = new Random();
    PlayerController playerController =
        _playerControllers[random.nextInt(_playerControllers.length)];

    return playerController;
  }

  List<String> get players {
    return _players;
  }

  String get currentPlayer {
    return _currentPlayer;
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

  String updateCurrentPlayer(String player) {
    _currentPlayer = player;
  }

  void removerPlayer() {
    _players.remove(_currentPlayer);
    _currentPlayer = "";
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

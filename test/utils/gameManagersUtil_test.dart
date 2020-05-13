import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutterdetetive/utils/gameManagersUtil.dart';

void main() {
  test('Get Color By Name', () {
    Color color = GameManagersUtil.getColorByName("");
    expect(color, Colors.grey);

    color = GameManagersUtil.getColorByName("Dona BRANCA");
    expect(color, Colors.pinkAccent);

    color = GameManagersUtil.getColorByName("Dona VIOLETA");
    expect(color, Colors.deepPurpleAccent);

    color = GameManagersUtil.getColorByName("Mordomo James");
    expect(color, Colors.blueGrey);

    color = GameManagersUtil.getColorByName("Sargento BIGODE");
    expect(color, Colors.yellow);

    color = GameManagersUtil.getColorByName("Senhor MARINHO");
    expect(color, Colors.lightGreen);

    color = GameManagersUtil.getColorByName("Senhora ROSA");
    expect(color, Colors.red);

    color = GameManagersUtil.getColorByName("Sérgio SOTURNO");
    expect(color, Colors.lightBlueAccent);

    color = GameManagersUtil.getColorByName("Tony GOURMET");
    expect(color, Colors.deepOrangeAccent);
  });

  test('Get Image Name Killer by Name', () {
    String imageName = GameManagersUtil.getImageNameKiller("");
    expect(imageName, "anonymous");

    imageName = GameManagersUtil.getImageNameKiller("Dona BRANCA");
    expect(imageName, "dona-branca");

    imageName = GameManagersUtil.getImageNameKiller("Dona VIOLETA");
    expect(imageName, "dona-violeta");

    imageName = GameManagersUtil.getImageNameKiller("Mordomo James");
    expect(imageName, "mordomo-james");

    imageName = GameManagersUtil.getImageNameKiller("Sargento BIGODE");
    expect(imageName, "sargento-bigode");

    imageName = GameManagersUtil.getImageNameKiller("Senhor MARINHO");
    expect(imageName, "senhor-marinho");

    imageName = GameManagersUtil.getImageNameKiller("Senhora ROSA");
    expect(imageName, "senhora-rosa");

    imageName = GameManagersUtil.getImageNameKiller("Sérgio SOTURNO");
    expect(imageName, "sergio-soturno");

    imageName = GameManagersUtil.getImageNameKiller("Tony GOURMET");
    expect(imageName, "tony-gourmet");
  });

  test('Get Image Name Crime Scene by Name', () {
    String imageName = GameManagersUtil.getImageNameCrimeScene("");
    expect(imageName, "banco");

    imageName = GameManagersUtil.getImageNameCrimeScene("Boate");
    expect(imageName, "boate");

    imageName = GameManagersUtil.getImageNameCrimeScene("Cemitério");
    expect(imageName, "cemiterio");

    imageName = GameManagersUtil.getImageNameCrimeScene("Estação de Trem");
    expect(imageName, "estacao-trem");

    imageName = GameManagersUtil.getImageNameCrimeScene("Floricultura");
    expect(imageName, "floricultura");

    imageName = GameManagersUtil.getImageNameCrimeScene("Hospital");
    expect(imageName, "hospital");

    imageName = GameManagersUtil.getImageNameCrimeScene("Hotel");
    expect(imageName, "hotel");

    imageName = GameManagersUtil.getImageNameCrimeScene("Mansão");
    expect(imageName, "mansao");

    imageName = GameManagersUtil.getImageNameCrimeScene("Praça Central");
    expect(imageName, "praca-central");

    imageName = GameManagersUtil.getImageNameCrimeScene("Prefeitura");
    expect(imageName, "prefeitura");

    imageName = GameManagersUtil.getImageNameCrimeScene("Restaurante");
    expect(imageName, "restaurante");
  });

  test('Get Image Name Weapon by Name', () {
    String imageName = GameManagersUtil.getImageNameWeapon("");
    expect(imageName, "arma-quimica");

    imageName = GameManagersUtil.getImageNameWeapon("Espingarda");
    expect(imageName, "espingarda");

    imageName = GameManagersUtil.getImageNameWeapon("Faca");
    expect(imageName, "faca");

    imageName = GameManagersUtil.getImageNameWeapon("Pá");
    expect(imageName, "pa");

    imageName = GameManagersUtil.getImageNameWeapon("Pé de Cabra");
    expect(imageName, "pe-de-cabra");

    imageName = GameManagersUtil.getImageNameWeapon("Soco Inglês");
    expect(imageName, "soco-ingles");

    imageName = GameManagersUtil.getImageNameWeapon("Tesoura");
    expect(imageName, "tesoura");

    imageName = GameManagersUtil.getImageNameWeapon("Veneno");
    expect(imageName, "veneno");
  });

  test('Get Time Events In Seconds', () {
    int seconds = GameManagersUtil.getTimeEventsInSeconds(1);
    expect(seconds, 10 * 60);

    seconds = GameManagersUtil.getTimeEventsInSeconds(3);
    expect(seconds, 10 * 60);

    seconds = GameManagersUtil.getTimeEventsInSeconds(4);
    expect(seconds, 9 * 60);

    seconds = GameManagersUtil.getTimeEventsInSeconds(5);
    expect(seconds, 8 * 60);

    seconds = GameManagersUtil.getTimeEventsInSeconds(6);
    expect(seconds, 7 * 60);

    seconds = GameManagersUtil.getTimeEventsInSeconds(7);
    expect(seconds, 6 * 60);

    seconds = GameManagersUtil.getTimeEventsInSeconds(8);
    expect(seconds, 5 * 60);

    seconds = GameManagersUtil.getTimeEventsInSeconds(60);
    expect(seconds, 5 * 60);
  });
}

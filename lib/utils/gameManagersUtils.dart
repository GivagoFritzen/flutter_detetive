class GameManagersUtils {
  static String getImageNameKiller(String name) {
    String imageName = 'anonymous';

    if (name == "Dona BRANCA")
      imageName = 'dona-branca';
    else if (name == "Dona VIOLETA")
      imageName = 'dona-violeta';
    else if (name == "Mordomo James")
      imageName = 'mordomo-james';
    else if (name == "Sargento BIGODE")
      imageName = 'sargento-bigode';
    else if (name == "Senhor MARINHO")
      imageName = 'senhor-marinho';
    else if (name == "Senhora ROSA")
      imageName = 'senhora-rosa';
    else if (name == "Sérgio SOTURNO")
      imageName = 'sergio-soturno';
    else if (name == "Tony GOURMET") imageName = 'tony-gourmet';

    return imageName;
  }

  static String getImageNameCrimeScene(String name) {
    String imageName = 'banco';

    if (name == "Boate")
      imageName = 'boate';
    else if (name == "Cemitério")
      imageName = 'cemiterio';
    else if (name == "Estação de Trem")
      imageName = 'estacao-trem';
    else if (name == "Floricultura")
      imageName = 'floricultura';
    else if (name == "Hospital")
      imageName = 'hospital';
    else if (name == "Hotel")
      imageName = 'hotel';
    else if (name == "Mansão")
      imageName = 'mansao';
    else if (name == "Praça Central")
      imageName = 'praca-central';
    else if (name == "Prefeitura")
      imageName = 'prefeitura';
    else if (name == "Restaurante") imageName = 'restaurante';

    return imageName;
  }

  static String getImageNameWeapon(String name) {
    String imageName = 'arma-quimica';

    if (name == "Espingarda")
      imageName = 'espingarda';
    else if (name == "Faca")
      imageName = 'faca';
    else if (name == "Pá")
      imageName = 'pa';
    else if (name == "Pé de Cabra")
      imageName = 'pe-de-cabra';
    else if (name == "Soco Inglês")
      imageName = 'soco-ingles';
    else if (name == "Tesoura")
      imageName = 'tesoura';
    else if (name == "Veneno") imageName = 'veneno';

    return imageName;
  }
}

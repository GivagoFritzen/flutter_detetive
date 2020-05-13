class MessagesUtil {
  static List<String> getListTips(String killer, String scene, String weapon) {
    List<String> tips = new List<String>();

    addJokes(tips);
    genericTips(tips);
    addTipsKiller(tips, killer);
    addTipsPlaces(tips, scene);
    addTipsWeapon(tips, weapon);

    return tips;
  }

  static addJokes(List<String> tips) {
    tips.add(
        "Comece seu projeto verão na academia DETEFIT, com um incrível desconto!");
    tips.add(
        "Você ganhou entradas para a boate DANCETIVE. Diesque 01-1-1-1 para adquiri-las.");
    tips.add(
        "TELETIVE informa: Seu saldo está acabando. Faça uma recarga em um posto próximo de você.");
    tips.add(
        "Quer emagrecer e não sabe como? Fale com a DETEGRECER e descubra o segredo dos especialistas!");
    tips.add(
        "Acaba hoje com a queda de cabelo, usando o novíssimo produto natural da FIOSTIVE.");
  }

  static genericTips(List<String> tips) {
    tips.add(
        "Cara, o lugar estava uma bagunça! Havia manchas de sangue em todo o lugar!");
    tips.add("Eu não vi nenhuma indicação de que o local foi arrombado.");
  }

  static addTipsKiller(List<String> tips, String killer) {
    if (killer == "Dona BRANCA") {
      tips.add(
          "A florista estava me ajudando a decidir algumas flores no momento do crime.");
    } else if (killer != "Dona VIOLETA") {
      tips.add(
          "No momento do crime eu estava com a médica dando remédios para meu tio.");
    } else if (killer != "Mordomo James") {
      tips.add(
          "Acompanhei o mordomo num passeio pela rua com os cachorros no momento do crime.");
    } else if (killer != "Sargento BIGODE") {
      tips.add(
          "Eu e o sargento estávamos conversando sobre táticas de combate, na hora do crime.");
    } else if (killer != "Senhor MARINHO") {
      tips.add(
          "Eu fui testemunha de um caso no qual o advogado foi participar na corte em outra cidade.");
    } else if (killer != "Senhora ROSA") {
      tips.add(
          "Estava no teatro vendo a suspeita dançarina se apresentando na hora do crime.");
    } else if (killer != "Sérgio SOTURNO") {
      tips.add("O coveiro ficou trocando uma ideia comigo o dia todo.");
    } else if (killer != "Tony GOURMET") {
      tips.add(
          "Me contaram que o chef de cozinha estava preparando um prato especial para um visitante internacional no momento do crime.");
    }

    addKillerSex(tips, killer);
  }

  static addKillerSex(List<String> tips, String killer) {
    if (killer == "Dona BRANCA" ||
        killer == "Dona VIOLETA" ||
        killer == "Senhora ROSA") {
      tips.add("Eu tenho certeza que ouvi uma voz feminina na hora do crime.");
    } else {
      tips.add("Eu tenho certeza que ouvi uma voz masculina na hora do crime.");
    }
  }

  static addTipsWeapon(List<String> tips, String weapon) {
    if (weapon != "Arma Química") {
      tips.add("Não foi identificado nenhuma Arma Química na cena do crime.");
    } else if (weapon != "Espingarda") {
      tips.add(
          "Eu vi o corpo de Carlos Fortuna e não havia nenhuma bala ou marcas de tiro.");
    } else if (weapon != "Faca") {
      tips.add("Me falaram que a arma do crime não é um elemento de cozinha");
    } else if (weapon != "Pá") {
      tips.add(
          "Tenho certeza que a arma utilizada para o crime não é a mesma que foi usada para enterrar Carlos Fortuna.");
    } else if (weapon != "Pé de Cabra") {
      tips.add("Posso garantir que a arma do crime não era um Pé de Cabra.");
    } else if (weapon != "Soco Inglês") {
      tips.add(
          "Eu achei que o assassino tinha usado anéis para atacar Carlos Fortuna.");
    } else if (weapon != "Tesoura") {
      tips.add(
          "Me disseram que o objeto que foi encontrado não é um elemento de escritório.");
    } else if (weapon != "Veneno") {
      tips.add("Carlos Fortuna não foi envenenado.");
    }
  }

  static addTipsPlaces(List<String> tips, String scene) {
    if (scene != "Banco") {
      tips.add(
          "Estava pagando minhas contas no banco e te garanto que nada aconteceu lá.");
    } else if (scene != "Boate") {
      tips.add(
          "Eu e meus amigos ficamos até o final do show que estava acontecendo na boate, e não vimos nada de estranho por lá.");
    } else if (scene != "Cemitério") {
      tips.add(
          "Minha família foi fazer uma homenagem a nossa tia-avó no cemitério, bem na hora do assassinato. Não aconteceu nada de estranho.");
    } else if (scene != "Estação de Trem") {
      tips.add(
          "Olha, na estação de trem não pode ter sido. Eu estava lá com as minhas tias voltando para a cidade quando falaram que aconteceu um crime. Não vimos nada.");
    } else if (scene != "Floricultura") {
      tips.add(
          "Estava comprando flores para minha namorada na hora do crime. Não aconteceu nada lá.");
    } else if (scene != "Hospital") {
      tips.add(
          "Neste dia, eu trabalhei 2 turnos no hospital para cobrir uma enfermeira que faltou. Posso garantir que tudo correu normalmente por lá.");
    } else if (scene != "Hotel") {
      tips.add(
          "Sou faxineira do hotel e quando fui fazer a limpeza dos quartos não vi nada de estranho não.");
    } else if (scene != "Mansão") {
      tips.add(
          "Fui no baile de máscaras na mansão e Carlos Fortuna não estava lá.");
    } else if (scene != "Praça Central") {
      tips.add(
          "Marquei com o Carlos Fortuna para vermos a apresentação circense na praça, mas ele não foi. Ainda procurei por lá, mas não o vi.");
    } else if (scene != "Prefeitura") {
      tips.add(
          "Estávamos em um comitê na prefeitura na hora do crime. O senhor Carlos Fortuna não foi visto entre os presentes.");
    } else if (scene != "Restaurante") {
      tips.add(
          "Estava com minha noiva no restaurante fazendo um jantar romântico.");
    }
  }
}

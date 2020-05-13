import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterdetetive/enums/choiceCardsToPlayPageStep.dart';
import 'package:flutterdetetive/scoped_models/main.dart';
import 'package:flutterdetetive/utils/colorsUtil.dart';
import 'package:flutterdetetive/widgets/choiceOptionsAba.dart';
import 'package:flutterdetetive/widgets/choicePlayerButton.dart';
import 'package:flutterdetetive/widgets/continueButton.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:qrscan/qrscan.dart' as scanner;

class ChoiceCardsToPlayPage extends StatefulWidget {
  ChoiceCardsToPlayPage({Key key}) : super(key: key);

  @override
  ChoiceCardsToPlayPageState createState() => ChoiceCardsToPlayPageState();
}

class ChoiceCardsToPlayPageState extends State<ChoiceCardsToPlayPage> {
  bool _isInit = true;
  bool choiceCardsToPlayPage = false;
  List<String> players = new List<String>();
  ChoiceCardsToPlayPageStep choiceCardsToPlayPageStep =
      ChoiceCardsToPlayPageStep.Players;

  MainModel model;

  String barcode = '';
  String scanKiller = '';
  String scanPlace = '';
  String scanWeapon = '';

  @override
  void didChangeDependencies() {
    if (_isInit) {
      try {
        final data =
            ModalRoute.of(context).settings.arguments as Map<String, dynamic>;
        choiceCardsToPlayPage = data['choiceCardsToPlayPage'];
      } catch (ex) {}
    }
    _isInit = false;
    super.didChangeDependencies();
  }

  Widget informationAboutScan() {
    if (choiceCardsToPlayPageStep == ChoiceCardsToPlayPageStep.TypeOfChoice) {
      return Padding(
        padding: EdgeInsets.only(top: 25),
        child: Container(
          color: ColorsUtil.getMediumGreen(),
          width: MediaQuery.of(context).size.width * 0.9,
          child: Padding(
            padding: EdgeInsets.all(15),
            child: Column(
              children: <Widget>[
                Text(
                  "ANTES DE COLOCAR AS CARTAS NO ENVELOPE 'REVELAÇÃO', VOCÊ PRECISA INDICAR QUAIS SÃO ELAS.",
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.white),
                ),
                SizedBox(height: 25),
                Text(
                  "ESCOLHA ESCANEAR PARA LER O QR CODE DAS CARTAS COM SUA CÂMERA OU SELECIONAR PARA ESCOLHER AS CARTAS QUE IRÃO REPRESENTAR CADA UM DOS ELEMENTOS.",
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.white),
                ),
                SizedBox(height: 25),
                Container(
                  color: ColorsUtil.getLightGreen(),
                  width: MediaQuery.of(context).size.width * .7,
                  child: Column(
                    children: <Widget>[
                      informationAboutScanRow(
                          "CARTA DO ASSASSINO", scanKiller != ''),
                      informationAboutScanRow(
                          "CARTA DA ARMA", scanWeapon != ''),
                      informationAboutScanRow(
                          "CARTA DO LOCAL", scanPlace != ''),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    } else
      return Container();
  }

  Widget informationAboutScanRow(String text, bool isActived) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Spacer(),
        Text(
          text,
          style: TextStyle(
            color: Colors.white,
            fontSize: 15,
          ),
          textAlign: TextAlign.center,
        ),
        Spacer(),
        drawScanCard(isActived),
      ],
    );
  }

  Widget drawScanCard(bool isActived) {
    if (isActived) {
      return Stack(
        children: <Widget>[
          Icon(
            Icons.stop,
            color: ColorsUtil.getDarkGreen(),
            size: 80,
          ),
          Positioned(
            left: 20,
            top: 20,
            child: Icon(
              Icons.check,
              color: Colors.white,
              size: 40,
            ),
          ),
        ],
      );
    }

    return Icon(
      Icons.stop,
      color: ColorsUtil.getDarkGreen(),
      size: 80,
    );
  }

  Widget showAba() {
    Color backgroundColor = ColorsUtil.getLightGreen();

    String text = "";
    if (choiceCardsToPlayPageStep == ChoiceCardsToPlayPageStep.Players)
      text = "ESCOLHA ENTRE 3 e 8 PARTICIPANTES PARA O JOGO";
    else if (choiceCardsToPlayPageStep ==
        ChoiceCardsToPlayPageStep.TypeOfChoice) text = "CONFIGURANDO O CRIME";

    return ChoiceOptionsAba(
      text: text,
      backgroundColor: backgroundColor,
      function: () => {
        setState(() {
          players.clear();
          model.updateListPlayers(new List<String>());
          choiceCardsToPlayPage = false;

          if (choiceCardsToPlayPageStep == ChoiceCardsToPlayPageStep.Players)
            Navigator.pushNamed(context, '/home');
          else if (choiceCardsToPlayPageStep ==
              ChoiceCardsToPlayPageStep.TypeOfChoice) {
            choiceCardsToPlayPageStep = ChoiceCardsToPlayPageStep.Players;
          }
        })
      },
    );
  }

  Widget showAllPossiblePlayer() {
    if (choiceCardsToPlayPageStep == ChoiceCardsToPlayPageStep.Players) {
      return SafeArea(
        child: Padding(
          padding: EdgeInsets.only(left: 10),
          child: Wrap(
            spacing: MediaQuery.of(context).size.width * .125,
            runSpacing: MediaQuery.of(context).size.width * .05,
            children: [
              ChoicePlayerButton(
                function: () => controllerPlayers("Sargento BIGODE"),
                name: "Sargento BIGODE",
              ),
              ChoicePlayerButton(
                function: () => controllerPlayers("Dona BRANCA"),
                name: "Dona BRANCA",
              ),
              ChoicePlayerButton(
                function: () => controllerPlayers("Senhor MARINHO"),
                name: "Senhor MARINHO",
              ),
              ChoicePlayerButton(
                function: () => controllerPlayers("Tony GOURMET"),
                name: "Tony GOURMET",
              ),
              ChoicePlayerButton(
                function: () => controllerPlayers("Senhora ROSA"),
                name: "Senhora ROSA",
              ),
              ChoicePlayerButton(
                function: () => controllerPlayers("Dona VIOLETA"),
                name: "Dona VIOLETA",
              ),
              ChoicePlayerButton(
                function: () => controllerPlayers("Sérgio SOTURNO"),
                name: "Sérgio SOTURNO",
              ),
              ChoicePlayerButton(
                function: () => controllerPlayers("Mordomo James"),
                name: "Mordomo James",
              ),
            ],
          ),
        ),
      );
    } else {
      return Container();
    }
  }

  void controllerPlayers(String player) {
    if (players.contains(player)) {
      setState(() {
        players.remove(player);
      });
    } else {
      setState(() {
        players.add(player);
      });
    }
  }

  Widget showButtons(BuildContext context) {
    if (choiceCardsToPlayPageStep == ChoiceCardsToPlayPageStep.Players) {
      return Padding(
        padding: EdgeInsets.only(top: 15),
        child: ContinueButton(
          isActived: players.length >= 3 ? true : false,
          name: "Continuar",
          function: () => {
            if (players.length >= 3)
              setState(() {
                choiceCardsToPlayPageStep =
                    ChoiceCardsToPlayPageStep.TypeOfChoice;
              })
          },
        ),
      );
    } else if (choiceCardsToPlayPageStep ==
        ChoiceCardsToPlayPageStep.TypeOfChoice) {
      return Padding(
        padding: EdgeInsets.only(top: 15),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ContinueButton(
              isActived: true,
              name: "Escanear",
              function: _scan,
            ),
            SizedBox(width: 15),
            ContinueButton(
              isActived: true,
              name: "Selecionar",
              function: () => {
                setState(() {
                  createAlertDialog(context);
                })
              },
            ),
          ],
        ),
      );
    } else
      return Container();
  }

  void updatePlayers() {
    if (choiceCardsToPlayPage) {
      players = model.players;
      choiceCardsToPlayPageStep = ChoiceCardsToPlayPageStep.TypeOfChoice;
    }
  }

  createAlertDialog(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: ColorsUtil.getDarkGreen(),
          content: Text(
            'PEÇA A UMA PESSOA QUE NÃO VAI PARTICIPAR DO JOGO PARA REALIZAR ESSA ETAPA, POIS ELA SABERÁ O RESULTADO FINAL.',
            style: TextStyle(color: Colors.white),
          ),
          actions: [
            Padding(
              padding: EdgeInsets.only(top: 5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  ContinueButton(
                    width: size.width * .3,
                    isActived: true,
                    name: "VOLTAR",
                    function: () => {
                      Navigator.pop(context),
                    },
                  ),
                  SizedBox(width: 15),
                  ContinueButton(
                    width: size.width * .3,
                    isActived: true,
                    name: "CONTINUAR",
                    function: () => {
                      setState(() {
                        choiceCardsToPlayPageStep =
                            ChoiceCardsToPlayPageStep.ManualPlayers;
                        model.updateListPlayers(players);
                        Navigator.pushNamed(context, '/choicekiller');
                      })
                    },
                  ),
                ],
              ),
            ),
          ],
        );
      },
    );
  }

  Future _scan() async {
    String barcode = await scanner.scan();
    scanCard(int.parse(barcode));
    if (scanKiller != '' && scanPlace != '' && scanWeapon != '') {
      model.updateKiller(scanKiller);
      model.updateMurderWeapon(scanWeapon);
      model.updateCrimeScene(scanPlace);
      model.updateListPlayers(players);
      Navigator.pushNamed(
        context,
        '/camera',
      );
    }
  }

  void scanCard(int code) {
    if (code < 9)
      scanCardKiller(code);
    else if (code >= 9 && code < 17)
      scanCardWeapon(code);
    else if (code >= 17 && code <= 27) scanCardPlace(code);
  }

  void scanCardKiller(int code) {
    if (scanKiller != '')
      return createAlertDialogScanDuplicate(context, 'ASSASSINO');

    var killer = "";

    if (code == 1) killer = "Senhor MARINHO";
    if (code == 2) killer = "Tony GOURMET";
    if (code == 3) killer = "Sérgio SOTURNO";
    if (code == 4) killer = "Senhora ROSA";
    if (code == 5) killer = "Dona BRANCA";
    if (code == 6) killer = "Dona VIOLETA";
    if (code == 7) killer = "Mordomo James";
    if (code == 8) killer = "Sargento BIGODE";

    setState(() => scanKiller = killer);
  }

  void scanCardPlace(int code) {
    if (scanPlace != '')
      return createAlertDialogScanDuplicate(context, 'LUGAR');

    var place = "";

    if (code == 13)
      place = "Banco";
    else if (code == 18)
      place = "Boate";
    else if (code == 19)
      place = "Cemitério";
    else if (code == 20)
      place = "Estação de Trem";
    else if (code == 21)
      place = "Floricultura";
    else if (code == 22)
      place = "Hospital";
    else if (code == 23)
      place = "Hotel";
    else if (code == 24)
      place = "Mansão";
    else if (code == 25)
      place = "Praça Central";
    else if (code == 26)
      place = "Prefeitura";
    else if (code == 27) place = "Restaurante";

    setState(() => scanPlace = place);
  }

  void scanCardWeapon(int code) {
    if (scanWeapon != '')
      return createAlertDialogScanDuplicate(context, 'ARMA');

    var weapon = "";

    if (code == 9)
      weapon = "Arma Química";
    else if (code == 10)
      weapon = "Espingarda";
    else if (code == 11)
      weapon = "Faca";
    else if (code == 12)
      weapon = "Pá";
    else if (code == 13)
      weapon = "Pé de Cabra";
    else if (code == 14)
      weapon = "Soco Inglês";
    else if (code == 15)
      weapon = "Tesoura";
    else if (code == 16) weapon = "Veneno";

    setState(() => scanWeapon = weapon);
  }

  createAlertDialogScanDuplicate(BuildContext context, String text) {
    final size = MediaQuery.of(context).size;

    return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: Colors.red,
          content: Text(
            'Você já escaneou a carta para  ${text}. Por favor escaneie outra carta.',
            style: TextStyle(color: Colors.white),
          ),
          actions: [
            Padding(
              padding: EdgeInsets.only(top: 5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  ContinueButton(
                    width: size.width * .3,
                    name: "CONTINUAR",
                    isActived: true,
                    function: () => {
                      setState(() {
                        Navigator.pop(context);
                      })
                    },
                  ),
                ],
              ),
            ),
          ],
        );
      },
    );
  }

  Widget renderBody() {
    return Column(
      children: <Widget>[
        showAba(),
        showAllPossiblePlayer(),
        informationAboutScan(),
        showButtons(context),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ScopedModelDescendant<MainModel>(
          builder: (BuildContext context, Widget child, MainModel model) {
        this.model = model;
        updatePlayers();

        return Container(
          color: ColorsUtil.getDarkGreen(),
          height: double.infinity,
          width: double.infinity,
          child: renderBody(),
        );
      }),
    );
  }
}

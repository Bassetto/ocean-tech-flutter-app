import 'package:flutter/material.dart';
import 'package:ocean_tech/app/components/app_bar_widget.dart';
import 'package:ocean_tech/app/core/core.dart';
import 'package:ocean_tech/app/model/user.dart';
import 'package:ocean_tech/app/screens/cadastro_screen/cadastro_screen.dart';
import 'package:ocean_tech/app/screens/home/components/body.dart';
import 'package:ocean_tech/app/screens/login_screen/login_screen.dart';
import 'package:url_launcher/url_launcher.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late User user;

  _getNewUser() {
    return User("", "", "");
  }

  @override
  void initState() {
    user = _getNewUser();
    super.initState();
  }

  _login() async {
    await Navigator.push(context, MaterialPageRoute(builder: (context) {
      return LoginScreen();
    })).then((value) {
      if (value != null && value is User) {
        setState(() {
          user = value;
        });
      }
    }).catchError((error) {
      print(error);
    });
  }

  _cadastro() async {
    await Navigator.push(context, MaterialPageRoute(builder: (context) {
      return CadastroScreen();
    })).then((value) {
      if (value != null && value is User) {
        setState(() {
          user = value;
        });
      }
    }).catchError((error) {
      print(error);
    });
  }

  @override
  Widget build(BuildContext context) {
    final GlobalKey<ScaffoldState> _scaffoldKey =
        new GlobalKey<ScaffoldState>();

    Future<void> _launchURL() async {
      const url = 'https://www.ipea.gov.br/ods/ods14.html';
      if (await canLaunch(url)) {
        await launch(url);
      } else {
        print('Não foi possível abrir $url');
      }
    }

    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBarWidget(scaffoldKey: _scaffoldKey),
      body: Body(),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blueAccent,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                mainAxisSize: MainAxisSize.max,
                children: [
                  Text(
                    "Olá ${user.name.toTitleCase()}",
                    style: AppTextStyles.title,
                    softWrap: true,
                  ),
                  buildButtonsRow(),
                ],
              ),
            ),
            TextButton(
              child: Text(
                "Saiba Mais",
                style: AppTextStyles.options,
              ),
              onPressed: () {
                Navigator.of(context).pop();
                _launchURL();
              },
            ),
          ],
        ),
      ),
    );
  }

  Row buildButtonsRow() {
    if (user.name.isNotEmpty) {
      return Row(
        children: [
          TextButton(
            style: ButtonStyle(
              backgroundColor:
              MaterialStateProperty.all<Color>(Colors.transparent),
            ),
            child: Text(
              "Sair",
              style: AppTextStyles.bodyBold,
            ),
            onPressed: () => setState(() => user = _getNewUser()),
          )
        ],
      );
    }
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        TextButton(
          style: ButtonStyle(
            backgroundColor:
            MaterialStateProperty.all<Color>(Colors.transparent),
          ),
          child: Text(
            "Login",
            style: AppTextStyles.bodyBold,
          ),
          onPressed: _login,
        ),
        TextButton(
          style: ButtonStyle(
            backgroundColor:
            MaterialStateProperty.all<Color>(Colors.transparent),
          ),
          child: Text(
            "Cadastro",
            style: AppTextStyles.bodyBold,
          ),
          onPressed: _cadastro,
        ),
      ],
    );
  }
}

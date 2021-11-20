import 'package:flutter/material.dart';
import 'package:ocean_tech/app/core/core.dart';
import 'package:ocean_tech/app/service/user_service_api.dart';

class Body extends StatefulWidget {
  const Body({Key? key}) : super(key: key);

  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  final _formKey = GlobalKey<FormState>();
  UserServiceApi _api = UserServiceApi();
  late TextEditingController _usernameController;
  late TextEditingController _passwordController;
  late String _username;
  late String _password;

  @override
  void initState() {
    _usernameController = TextEditingController();
    _passwordController = TextEditingController();
    super.initState();
  }

  _updateUsername(String username) {
    setState(() {
      _username = username;
    });
  }

  _updatePassword(String password) {
    setState(() {
      _password = password;
    });
  }

  @override
  dispose() {
    _usernameController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Padding(
        padding: const EdgeInsets.all(DefaultValues.padding),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextFormField(
              controller: _usernameController,
              onChanged: _updateUsername,
              decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Digite seu username'),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Por favor preencha esse campo!';
                }
                return null;
              },
            ),
            SizedBox(height: DefaultValues.padding / 2),
            TextFormField(
              controller: _passwordController,
              onChanged: _updatePassword,
              obscureText: true,
              decoration: const InputDecoration(
                  border: OutlineInputBorder(), hintText: 'Digite sua senha'),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Por favor preencha esse campo!';
                }
                return null;
              },
            ),
            OutlinedButton(
              onPressed: () async {
                if (_formKey.currentState!.validate()) {
                  ScaffoldMessenger.of(context)
                    ..removeCurrentSnackBar()
                    ..showSnackBar(
                      const SnackBar(content: Text('Realizando login')),
                    );
                  await _api.login(_username, _password).then((user) => Navigator.pop(context, user)).catchError((error) {
                    _passwordController.text = "";
                    ScaffoldMessenger.of(context)..removeCurrentSnackBar()..showSnackBar(
                      const SnackBar(
                          content: Text('Nome de usuário ou senha inválidos!')),
                    );
                  });
                }
              },
              style: ButtonStyle(
                backgroundColor:
                    MaterialStateProperty.all<Color>(Colors.transparent),
                side: MaterialStateProperty.all(BorderSide(
                    color: Colors.blue, width: 1, style: BorderStyle.solid)),
              ),
              child: const Text('Login'),
            ),
          ],
        ),
      ),
    );
  }
}

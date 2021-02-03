import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:wapp_reports/app/components/progress-indicator.component.dart';
import 'package:wapp_reports/settings.dart';
import 'auth_controller.dart';

class AuthPage extends StatefulWidget {
  final String title;
  final AuthController authController;

  const AuthPage({Key key, this.title = "Login", this.authController}) : super(key: key);

  @override
  _AuthPageState createState() => _AuthPageState();
}

class _AuthPageState extends ModularState<AuthPage, AuthController> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _isLoading = false;

  handler() async {
    setState(() {
      _isLoading = true;
    });

    var email = _emailController.text;
    var password = _passwordController.text;

    final Response response =
        await widget.authController.login(email: email, password: password);

    if (response.data['access_token'] != null) {
      onSuccess();
    } else {
      onError(response.data['msg']);
    }
  }

  onSuccess() {
    setState(() {
      _isLoading = false;
    });
  }

  onError(String error) {
    setState(() {
      _isLoading = false;
    });
    AwesomeDialog(
        context: context,
        dialogType: DialogType.ERROR,
        title: "Falha no Login",
        padding: EdgeInsets.all(20),
        dismissOnBackKeyPress: false,
        dismissOnTouchOutside: false,
        body: Text(error),
        btnOkOnPress: () => null,
        btnOkText: "Entendi!")
      ..show();
  }

  onCad() {
    Modular.to.pushNamed("/new");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          padding: EdgeInsets.all(30),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(left: 25.0, right: 25.0),
                  child: Image.asset("assets/logo.png"),
                ),
                TextFormField(
                  controller: _emailController,
                  decoration: InputDecoration(
                      prefixIcon: Icon(Icons.email), labelText: "Email"),
                  keyboardType: TextInputType.emailAddress,
                  validator: (value) {
                    if (value.isEmpty || value.length <= 0) {
                      return "Favor digitar um email válido.";
                    }
                    return null;
                  },
                ),
                Divider(color: Colors.transparent),
                TextFormField(
                  controller: _passwordController,
                  decoration: InputDecoration(
                      prefixIcon: Icon(Icons.https), labelText: "Senha"),
                  validator: (value) {
                    if (value.isEmpty || value.length <= 0) {
                      return "Favor digitar um email válido.";
                    }
                    return null;
                  },
                  obscureText: true,
                  keyboardType: TextInputType.number,
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 25.0, bottom: 15.0),
                  child: _isLoading == true
                      ? Center(child: GenericProgressIndicator(false))
                      : RaisedButton(
                          onPressed: () {
                            FocusScope.of(context)
                                .requestFocus(new FocusNode());
                            var validation = _formKey.currentState.validate();
                            if (validation) {
                              handler();
                            }
                          },
                          child: Text(
                            "Entrar",
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                ),
                _isLoading == true
                    ? SizedBox()
                    : RaisedButton(
                        child: Text(
                          "Cadastre-se",
                          style: TextStyle(color: Colors.white),
                        ),
                        color: Settings.lightBlueColor,
                        onPressed: () {
                          onCad();
                        },
                      ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

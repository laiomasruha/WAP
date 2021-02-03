import 'dart:ui';

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:dio/dio.dart';
import 'package:flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:wapp_reports/app/components/progress-indicator.component.dart';
import 'package:wapp_reports/settings.dart';
import 'new_controller.dart';

class NewPage extends StatefulWidget {
  @override
  _NewPageState createState() => _NewPageState();
}

class _NewPageState extends State<NewPage> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _docController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final controller = Modular.get<NewController>();
  bool _isLoading = false;
  var maskFormatter = new MaskTextInputFormatter(
      mask: '###.###.###-##', filter: {"#": RegExp(r'[0-9]')});

  validate() {
    var validation = _formKey.currentState.validate();
    if (validation) {
      handler();
    }
  }

  handler() async {
    setState(() {
      _isLoading = true;
    });

    var name = _nameController.text;
    var email = _emailController.text;
    var password = _passwordController.text;
    var document = _docController.text;

    final Response response = await controller.register(
      email: email,
      password: password,
      document: document,
      name: name,
    );

    if (response.data['error'] == false && response.data != null) {
      onSuccess();
    } else {
      onError(response.data['msg']);
    }
  }

  onSuccess() {
    setState(() {
      _isLoading = false;
    });

    AwesomeDialog(
        context: context,
        dialogType: DialogType.SUCCES,
        title: "Seja bem-vindo(a)",
        padding: EdgeInsets.all(20),
        dismissOnBackKeyPress: false,
        dismissOnTouchOutside: false,
        body: Text(
            "Seu cadastro foi realizado com sucesso. Você terá 30 dias, a partir da confirmação do email que acabamos de enviar, para testar o WAPP Relatórios."),
        btnOkOnPress: () => Modular.to.pop(),
        btnOkText: "Entendi!")
      ..show();
  }

  onError(String error) {
    setState(() {
      _isLoading = false;
    });
    Flushbar(
      isDismissible: true,
      icon: Icon(
        Icons.warning,
        color: Colors.white,
      ),
      leftBarIndicatorColor: Colors.redAccent,
      title: "Falha no Login",
      messageText: Text(
        error,
        style: TextStyle(color: Colors.white),
      ),
      duration: Duration(seconds: 5),
    )..show(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Container(
                padding: EdgeInsets.all(20),
                child: Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 50,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Cadastro",
                            style: TextStyle(
                                color: Settings.blueColor,
                                fontWeight: FontWeight.w900,
                                fontSize: 30),
                          ),
                          FlatButton.icon(
                            onPressed: () => Modular.to.pop(),
                            icon: Icon(Icons.arrow_back,
                                color: Settings.lightBlueColor),
                            label: Text(
                              "Voltar",
                              style: TextStyle(color: Settings.lightBlueColor),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      TextFormField(
                        controller: _nameController,
                        decoration: InputDecoration(
                            prefixIcon: Icon(Icons.portrait),
                            labelText: "Nome"),
                        keyboardType: TextInputType.text,
                        validator: (value) {
                          if (value.isEmpty || value.length <= 0) {
                            return "Favor digitar um nome válido.";
                          }
                          return null;
                        },
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      TextFormField(
                        controller: _docController,
                        decoration: InputDecoration(
                            prefixIcon: Icon(Icons.credit_card),
                            labelText: "CPF"),
                        keyboardType: TextInputType.number,
                        inputFormatters: [maskFormatter],
                        validator: (value) {
                          if (value.isEmpty ||
                              value.length <= 0 ||
                              maskFormatter.getUnmaskedText().length != 11) {
                            return "Favor digitar um CPF válido.";
                          }
                          return null;
                        },
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      TextFormField(
                        controller: _emailController,
                        decoration: InputDecoration(
                            prefixIcon: Icon(Icons.email), labelText: "Email"),
                        keyboardType: TextInputType.emailAddress,
                        validator: (value) {
                          if (value.isEmpty || value.length <= 0) {
                            return "Favor digitar uma email válido.";
                          }
                          return null;
                        },
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      TextFormField(
                        controller: _passwordController,
                        decoration: InputDecoration(
                            prefixIcon: Icon(Icons.lock), labelText: "Senha"),
                        keyboardType: TextInputType.number,
                        obscureText: true,
                        validator: (value) {
                          if (value.isEmpty || value.length <= 0) {
                            return "Favor digitar uma senha válida.";
                          }
                          return null;
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          SizedBox(
            width: double.infinity,
            child: RaisedButton(
              onPressed: () => validate(),
              child: _isLoading
                  ? GenericProgressIndicator(true)
                  : Text(
                      "Cadastrar",
                      style: TextStyle(color: Colors.white),
                    ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(0.0),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

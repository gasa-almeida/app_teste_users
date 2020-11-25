import 'package:app_teste_user/components/troca_rash.dart';
import 'package:app_teste_user/screens/login/login_screen.dart';
import 'package:app_teste_user/screens/signup/components.dart';
import 'package:app_teste_user/stores/signup_store.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_mobx/flutter_mobx.dart';


class SignUpScreen extends StatefulWidget {
  SignUpScreen({this.idUser, this.nameUser, this.dataNasc, this.email, this.password});

  final String idUser;
  final String nameUser;
  final String dataNasc;
  final String password;
  final String email;

  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final SignupStore signupStore = new SignupStore();
  final TextEditingController controllerIdUser = TextEditingController();
  final TextEditingController controllerNameUser = TextEditingController();
  final TextEditingController controllerDataNascUser = TextEditingController();
  final TextEditingController controllerEmailUser = TextEditingController();
  final TextEditingController controllerPassUser = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controllerNameUser.text = widget.nameUser;
    controllerEmailUser.text = widget.email;
    controllerDataNascUser.text = widget.dataNasc;
    controllerPassUser.text = widget.password;
    signupStore.idUser = widget.idUser;

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cadastro Usuário'),
        centerTitle: true,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _trocaHash,
        child: Icon(Icons.http),
      ),
      body: Container(
        alignment: Alignment.center,
        child: Padding(
          padding: EdgeInsets.only(bottom: 16.0),
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.only(bottom: 16.0),
              child: Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16.0)),
                margin: const EdgeInsets.symmetric(horizontal: 32.0),
                elevation: 8.0,
                child: Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text("Preencha todos os campos", style: TextStyle(color: Colors.blue),textAlign: TextAlign.center,),
                      FieldTitle(
                        title: 'Nome',
                        subtitle: '',
                      ),
                      Observer(
                        builder: (_) {
                          return TextField(
                            enabled: !signupStore.loading,
                            controller: controllerNameUser,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              hintText: 'Exemplo: João da Silva',
                              isDense: true,
                              errorText: signupStore.nameError,
                            ),
                            onChanged: signupStore.setName,
                          );
                        },
                      ),
                      const SizedBox(
                        height: 16.0,
                      ),
                      FieldTitle(
                        title: 'E-mail',
                        subtitle: '',
                      ),
                      Observer(
                        builder: (_) {
                          return TextField(
                            controller: controllerEmailUser,
                            enabled: !signupStore.loading,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              hintText: 'Exemplo: joao@email.com',
                              isDense: true,
                              errorText: signupStore.emailError,
                            ),
                            keyboardType: TextInputType.emailAddress,
                            autocorrect: false,
                            onChanged: signupStore.setEmail,
                          );
                        },
                      ),
                      const SizedBox(
                        height: 16.0,
                      ),
                      FieldTitle(
                        title: 'Data de Nascimento',
                        subtitle: '',
                      ),
                      Observer(
                        builder: (_) {
                          return TextField(
                            controller: controllerDataNascUser,
                            enabled: !signupStore.loading,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              hintText: 'Exemplo: 10102000',
                              isDense: true,
                              errorText: signupStore.dataNascError,
                            ),
                            onChanged: signupStore.setDataNasc,
                            keyboardType: TextInputType.datetime,
                          );
                        },
                      ),
                      const SizedBox(
                        height: 16.0,
                      ),
                      FieldTitle(
                        title: 'Senha',
                        subtitle: 'Use letras, números e caracteres especiais',
                      ),
                      Observer(
                        builder: (_) {
                          return TextField(
                            controller: controllerPassUser,
                            enabled: !signupStore.loading,
                            decoration: InputDecoration(
                                border: const OutlineInputBorder(),
                                isDense: true,
                                errorText: signupStore.pass1Error),
                            onChanged: signupStore.setPass1,
                            obscureText: true,
                          );
                        },
                      ),
                      const SizedBox(
                        height: 16.0,
                      ),
                      FieldTitle(
                        title: 'Confirmar senha',
                        subtitle: 'Repita a senha',
                      ),
                      Observer(builder: (_) {
                        return TextField(
                          enabled: !signupStore.loading,
                          decoration: InputDecoration(
                            border: const OutlineInputBorder(),
                            isDense: true,
                            errorText: signupStore.pass2Error,
                          ),
                          obscureText: true,
                          onChanged: signupStore.setPass2,
                        );
                      }),
                      Observer(
                        builder: (_) {
                          return Container(
                            margin: const EdgeInsets.symmetric(vertical: 12.0),
                            height: 40.0,
                            child: RaisedButton(
                              color: Colors.blue,
                              disabledColor: Colors.blue.withAlpha(120),
                              child: signupStore.loading
                                  ? CircularProgressIndicator()
                                  : Text('Cadastrar'),
                              textColor: Colors.white,
                              elevation: 0,
                              onPressed: widget.idUser != null ? signupStore.idUserEmpty: signupStore.signUpPressed,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20.0),
                              ),
                            ),
                          );
                        },
                      ),
                      Divider(
                        color: Colors.black,
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 8.0),
                        child: Wrap(
                          alignment: WrapAlignment.center,
                          children: [
                            const Text(
                              'Já tem uma conta? ',
                              style: TextStyle(fontSize: 16.0),
                            ),
                            GestureDetector(
                              onTap: () {
                                Navigator.of(context).push(MaterialPageRoute(builder: (_) => LoginScreen()));
                              },
                              child: Text(
                                'Entrar ',
                                style: TextStyle(
                                  decoration: TextDecoration.underline,
                                  color: Colors.purple,
                                  fontSize: 16.0,
                                ),
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  _trocaHash() {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return TrocaHash();
        });
  }



}

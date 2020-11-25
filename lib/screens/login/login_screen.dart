import 'package:app_teste_user/components/troca_rash.dart';
import 'package:app_teste_user/screens/signup/signup_screen.dart';
import 'package:app_teste_user/screens/userslist/users_screen.dart';
import 'package:app_teste_user/stores/login_store.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';


class LoginScreen extends StatefulWidget {

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController controllerEmail = TextEditingController();
  final TextEditingController controllerPass = TextEditingController();
  final LoginStore loginStore = GetIt.I<LoginStore>();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controllerEmail.clear();
    controllerPass.clear();
    loginStore.setApi;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
        centerTitle: true,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _trocaHash,
        child: Icon(Icons.http),
      ),
      body: Container(
        alignment: Alignment.center,
        child: SingleChildScrollView(
          child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16.0)
            ),
            margin: const EdgeInsets.symmetric(horizontal: 32.0),
            elevation: 8.0,
            child: Padding(
              padding: EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text("", textAlign: TextAlign.center, style: TextStyle(fontSize: 16.0, color: Colors.grey[900]),),
                  Padding(
                    padding: const EdgeInsets.only(left: 3.0, bottom: 4.0, top: 8.0,),
                    child: Text(
                      'E-mail',
                      style: TextStyle(
                        color: Colors.grey[800],
                        fontSize: 16.0,
                      ),
                    ),
                  ),
                  Observer(
                    builder: (_){
                      return TextField(
                        controller: controllerEmail,
                        enabled: !loginStore.loading,
                        decoration: InputDecoration(
                          border: const OutlineInputBorder(),
                          isDense: true,
                          errorText: loginStore.emailError,
                        ),
                        keyboardType: TextInputType.emailAddress,
                        onChanged: loginStore.setEmail,
                      );
                    },
                  ),

                  Padding(
                    padding: const EdgeInsets.only(left: 3.0, bottom: 4.0, top: 8.0,),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Senha',
                          style: TextStyle(
                            color: Colors.grey[800],
                            fontSize: 16.0,
                          ),
                        ),
                        GestureDetector(
                          child: Text(
                            'Esqueceu sua senha? ',
                            style: TextStyle(
                              decoration: TextDecoration.underline,
                              color: Colors.purple,
                            ),
                          ),
                          onTap: (){
                            Navigator.of(context).pushReplacement(
                                MaterialPageRoute(builder: (context)=> SignUpScreen(
                                  nameUser: "Informe os dados novamente"  ,
                                  email: "informe o seu e-mail" ,
                                  password: "",
                                  dataNasc: "",
                                ))
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                  Observer(
                    builder: (_){
                      return TextField(
                        controller: controllerPass,
                        enabled: !loginStore.loading,
                        decoration: InputDecoration(
                          border: const OutlineInputBorder(),
                          isDense: true,
                          errorText: loginStore.passwordError,
                        ),
                        obscureText: true,
                        onChanged: loginStore.setPass1,
                      );
                    },
                  ),
                  Observer(
                    builder: (_){
                      return Container(
                        margin: const EdgeInsets.symmetric(vertical: 12.0),
                        height: 40.0,
                        child: RaisedButton(
                          disabledColor: Colors.blue.withAlpha(120),
                          color: Colors.blue,
                          child: loginStore.loading ?
                          CircularProgressIndicator(
                            valueColor: AlwaysStoppedAnimation(Colors.white),
                          ) :  Text('Entrar'),
                          textColor: Colors.white,
                          elevation: 0,
                          onPressed: (){
                            if(controllerEmail.text != "" && controllerPass.text != ""){
                              loginStore.loginPressed;
                              Navigator.of(context).push(MaterialPageRoute(builder: (_) => UsersListScreen()));
                            }

                          },
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                        ),
                      );
                    },
                  ),
                  Divider( color: Colors.grey,),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 8.0),
                    child: Wrap(
                      alignment: WrapAlignment.center,
                      children: [

                        GestureDetector(
                          onTap: (){
                            Navigator.of(context).push(MaterialPageRoute(builder: (_) => SignUpScreen()));
                          },
                          child: Text(
                            'Cadastre-se ',
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

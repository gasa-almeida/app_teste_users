import 'dart:convert';
import 'package:app_teste_user/screens/login/login_screen.dart';
import 'package:app_teste_user/screens/signup/signup_screen.dart';
import 'package:app_teste_user/stores/login_store.dart';
import 'package:app_teste_user/stores/signup_store.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;


class UsersListScreen extends StatefulWidget {
  @override
  _UsersListScreenState createState() => _UsersListScreenState();
}

class _UsersListScreenState extends State<UsersListScreen> {

  final LoginStore loginStore = GetIt.I<LoginStore>();
  final TextEditingController controllerText = new TextEditingController();
  final SignupStore signupStore = SignupStore();
  List<dynamic> dadosUsuarios = [];


  @override
  void initState() {

    getDados();
    // TODO: implement initState
    super.initState();
  }


  @override
  Widget build(BuildContext context) {

    return SafeArea(
        child: Scaffold(
          body: Container(
            margin: const EdgeInsets.fromLTRB(32, 0, 32, 32),
            child: Column(
                  children: <Widget>[
                  Padding(
                      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 2),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        'Usuários',
                        style: TextStyle(
                            color: Colors.blue,
                            fontWeight: FontWeight.w900,
                            fontSize: 28
                        ),
                      ),
                      IconButton(
                        icon: Icon(Icons.exit_to_app),
                        color: Colors.blue,
                        onPressed: (){
                          Navigator.of(context).pushReplacement(
                              MaterialPageRoute(builder: (context)=>LoginScreen())
                          );
                        },
                      ),
                    ],
                  ),
                ),
              Expanded(
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  elevation: 16,
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      children: <Widget>[
                        const SizedBox(height: 8,),
                        Expanded(
                          child: FutureBuilder<Map>(
                            future: getDados(),
                            builder: (contex, snapshot){
                              switch(snapshot.connectionState){
                                case ConnectionState.none:
                                case ConnectionState.waiting:
                                  return Center(
                                    child: Text("Carregando...", style: TextStyle(color: Colors.black, fontSize: 25.0), textAlign: TextAlign.center,),
                                  );
                              default:
                                if(snapshot.hasError){
                                  return Center(
                                    child: Text("Erro... :(", style: TextStyle(color: Colors.black, fontSize: 25.0), textAlign: TextAlign.center,),
                                  );
                                } else{
                                  return ListView.builder(
                                    itemCount: dadosUsuarios.length,
                                    itemBuilder: (context, index){
                                      return Card(
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          children: [
                                            Column(
                                              mainAxisAlignment: MainAxisAlignment.center,
                                              children: [
                                                dadosUsuarios[index]['name'] != null ? Text(dadosUsuarios[index]['name'],) : Text("No data"),
                                                dadosUsuarios[index]['email'] != null ? Text(dadosUsuarios[index]['email'],) : Text("No data"),
                                                dadosUsuarios[index]['datanasc'] != null ? Text(dadosUsuarios[index]['datanasc'],) : Text("No data"),
                                              ],
                                            ),
                                           SizedBox(
                                             width: 60.0,
                                             height: 120.0,
                                           ),
                                           Column(
                                             crossAxisAlignment: CrossAxisAlignment.end,
                                             children: [
                                               IconButton(icon: Icon(Icons.edit,),
                                                   onPressed: (){
                                                     Navigator.of(context).pushReplacement(
                                                         MaterialPageRoute(builder: (context)=>SignUpScreen(
                                                           idUser: dadosUsuarios[index]['_id'] ,
                                                           nameUser: dadosUsuarios[index]['name'] ,
                                                           email: dadosUsuarios[index]['email'],
                                                           password: dadosUsuarios[index]['password'],
                                                           dataNasc: dadosUsuarios[index]['datanasc'],
                                                         ))
                                                     );
                                                   }
                                               ),
                                               IconButton(icon: Icon(Icons.delete,),
                                                   onPressed: (){
                                                      signupStore.idUser = dadosUsuarios[index]['_id'];
                                                      signupStore.deleteUser();
                                                      setState(() {

                                                      });
                                                   }
                                               ),
                                             ],
                                           ),

                                          ],
                                        ),
                                      );
                                    },
                                  );
                                }
                              }
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              ],
            ),
          ),
        ),
    );
  }

  Future<Map<String, dynamic>> getDados() async {
    String urlAPI = loginStore.urlApi.toString();
    final rotaLogin = "$urlAPI/users";
    final header = {"Content-Type" : "application/json", "authorization" : "authorization"};

    http.Response response = await http.get(rotaLogin);
    dadosUsuarios = json.decode(response.body.toString());

    print(dadosUsuarios.toString());


  }

}

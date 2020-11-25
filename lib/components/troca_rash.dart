import 'package:app_teste_user/stores/login_store.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';


class TrocaHash extends StatelessWidget {

  final LoginStore loginStore = GetIt.I<LoginStore>();
  final TextEditingController controllerUrl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      actions: <Widget>[
        FlatButton(
            onPressed: (){
              Navigator.of(context).pop();
              loginStore.urlApi = controllerUrl.text;
              controllerUrl.clear();
            },
            child: Text("Trocar Url"))
      ],
      title: Text("Troca de Url", textAlign: TextAlign.center,),
      content: Card(
        child: Observer(
          builder: (_){
            return TextField(
              controller: controllerUrl,
              enabled: !loginStore.loading,
              decoration: InputDecoration(
                border: const OutlineInputBorder(),
                isDense: true,
                errorText: loginStore.passwordError,
              ),
              //onChanged: loginStore.setApi,
            );
          },
        ),
      ),
    );
  }
}

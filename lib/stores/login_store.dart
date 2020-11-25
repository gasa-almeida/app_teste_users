import 'dart:convert';
import 'package:crypto/crypto.dart';
import 'package:app_teste_user/helpers/extensions.dart';
import 'package:mobx/mobx.dart';
import 'package:http/http.dart' as http;
part 'login_store.g.dart';




class LoginStore = _LoginStore with _$LoginStore;

abstract class _LoginStore with Store {

  //observables são as variáveis observaveis para saber se houve mudança
  //actions
  //computeds

  @observable
  String email;

  @action
  void setEmail(String value) => email = value;

  @computed
  bool get emailValid => email != null && email.isEmailValid() && email.isNotEmpty;
  String get emailError {
    if (email == null || emailValid)
      return null;
    else if (email.isEmpty)
      return 'Campo obrigatório';
    else
      return 'E-mail inválido';
  }

  @observable
  String password;

  @action
  void setPass1(String value) => password = value;

  @computed
  bool get passValid => password != null && password.length > 4;
  String get passwordError {
    if (password == null || passValid)
      return null;
    else if (password.isEmpty)
      return 'Campo obrigatório';
    else
      return 'Senha muito curta';
  }

  @observable
  bool loading = false;
  String error;
  var existe = false;

  @computed
  Function get loginPressed => emailValid && passValid && !loading ? _login : null;

  @action
  Future<void> _login() async {
    loading = true;

    final rotaLogin = "$urlApi/users";
    final header = {"Content-Type" : "application/json", "authorization" : "authorization"};

    String passToMd5 (String value){
      return md5.convert(utf8.encode(value)).toString();
    }

    Map _dadosForm = {
      "email": email,
      "password": passToMd5(password)
    };

    String _jsonDadosForm = json.encode(_dadosForm);
    http.Response response = await http.get(rotaLogin + _jsonDadosForm);
    existe = json.decode(response.body)["Status"];

    print("Existe" + existe.toString());

    loading = false;
  }

  @observable
  String urlApi;

  @action
  void setApi(String value) => urlApi = value;


}
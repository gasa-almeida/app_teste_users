import 'dart:convert';
import 'package:app_teste_user/stores/login_store.dart';
import 'package:get_it/get_it.dart';
import 'package:mobx/mobx.dart';
import 'package:app_teste_user/helpers/extensions.dart';
import 'package:http/http.dart' as http;
import 'package:crypto/crypto.dart';
part 'signup_store.g.dart';

class SignupStore = _SignupStore with _$SignupStore;

abstract class _SignupStore with Store {
  //observables são as variáveis/objetos observaveis que representam e sofrem alterações
  //actions são as funções que realizam alterações nos observáveis
  //computeds reune os dados que derivam dos observáveis para realizar um validação por exemplo



  @observable
  String name;

  @action
  void setName(String value) => name = value;

  @computed
  bool get nameValid => name != null && name.length > 6;
  String get nameError {
    if (name == null || nameValid)
      return null;
    else if (name.isEmpty)
      return 'Campo obrigatório';
    else
      return 'Nome muito curto';
  }

  @observable
  String email;

  @action
  void setEmail(String value) => email = value;

  @computed
  bool get emailValid => email != null && email.isEmailValid();
  String get emailError {
    if (email == null || emailValid)
      return null;
    else if (email.isEmpty)
      return 'Campo obrigatório';
    else
      return 'E-mail inválido';
  }

  @observable
  String data_nasc;

  @action
  void setDataNasc(String value) => data_nasc = value;

  @computed
  bool get dataNascValid => data_nasc != null && data_nasc.length == 8;
  String get dataNascError {
    if (data_nasc == null || dataNascValid)
      return null;
    else if (data_nasc.isEmpty)
      return 'Campo obrigatório';
    else
      return 'Data inválida';
  }

  @observable
  String pass1;

  @action
  void setPass1(String value) => pass1 = value;

  @computed
  bool get pass1Valid => pass1 != null && pass1.length > 4;
  String get pass1Error {
    if (pass1 == null || pass1Valid)
      return null;
    else if (pass1.isEmpty)
      return 'Campo obrigatório';
    else
      return 'Senha muito curta';
  }

  @observable
  String pass2;

  @action
  void setPass2(String value) => pass2 = value;

  @computed
  bool get pass2Valid => pass2 != null && pass2 == pass1;
  String get pass2Error {
    if (pass2 == null || pass2Valid)
      return null;
    else if (pass2.isEmpty)
      return 'Campo obrigatório';
    else
      return 'Senhas não coincidem';
  }

  @computed
  bool get isFormValid =>
      nameValid && dataNascValid && emailValid && pass1Valid && pass2Valid;

  @computed
  Function get signUpPressed => (isFormValid && !loading) ? _signUp : null;

  @observable
  bool loading = false;
  String error;

  @action
  Future<void> _signUp() async {
    loading = true;

    final LoginStore loginStore = GetIt.I<LoginStore>();
    String urlApi = loginStore.urlApi;
    
    final rotaLogin = "$urlApi/users";
    final header = {"Content-Type" : "application/json", "authorization" : "authorization"};
    
    String passToMd5 (String value){
      return md5.convert(utf8.encode(value)).toString();
    }
    
    Map _dadosForm = {
      "name": name,
      "password": passToMd5(pass1),
      "datanasc": data_nasc,
      "email": email
    };

    String _jsonDadosForm = json.encode(_dadosForm);
    http.Response response = await http.post(rotaLogin, headers: header, body: _jsonDadosForm);

    loading = false;
  }

  @observable
  String idUser;

  @computed
  Function get idUserEmpty => idUser.isEmpty ? signUpPressed : _editUser;

  @action
  Future<void> _editUser () async {
    loading = true;
    final LoginStore loginStore = GetIt.I<LoginStore>();
    String urlApi = loginStore.urlApi;

    final rotaLogin = "$urlApi/users/$idUser";
    final header = {"Content-Type" : "application/json", "authorization" : "authorization"};

    String passToMd5 (String value){
      return md5.convert(utf8.encode(value)).toString();
    }

    Map _dadosForm = {
      "name": name,
      "password": passToMd5(pass1),
      "datanasc": data_nasc,
      "email": email
    };

    String _jsonDadosForm = json.encode(_dadosForm);
    http.Response response = await http.put(rotaLogin, headers: header, body: _jsonDadosForm);

    loading = false;

  }



  @action
  Future<void> deleteUser () async {

    final LoginStore loginStore = GetIt.I<LoginStore>();
    String urlApi = loginStore.urlApi;

    loading = true;
    final rotaLogin = "$urlApi/users/$idUser";
    final header = {"Content-Type" : "application/json", "authorization" : "authorization"};

    http.Response response = await http.delete(rotaLogin);

    loading = false;

  }
  
  
}

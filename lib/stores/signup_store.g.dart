// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'signup_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$SignupStore on _SignupStore, Store {
  Computed<bool> _$nameValidComputed;

  @override
  bool get nameValid => (_$nameValidComputed ??=
          Computed<bool>(() => super.nameValid, name: '_SignupStore.nameValid'))
      .value;
  Computed<bool> _$emailValidComputed;

  @override
  bool get emailValid =>
      (_$emailValidComputed ??= Computed<bool>(() => super.emailValid,
              name: '_SignupStore.emailValid'))
          .value;
  Computed<bool> _$dataNascValidComputed;

  @override
  bool get dataNascValid =>
      (_$dataNascValidComputed ??= Computed<bool>(() => super.dataNascValid,
              name: '_SignupStore.dataNascValid'))
          .value;
  Computed<bool> _$pass1ValidComputed;

  @override
  bool get pass1Valid =>
      (_$pass1ValidComputed ??= Computed<bool>(() => super.pass1Valid,
              name: '_SignupStore.pass1Valid'))
          .value;
  Computed<bool> _$pass2ValidComputed;

  @override
  bool get pass2Valid =>
      (_$pass2ValidComputed ??= Computed<bool>(() => super.pass2Valid,
              name: '_SignupStore.pass2Valid'))
          .value;
  Computed<bool> _$isFormValidComputed;

  @override
  bool get isFormValid =>
      (_$isFormValidComputed ??= Computed<bool>(() => super.isFormValid,
              name: '_SignupStore.isFormValid'))
          .value;
  Computed<Function> _$signUpPressedComputed;

  @override
  Function get signUpPressed =>
      (_$signUpPressedComputed ??= Computed<Function>(() => super.signUpPressed,
              name: '_SignupStore.signUpPressed'))
          .value;
  Computed<Function> _$idUserEmptyComputed;

  @override
  Function get idUserEmpty =>
      (_$idUserEmptyComputed ??= Computed<Function>(() => super.idUserEmpty,
              name: '_SignupStore.idUserEmpty'))
          .value;

  final _$nameAtom = Atom(name: '_SignupStore.name');

  @override
  String get name {
    _$nameAtom.reportRead();
    return super.name;
  }

  @override
  set name(String value) {
    _$nameAtom.reportWrite(value, super.name, () {
      super.name = value;
    });
  }

  final _$emailAtom = Atom(name: '_SignupStore.email');

  @override
  String get email {
    _$emailAtom.reportRead();
    return super.email;
  }

  @override
  set email(String value) {
    _$emailAtom.reportWrite(value, super.email, () {
      super.email = value;
    });
  }

  final _$data_nascAtom = Atom(name: '_SignupStore.data_nasc');

  @override
  String get data_nasc {
    _$data_nascAtom.reportRead();
    return super.data_nasc;
  }

  @override
  set data_nasc(String value) {
    _$data_nascAtom.reportWrite(value, super.data_nasc, () {
      super.data_nasc = value;
    });
  }

  final _$pass1Atom = Atom(name: '_SignupStore.pass1');

  @override
  String get pass1 {
    _$pass1Atom.reportRead();
    return super.pass1;
  }

  @override
  set pass1(String value) {
    _$pass1Atom.reportWrite(value, super.pass1, () {
      super.pass1 = value;
    });
  }

  final _$pass2Atom = Atom(name: '_SignupStore.pass2');

  @override
  String get pass2 {
    _$pass2Atom.reportRead();
    return super.pass2;
  }

  @override
  set pass2(String value) {
    _$pass2Atom.reportWrite(value, super.pass2, () {
      super.pass2 = value;
    });
  }

  final _$loadingAtom = Atom(name: '_SignupStore.loading');

  @override
  bool get loading {
    _$loadingAtom.reportRead();
    return super.loading;
  }

  @override
  set loading(bool value) {
    _$loadingAtom.reportWrite(value, super.loading, () {
      super.loading = value;
    });
  }

  final _$idUserAtom = Atom(name: '_SignupStore.idUser');

  @override
  String get idUser {
    _$idUserAtom.reportRead();
    return super.idUser;
  }

  @override
  set idUser(String value) {
    _$idUserAtom.reportWrite(value, super.idUser, () {
      super.idUser = value;
    });
  }

  final _$_signUpAsyncAction = AsyncAction('_SignupStore._signUp');

  @override
  Future<void> _signUp() {
    return _$_signUpAsyncAction.run(() => super._signUp());
  }

  final _$_editUserAsyncAction = AsyncAction('_SignupStore._editUser');

  @override
  Future<void> _editUser() {
    return _$_editUserAsyncAction.run(() => super._editUser());
  }

  final _$deleteUserAsyncAction = AsyncAction('_SignupStore.deleteUser');

  @override
  Future<void> deleteUser() {
    return _$deleteUserAsyncAction.run(() => super.deleteUser());
  }

  final _$_SignupStoreActionController = ActionController(name: '_SignupStore');

  @override
  void setName(String value) {
    final _$actionInfo = _$_SignupStoreActionController.startAction(
        name: '_SignupStore.setName');
    try {
      return super.setName(value);
    } finally {
      _$_SignupStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setEmail(String value) {
    final _$actionInfo = _$_SignupStoreActionController.startAction(
        name: '_SignupStore.setEmail');
    try {
      return super.setEmail(value);
    } finally {
      _$_SignupStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setDataNasc(String value) {
    final _$actionInfo = _$_SignupStoreActionController.startAction(
        name: '_SignupStore.setDataNasc');
    try {
      return super.setDataNasc(value);
    } finally {
      _$_SignupStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setPass1(String value) {
    final _$actionInfo = _$_SignupStoreActionController.startAction(
        name: '_SignupStore.setPass1');
    try {
      return super.setPass1(value);
    } finally {
      _$_SignupStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setPass2(String value) {
    final _$actionInfo = _$_SignupStoreActionController.startAction(
        name: '_SignupStore.setPass2');
    try {
      return super.setPass2(value);
    } finally {
      _$_SignupStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
name: ${name},
email: ${email},
data_nasc: ${data_nasc},
pass1: ${pass1},
pass2: ${pass2},
loading: ${loading},
idUser: ${idUser},
nameValid: ${nameValid},
emailValid: ${emailValid},
dataNascValid: ${dataNascValid},
pass1Valid: ${pass1Valid},
pass2Valid: ${pass2Valid},
isFormValid: ${isFormValid},
signUpPressed: ${signUpPressed},
idUserEmpty: ${idUserEmpty}
    ''';
  }
}

import 'package:mobx/mobx.dart';

part 'page_store.g.dart';

class PageStore = _PageStore with _$PageStore;

abstract class _PageStore with Store {

  //observables são as variáveis observaveis para saber se houve mudança
  //actions
  //computeds

  @observable
  int page = 0;

  @action
  void setpage(int value) => page = value;

}


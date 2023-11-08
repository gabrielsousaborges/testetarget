import 'package:mobx/mobx.dart';
part 'login_store.g.dart';

class LoginStore = _LoginStoreBase with _$LoginStore;

abstract class _LoginStoreBase with Store {
  @observable
  String email = "";

  @action
  void setEmail(String value) => email = value;

  @observable
  String password = "";

  @action
  void setPassword(String value) => password = value;

  @observable
  bool loading = false;

  @action
  Future<void> login() async {
    loading = true;

    await Future.delayed(Duration(seconds: 1));

    loading = false;

    email = "";
    password = "";
  }

  @computed
  bool get isEmailValid => email.length < 20;

  @computed
  bool get isPasswordValid =>
      RegExp(r"^[a-zA-Z0-9]").hasMatch(password) &&
      password.length >= 2 &&
      password.length < 20;

  @computed
  bool get isFormValid => isEmailValid && isPasswordValid;
}

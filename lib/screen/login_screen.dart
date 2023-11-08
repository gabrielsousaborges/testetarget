import 'package:flutter/material.dart';
import 'package:testetarget/screen/info_screen.dart';
import 'package:testetarget/store/login_store.dart';
import 'package:testetarget/utils/http.dart';
import 'package:testetarget/widget/custom_text_field.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  LoginStore loginStore = LoginStore();
  HttpConnet httpPrivace = HttpConnet();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Stack(
          children: [
            Container(
              alignment: Alignment.center,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [Color(0xff1f5466), Color(0xff2d8c88)],
                    stops: [0.4, 0.8]),
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 30),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        Padding(
                          padding: EdgeInsets.only(left: 10, bottom: 5),
                          child: Text(
                            "Usuário",
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ],
                    ),
                    Observer(
                      builder: (_) {
                        return CustomTextField(
                          prefix: Icon(Icons.person),
                          onChanged: loginStore.setEmail,
                          enabled: !loginStore.loading,
                        );
                      },
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: <Widget>[
                        Padding(
                          padding: EdgeInsets.only(left: 10, bottom: 5),
                          child: Text(
                            "Senha",
                            style: TextStyle(color: Colors.white),
                          ),
                        )
                      ],
                    ),
                    Observer(
                      builder: (_) {
                        return CustomTextField(
                          prefix: Icon(Icons.lock),
                          onChanged: loginStore.setPassword,
                          enabled: !loginStore.loading,
                        );
                      },
                    ),
                    SizedBox(
                      height: 45,
                    ),
                    Observer(
                      builder: (_) {
                        return ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Theme.of(context).primaryColor,
                            fixedSize: Size(150, 5),
                          ),
                          child: loginStore.loading
                              ? CircularProgressIndicator(
                                  valueColor:
                                      AlwaysStoppedAnimation(Colors.white),
                                )
                              : Text(
                                  "Entrar",
                                  style: TextStyle(
                                    color: Colors.white,
                                  ),
                                ),
                          onPressed: () {
                            if (loginStore.isFormValid) {
                              loginStore.login();
                              Navigator.of(context).pushReplacement(
                                MaterialPageRoute(
                                  builder: (context) => InfoScreen(),
                                ),
                              );
                            } else {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  backgroundColor: Colors.red,
                                  content: Text("Erro ao realizar o login!"),
                                ),
                              );
                            }
                          },
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(bottom: 20),
              child: Container(
                alignment: Alignment.bottomCenter,
                child: GestureDetector(
                  onTap: () async {
                    // Quando o texto for clicado, navegue para google.com.br.
                    httpPrivace.redirectLink();
                  },
                  child: Text(
                    'Política de Privacidade',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

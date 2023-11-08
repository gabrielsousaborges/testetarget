import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:testetarget/store/info_store.dart';

class InfoScreen extends StatefulWidget {
  const InfoScreen({super.key});

  @override
  State<InfoScreen> createState() => _InfoScreenState();
}

class _InfoScreenState extends State<InfoScreen> {
  TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final infoStore = InfoStore();

    infoStore.findListLocal();

    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Container(
          alignment: Alignment.center,
          decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [Color(0xff1f5466), Color(0xff2d8c88)],
                stops: [0.4, 0.8]),
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 40, vertical: 30),
            child: Column(
              children: <Widget>[
                Card(
                  color: Colors.white,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5)),
                  elevation: 2,
                  child: Container(
                    height: 250,
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      child: Observer(
                        builder: (_) {
                          return ListView.separated(
                            itemCount: infoStore.listInfo.length,
                            itemBuilder: (_, index) {
                              final todoInfo = infoStore.listInfo[index];
                              return Observer(
                                builder: (_) {
                                  return ListTile(
                                    contentPadding:
                                        EdgeInsets.symmetric(horizontal: 1),
                                    title: Text(
                                      todoInfo,
                                      style: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w600),
                                    ),
                                    trailing: Wrap(
                                      spacing: -16,
                                      children: [
                                        IconButton(
                                          onPressed: () {},
                                          icon: Icon(Icons.border_color_sharp),
                                        ),
                                        IconButton(
                                          icon: Icon(Icons.close_sharp),
                                          onPressed: () {
                                            showDialog(
                                              context: context,
                                              builder: (BuildContext bc) {
                                                return AlertDialog(
                                                  title: Text(
                                                      "Excluir Informação ?"),
                                                  actions: [
                                                    TextButton(
                                                        onPressed: () {
                                                          Navigator.pop(
                                                              context);
                                                        },
                                                        child:
                                                            Text("Cancelar")),
                                                    TextButton(
                                                      onPressed: () {
                                                        infoStore.removeList(
                                                            todoInfo);

                                                        Navigator.pop(context);
                                                      },
                                                      child: Text("Excluir"),
                                                    ),
                                                  ],
                                                );
                                              },
                                            );
                                          },
                                        )
                                      ],
                                    ),
                                  );
                                },
                              );
                            },
                            separatorBuilder: (_, __) {
                              return Divider();
                            },
                          );
                        },
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 34,
                ),
                Observer(
                  builder: (_) {
                    return TextField(
                      decoration: InputDecoration(
                        hintText: "Digite seu texto",
                        contentPadding: EdgeInsets.symmetric(vertical: 10),
                        filled: true,
                        fillColor: Colors.white,
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5),
                            borderSide: BorderSide.none),
                      ),
                      controller: controller,
                      onChanged: infoStore.setNewInfo,
                      onSubmitted: (_) {
                        if (controller.text.isNotEmpty) {
                          infoStore.addList();
                          WidgetsBinding.instance
                              .addPostFrameCallback((_) => controller.clear());
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              backgroundColor: Colors.red,
                              content: Text("Valor deve ser preenchido"),
                            ),
                          );
                        }
                      },
                      textAlign: TextAlign.center,
                      style:
                          TextStyle(fontSize: 14, fontWeight: FontWeight.w700),
                    );
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

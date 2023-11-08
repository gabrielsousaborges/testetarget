import 'package:mobx/mobx.dart';
import 'package:testetarget/utils/localstorage.dart';
part 'info_store.g.dart';

class InfoStore = _InfoStoreBase with _$InfoStore;

abstract class _InfoStoreBase with Store {
  _InfoStoreBase() {
    findListInfo();
    findListLocal();
  }
  @observable
  String newinfo = "";

  @observable
  List<dynamic> listInfo = [].asObservable();

  @observable
  List<dynamic> datainfo = [].asObservable();

  @action
  void addList() {
    listInfo.add(newinfo);
    addInfoList(listInfo);
  }

  @action
  void removeList(String value) => listInfo.remove(value);

  @action
  void setNewInfo(String value) => newinfo = value;

  @action
  Future<void> addInfoList(List<dynamic> infoList) async {
    await LocalStorage.setStorageList("infoLista", infoList);
    await findListLocal();
  }

  @action
  findListInfo() async {
    List<dynamic> retornInfo =
        await LocalStorage.getStorageList("infoLista") ?? [];
    datainfo = retornInfo;
  }

  @action
  atualizaLista(List<dynamic> value) {
    listInfo = value;
  }

  Future<void> findListLocal() async {
    List<dynamic> returnList =
        await LocalStorage.getStorageList("infoLista") ?? [];

    listInfo = returnList.asObservable();
  }

  @computed
  bool get isFormValid => newinfo.isNotEmpty;
}

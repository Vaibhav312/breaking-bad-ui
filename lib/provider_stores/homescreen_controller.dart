import 'package:demoproject/modals/homescreen_models/characters_model.dart';
import 'package:demoproject/utils/global.dart';
import 'package:flutter/material.dart';

class HomeScreenProvider extends ChangeNotifier {
  bool isLoading = false;
  bool showDetails = false;
  late CharactersModelList charactersModelList;
  CharactersModel? charactersModel;

  void getAPIData(context) async {
    isLoading = true;
    var _data = await authController.getCharacterData();
    charactersModelList = CharactersModelList.fromJson(_data);

    isLoading = false;
    notifyListeners();
  }

  void onPressStart(CharactersModel data) {
    charactersModel = data;
    showDetails = true;
    notifyListeners();
  }

  void onPressEnd() {
    charactersModel = null;
    showDetails = false;
    notifyListeners();
  }
}

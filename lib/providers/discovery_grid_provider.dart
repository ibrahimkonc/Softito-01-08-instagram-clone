import 'dart:convert';

import 'package:flutter/widgets.dart';
import 'package:instagram_clone/models/user_model.dart';

import '../constants/user_data.dart';

class DiscoveryGridProvider with ChangeNotifier {
  bool onFocus = false;
  bool get getonFocus => onFocus;
  FocusNode myFocusNode = FocusNode();
  FocusNode get getmyFocusNode => myFocusNode;
  List<UserModel> users = [];

  changetoFocus() {
    onFocus = true;
    notifyListeners();
  }

  changetoUnFocus() {
    onFocus = false;
    notifyListeners();
  }
  // void discoveryRendering() {
  //   notifyListeners();
  // }

  void getUser() {
    users.clear();
    var map = List.from(json.decode(myJson));
    for (var element in map) {
      users.add(UserModel.fromJson(element));
    }

    //notifyListeners();
  }
}

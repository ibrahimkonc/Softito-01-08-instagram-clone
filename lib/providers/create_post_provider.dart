import 'package:flutter/widgets.dart';

class CreatePostProvider with ChangeNotifier {
  String? _selectedFile;
  String? get selectedFile => _selectedFile;

  void changeSelectedFile(String file) {
    _selectedFile = file;
    notifyListeners();
  }
}

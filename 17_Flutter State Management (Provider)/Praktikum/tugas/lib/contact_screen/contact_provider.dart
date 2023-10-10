import 'package:flutter/material.dart';
import 'package:tugas/contact_screen/contact_screen.dart';

class ContactProvider extends ChangeNotifier {
  List<Data> dataList = [];

  void addContact(Data contact) {
    dataList.add(contact);
    notifyListeners();
  }

  void editContact(int index, Data updatedContact) {
    dataList[index] = updatedContact;
    notifyListeners();
  }

  void deleteContact(int index) {
    dataList.removeAt(index);
    notifyListeners();
  }
}

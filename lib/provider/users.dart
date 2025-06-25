//controlar a lista de usuários: adiconar, editar, remover, etc.
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_crud/data/dummy_users.dart';
import 'package:flutter_crud/models/user.dart';

class Users with ChangeNotifier {
  final Map<String, User> _items = {...dummyUsers};

  List<User> get all => [..._items.values];

  int get count => _items.length;

  User byIndex(int i) => _items.values.elementAt(i);

  //adicionar

  void put(User user) {
    final id = Random().nextDouble().toString();

    _items.putIfAbsent( id, () => User(
      id: id,
      name: user.name,
      email: user.email,
      avatarUrl: user.avatarUrl,
    ));
    //alterar
    //notifyListeners();
  }
}

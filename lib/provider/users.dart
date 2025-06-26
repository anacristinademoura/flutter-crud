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

  void put(User user) {
    if (user.id.trim().isNotEmpty && _items.containsKey(user.id)) {
      //alterar
      _items.update(user.id, (_) => user);
      notifyListeners();
    } else {
      //adicionar
      final id = Random().nextDouble().toString();

      _items.putIfAbsent(
        id,
        () => User(
          id: id,
          name: user.name,
          email: user.email,
          avatarUrl: user.avatarUrl,
        ),
      );
      notifyListeners();
    }
  }
  void remove(User user){
      _items.remove(user.id);
      notifyListeners();
    }
}

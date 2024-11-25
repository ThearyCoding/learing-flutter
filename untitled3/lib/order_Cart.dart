import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:untitled3/post.dart';

class OrderCart extends ChangeNotifier {
  final List<Post> _order = [];

  List<Post> get order {
    return _order;
  }

  void addPost(Post post) {
    if (_order.contains(post)) {
      _order.remove(post);
    } else {
      _order.add(post);
    }

    notifyListeners();
  }

  bool IsExist(Post post) {
    final isexist = _order.contains(post);
    return isexist;
  }

  static OrderCart of(
    BuildContext context, {
    bool listen = true,
  }) {
    return Provider.of(
      context,
      listen: listen,
    );
  }
}

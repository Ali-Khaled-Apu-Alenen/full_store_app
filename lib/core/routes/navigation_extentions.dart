import 'package:flutter/material.dart';

extension NavigationExtention on BuildContext {
  Future pushPage(Widget page) {
    return Navigator.push(this, MaterialPageRoute(builder: (_) => page));
  }

  Future pushReplacementPage(Widget page) {
    return Navigator.pushReplacement(
      this,
      MaterialPageRoute(builder: (_) => page),
    );
  }

  Future pushNamedPage(String page) {
    return Navigator.pushNamed(this, page);
  }

  Future pushReplacementNamedPage(String page) {
    return Navigator.pushReplacementNamed(this, page);
  }
}

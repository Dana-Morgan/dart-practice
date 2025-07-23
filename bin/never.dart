import 'dart:async';
Future<void> loopForever() async {
  while (true) {
    print("never end");
    await Future.delayed(Duration(seconds: 1));
  }
}
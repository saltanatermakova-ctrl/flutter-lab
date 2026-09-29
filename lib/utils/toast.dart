import 'package:fluttertoast/fluttertoast.dart';

/// Показывает Toast-уведомление (предыдущее закрывается).
void showToast(String message) {
  Fluttertoast.cancel();
  Fluttertoast.showToast(
    msg: message,
    toastLength: Toast.LENGTH_SHORT,
    gravity: ToastGravity.BOTTOM,
    fontSize: 16,
  );
}

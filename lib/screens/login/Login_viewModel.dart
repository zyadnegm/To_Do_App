import 'package:firebase_auth/firebase_auth.dart';
import 'package:todo/Base.dart';
import 'package:todo/screens/login/connector.dart';

class LoginViewModel extends BaseViewModel<LoginConnector> {
  Future<void> login(String email, String password) async {
    connector!.showLoading();
    try {
      final credential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password)
          .then((value) {
        connector!.hideDialog();
        connector!.go_toHome();
      });
    } on FirebaseAuthException catch (e) {
      connector!.hideDialog();
      connector!.showMassege(e.message ?? "");

      if (e.code == 'user-not-found') {
        print('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided for that user.');
      }
    }
  }
}

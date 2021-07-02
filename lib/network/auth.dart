import 'package:firebase_auth/firebase_auth.dart';

class Authenticate {
  FirebaseAuth auth = FirebaseAuth.instance;
  User? user;

  UserModel? _userModel(User user) {
    // ignore: unnecessary_null_comparison
    return user != null ? UserModel(userId: user.uid) : null;
  }

  registerEmailAndPassword(String email, String password) async {
    try {
      UserCredential credential = await auth.createUserWithEmailAndPassword(
          email: email, password: password);
      User? firebaseUser = credential.user;
      return _userModel(firebaseUser!);
    } on FirebaseAuthException catch (error) {
      if (error.code == 'weak-password') {
        print('password is too weak');
      } else if (error.code == 'email-already-in-use') {
        print('Email is already registered..');
      }
    } catch (e) {
      print(e.toString());
    }
  }

  signInWithEmailAndPassword(String email, String password) async {
    try {
      UserCredential credential = await auth.signInWithEmailAndPassword(
          email: email, password: password);
      User? firebaseUser = credential.user;
      return _userModel(firebaseUser!);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided for that user.');
      }
    }
  }

  Future<void> resetPassword(String email) async {
    return await auth.sendPasswordResetEmail(email: email);
  }

  Future<void> logOut() async {
    return await auth.signOut();
  }
}

class UserModel {
  String userId;

  UserModel({required this.userId});
}

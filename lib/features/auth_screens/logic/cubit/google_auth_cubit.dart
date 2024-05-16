import 'package:alaa/features/auth_screens/logic/cubit/google_auth_state.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

String firstName = '';
String error = '';

class GoogleAuthCubit extends Cubit<GoogleAuthStatus> {
  final FirebaseAuth _auth;
  final GoogleSignIn _googleSignIn;
  GoogleAuthCubit(this._auth, this._googleSignIn)
      : super(GoogleAuthStatus.authenticated);
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController userNameController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  // AuthCredential? credential;
  Future<void> signInWithGoogle() async {
    emit(GoogleAuthStatus.loading);
    try {
      final GoogleSignInAccount? googleSignInAccount =
          await _googleSignIn.signIn();
      if (googleSignInAccount != null) {
        final GoogleSignInAuthentication googleSignInAuthentication =
            await googleSignInAccount.authentication;
        final AuthCredential credential = GoogleAuthProvider.credential(
          accessToken: googleSignInAuthentication.accessToken,
          idToken: googleSignInAuthentication.idToken,
        );
        await _auth.signInWithCredential(credential);
        emit(GoogleAuthStatus.authenticated);
        final User user = _auth.currentUser!;
        firstName = user.displayName!.split(' ')[0];
        emit(GoogleAuthStatus.getUserName);
      } else {
        emit(GoogleAuthStatus.unauthenticated);
      }
    } catch (error) {
      print(error);
      emit(GoogleAuthStatus.error);
    }
  }

  Future<void> signOutGoogle() async {
    await _auth.signOut();
    await _googleSignIn.signOut();
    emit(GoogleAuthStatus.unauthenticated);
  }

  Future<void> signUp() async {
    try {
      await _auth
          .createUserWithEmailAndPassword(
              email: emailController.text, password: passwordController.text)
          .then((value) {
        value.user!.updateDisplayName(userNameController.text);
        firstName = userNameController.text.split(' ')[0];
      });
      emit(GoogleAuthStatus.authenticated);
    } catch (e) {
      emit(GoogleAuthStatus.error);
    }
  }

  // Login method
  Future<void> login() async {
    try {
      emit(GoogleAuthStatus.loading);
      await _auth
          .signInWithEmailAndPassword(
              email: emailController.text, password: passwordController.text)
          .then((value) {
        firstName = value.user!.displayName!.split(' ')[0];
      });
      emit(GoogleAuthStatus.authenticated);
    } catch (e) {
      error = e.toString();
      emit(GoogleAuthStatus.error);
    }
  }

  // Sign out method
  Future<void> signOut() async {
    await _auth.signOut();
    emit(GoogleAuthStatus.unauthenticated);
  }
}

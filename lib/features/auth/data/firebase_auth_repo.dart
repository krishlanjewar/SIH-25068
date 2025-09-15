// fire base as back end

import 'package:dwrl_project/features/auth/domain/entities/app_user.dart';
import 'package:dwrl_project/features/auth/domain/repos/auth_repo.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FirebaseAuthRepo implements AuthRepo {
  // TODO: implement the methods using firebase auth package
  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;

  // LOGIN : eMAIL AND PASSWORD
  @override
  Future<AppUser?> loginWithEmailPassword(String email, String password) async {
    try {
      // attempt to sign in
      UserCredential userCredential = await firebaseAuth
          .signInWithEmailAndPassword(email: email, password: password);
      // create user from firebase user
      AppUser user = AppUser(email: email, uid: userCredential.user!.uid);
      return user;
    } 
      catch (e) {
      throw Exception('login failed: $e');
    
    }
  }

  // REGISTER: EMAIL AND PASSWORD
  @override
  Future<AppUser?> registerWithEmailPassword(
    String name,
    String email,
    String password,
  ) async {
    try{
      // attempt to register
      UserCredential userCredential = await firebaseAuth
          .createUserWithEmailAndPassword(email: email, password: password);
      // create user from firebase user
      AppUser user = AppUser(email: email, uid: userCredential.user!.uid);
     
      return user;
    } catch (e) {
      throw Exception('registration failed: $e');
    }
  }

// DELETE ACCOUNT
  @override
  Future<void> deleteAccount() async {
    try {
  // get current user
  final user = firebaseAuth.currentUser;

  // check if user is null
  if (user == null) {
    throw Exception('No user logged in....');
  }

  // delete user
  await user.delete();
  await logout(); // log out after deleting account

} catch (e) {
  // handle error (e.g., re-authentication may be required)
  print('Error deleting user: $e');
}

  }

// get current user
  @override
  Future<AppUser?> getCurrentUser() async {
    // get current user from firebase auth
      final firebaseUser = firebaseAuth.currentUser;
      // no logged in user
      if (firebaseUser == null) return null;
      
      // logged in user exists 
        return AppUser(email: firebaseUser.email!, uid: firebaseUser.uid);
      }

// LOGOUT
  @override
  Future<void> logout() async {
    try {
      await firebaseAuth.signOut();
    } catch (e) {
      throw Exception('Failed to log out: $e');
    }
  }
// send password reset email 
  @override
  Future<String> sendPasswordResetEmail(String email) async {
    try {
     await firebaseAuth.sendPasswordResetEmail(email: email);
      return "Password reset email sent ! check inbox";
    } catch (e) {
      return "Failed to send password reset email: $e";
    }
  }
  
  @override
  Future<AppUser?> signInWithGoogle() {
    // TODO: implement signInWithGoogle
    throw UnimplementedError();
  }
}

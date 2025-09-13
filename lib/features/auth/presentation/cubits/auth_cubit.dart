// cubit for authentication responsible for states management
import 'package:bloc/bloc.dart';
import 'package:dwrl_project/features/auth/domain/entities/app_user.dart';
import 'package:dwrl_project/features/auth/domain/repos/auth_repo.dart';
import 'package:dwrl_project/features/auth/presentation/cubits/auth_states.dart';

class AuthCubit extends Cubit<AuthState> {
  final AuthRepo authRepo;
  AppUser? _currentUser;
  AuthCubit({required this.authRepo}) : super(AuthInitial());

// get current user
  AppUser? get currentUser => _currentUser;
  

// check if authenticated
  void checkAuth() async {
    // loading state
    emit(AuthLoading());

    // get current user from repo
   
      final AppUser? user = await authRepo.getCurrentUser();
      if (user != null) {
        _currentUser = user;
        emit(Authenticated(user));
      } else {
        emit(Unauthenticated());
      }
    }

// login user with email and password
  Future<void> login(String email, String password) async {
   
    try {
       emit(AuthLoading());
      final user = await authRepo.loginWithEmailPassword(email, password);

      if (user != null) {
        _currentUser = user;
       emit(Authenticated(user));
      } else {
        emit(Unauthenticated());
      }
      
      
    } catch (e) {
      emit(AuthError(e.toString()));
      emit(Unauthenticated());
    }
  }

// register user with email and password and name
Future<void> register(String email, String password) async {
   
    try {
       emit(AuthLoading());
      final user = await authRepo.registerWithEmailPassword(email, password, ""); // provide third positional argument for name
      if (user != null) {
        _currentUser = user;
       emit(Authenticated(user));
      } else {
        emit(Unauthenticated());
      }
    } catch (e) {
      emit(AuthError(e.toString()));
      emit(Unauthenticated());
    }
  }
// logout user
  Future<void> logout() async {
    try {
      emit(AuthLoading());
      await authRepo.logout();
      _currentUser = null;
      emit(Unauthenticated());
    } catch (e) {
      emit(AuthError(e.toString()));
    }
  }

// forgot password
  Future<String> forgotPassword(String email) async {
    try {
      final message = await authRepo.sendPasswordResetEmail(email);
      return message;
    } catch (e) {
      return e.toString();
    }
  }


// delete account
  Future<void> deleteAccount() async {
    try {
      emit(AuthLoading());
      await authRepo.deleteAccount();
      _currentUser = null;
      emit(Unauthenticated());
    } catch (e) {
      emit(AuthError(e.toString()));
      emit(Unauthenticated());
    }
  }


}
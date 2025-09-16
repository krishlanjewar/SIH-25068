// authentication states for cubit

import 'package:dwrl_project/features/auth/domain/entities/app_user.dart';

abstract class AuthState {
  get user => null;
}

// initial state
class AuthInitial extends AuthState {}

// loading state
class AuthLoading extends AuthState {}

// authenticated state
class Authenticated extends AuthState {
  final AppUser user;
  Authenticated(this.user);
}

// unauthenticated state
class Unauthenticated extends AuthState {}

// error state
class AuthError extends AuthState {
  final String message;
  AuthError(this.message);
}
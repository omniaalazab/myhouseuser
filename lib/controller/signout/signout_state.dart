class SignoutStatus {}

class Unauthenticated extends SignoutStatus {}

class InitialStatus extends SignoutStatus {}

class AuthError extends SignoutStatus {
  String error;
  AuthError(this.error);
}

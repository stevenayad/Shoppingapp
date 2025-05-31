abstract class signinstate {}

class SigninIntail extends signinstate {}

class Signinloading extends signinstate {}

class Signinsucces extends signinstate {}

class Signinfail extends signinstate {
  final String errormessage;

  Signinfail({required this.errormessage});
}

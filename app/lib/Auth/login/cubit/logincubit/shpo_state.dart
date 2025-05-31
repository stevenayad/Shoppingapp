abstract class Loginstate {}

class loginInitial extends Loginstate {}

class loginloading extends Loginstate {}

class loginsucces extends Loginstate {}

class loginfail extends Loginstate {
  final String errormessage;

  loginfail({required this.errormessage});
}

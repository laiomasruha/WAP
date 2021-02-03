class IUser {
  String _token = "";
  String _id = "";
  String _email = "";
  int _expirationTime = 0;

  String get token => _token;

  String get id => _id;

  int get expirationTime => _expirationTime;

  String get email => _email;

  set expirationTime(int value) {
    _expirationTime = value;
  }

  set email(String value) {
    _email = value;
  }

  set id(String value) {
    _id = value;
  }

  set token(String value) {
    _token = value;
  }
}

IUser user = new IUser();

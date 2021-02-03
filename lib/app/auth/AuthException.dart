class AuthException implements Exception {
  static const Map<String, String> errors = {
  };

  final String key;

  const AuthException(this.key);

  @override
  String toString() {
    if(errors.containsKey(key)){
      return errors[key];
    }else{
      return "Ocorreu um erro durante a autenticação autenticação.";
    }
  }
}
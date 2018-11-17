class ValidationMixin{

  String validateName(String text){
    if(text.contains(' '))
      return null;
    return "Names must have two parts";
  }
  String validateTitle(String text){
    if(text.contains(' '))
      return "title must be one word";
    return null;
  }
  String validateEmail(String text){
    if(text.contains('@') && text.contains('.'))
      return null;
    return "Not valid email";
  }
  String validatePassword(String text){
    if(text.contains(' '))
      return 'password cannot contain spaces';
    if(text.length < 5)
      return "Password must be more than 5";
    return null;
  }

}
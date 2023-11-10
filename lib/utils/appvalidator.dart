class AppValidator{
  String? validateUsername(value){
    if(value!.isEmpty){
      return 'Masukkan Username';
    }
  }

  String? validateEmail(value){
    if (value!.isEmpty){
      return ' Tolong Masukkan Email';
    }
    RegExp emailRegExp = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
    if(!emailRegExp.hasMatch(value)){
      return 'Email tidak Valid';
    }
    return null;
  }

  String? validatePassword(value){
    if(value!.isEmpty){
      return 'Masukkan Password :)';
    }
  }

  String? isEmptyCheck(value){
    if(value!.isEmpty){
      return 'Tolong Diisi';
    }
  }

}
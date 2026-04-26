import 'package:advanced_store_project/core/helper/app_regex.dart';
import 'package:easy_localization/easy_localization.dart';

validateInput(val,min,max ,type){
  if(val.isEmpty){
    return "validate.Empty field".tr();
  }
  if(val.length < min || val.length > max){
    return "validate.InputLength".tr(namedArgs: {"min": min.toString(), "max": max.toString()});
  }
  else{
    
    if(type=="email"){
      if(!AppRegex.isEmailValid(val)){
        return "validate.Invalid email".tr();
      }
    
    }
    else if(type=="password"){
      if(!AppRegex.isPasswordValid(val)){
        return "validate.Invalid password".tr();
      }
    
    }
    else if(type=="phone"){
      if(!AppRegex.isPhoneNumberValid(val)){
        return "validate.Invalid phone".tr();
      }
    
    }
  }
  return null;
}
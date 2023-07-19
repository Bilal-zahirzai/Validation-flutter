import 'package:flutter/material.dart';
mixin ValidationMixin{
  String? passwordValidation(value){
    if(value!.length<4){
      return 'Please enter a valid Email';
    }
    return null;
  }
  String? emailValidation(value){
    if(!value!.contains("@")){
      return 'Please enter a valid Email';
    }
    return null;
  }
}
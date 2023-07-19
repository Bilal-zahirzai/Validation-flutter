import 'package:flutter/material.dart';
import '../mixins/validation_mixin.dart';

class LoginScreen extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return LoginScreenState();
  }
}
class LoginScreenState extends State<LoginScreen> with ValidationMixin{
  var keyForm=GlobalKey<FormState>();
  String Email='';
  String Password='';
  Widget build(context){
    return Container(
      margin: EdgeInsets.all(40.0),
      child: Form(
        key: keyForm,
        child:Column(
          children: [
             emailField(),
             passwordField(),
             Container(margin: EdgeInsets.only(top:25.0),),
             raisedButton(),
          ],
        )
      ),

    );
  }    //build
  Widget emailField(){
    return TextFormField(
      keyboardType: TextInputType.emailAddress,
      decoration: const InputDecoration(
        labelText: 'Email',
        hintText: 'you@example.com',
      ),
      validator: emailValidation ,
      onSaved: (value){
        Email=value!;
      },
    );
  }
  Widget passwordField(){
    return TextFormField(
      obscureText: true,
      decoration: const InputDecoration(
        labelText: 'password',
        hintText: 'password',
      ),
      validator: passwordValidation,
      onSaved: (value){
        Password=value!;
      },
    );
  }
   Widget raisedButton(){
    return ElevatedButton(
          child: Text('Submit'),
          onPressed: () {
            if(keyForm.currentState!.validate()){
              keyForm.currentState?.save();
              print('Time to post my Email : $Email and Password : $Password to an API');
            }
          },
      );
  }
}
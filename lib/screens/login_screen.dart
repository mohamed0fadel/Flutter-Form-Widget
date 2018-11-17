import 'package:flutter/material.dart';
import 'package:big_form/mixins/validation.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> with ValidationMixin{

  final formKey = GlobalKey<FormState>();
  String content = "";
  String user = "";
  String title = "";

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 15.0, right: 15.0, bottom: 15.0),
      child: Form(
        key: formKey,
        child: ListView(
          children: <Widget>[
            Column(
              children: <Widget>[
                nameField(),
                titleField(),
                emailField(),
                secretField(),
                Container(margin: EdgeInsets.only(bottom: 30.0)),
                submitButton(),
                Container(margin: EdgeInsets.only(bottom: 30.0)),
                Text(content),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget nameField() {
    return TextFormField(
      validator: validateName,
      decoration: InputDecoration(
          hintText: 'Barry allen',
          labelText: 'Name',
          icon: Icon(Icons.verified_user)),
      onSaved: (value){
        setState(() {
          user = value;
        });
      },
    );
  }

  Widget titleField() {
    return TextFormField(
      validator: validateTitle,
      decoration: InputDecoration(
          hintText: 'The Flash',
          labelText: 'Title',
          icon: Icon(Icons.flash_on)),
      onSaved: (value){
        setState(() {
          title = value;
        });
      },
    );
  }

  Widget emailField() {
    return TextFormField(
      validator: validateEmail,
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
          hintText: 'user@example.com',
          labelText: 'Email',
          icon: Icon(Icons.email)),
    );
  }

  Widget secretField() {
    return TextFormField(
      validator: validatePassword,
      obscureText: true,
      decoration: InputDecoration(
          hintText: 'BatCave',
          labelText: 'Password',
          icon: Icon(Icons.security)),
    );
  }

  Widget submitButton() {
    return RaisedButton(
      child: Text('submit'),
      color: Colors.blue,
      onPressed: () {
        if(formKey.currentState.validate()){
          formKey.currentState.save();
          setState(() {
            //content = "Hello, $user aka $title";
          });
        }
      },
    );
  }
}

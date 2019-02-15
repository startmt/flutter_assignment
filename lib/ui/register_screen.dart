import 'package:flutter/material.dart';

class RegisterScreen extends StatefulWidget {
  static String tag = 'register-screen';
  
  @override
  _RegisterScreenState createState() => new _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  String vEmail = '';
  String vPassword = '';
  String vRePassword = '';
  final _formKey = GlobalKey<FormState>();
  void submitRegis(){
    final FormState form = _formKey.currentState;
    form.save();
    if (vEmail.isEmpty || vPassword.isEmpty || vRePassword.isEmpty){
      showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              content: Text('กรุณาระบุข้อมูลให้ครบถ้วน'),
            );
          });
      return;
    }
    else if(vEmail == "admin"){
      showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              content: Text('user นี้มีอยู่ใน ระบบแล้ว'),
            );
          });
    }
    else{
       Navigator.pushNamed(context, "/");
    }
  }
  @override
  Widget build(BuildContext context) {
    final txtRegisEmail = TextFormField(
      keyboardType: TextInputType.emailAddress,
      autofocus: true,
      decoration: InputDecoration(
        icon: Icon(Icons.email),
        labelText: 'Email',
        hintText: 'Email',
      ),
      onSaved : (email) => vEmail = email
    );

    final txtPassword = TextFormField(
      autofocus: false,
      obscureText: true,
      decoration: InputDecoration(
        icon: Icon(Icons.lock),
        labelText: 'Password',
        hintText: 'Password',
      ),
      onSaved : (password) => vPassword = password
    );
    final txtConfirmPassword = TextFormField(
      autofocus: false,
      obscureText: true,
      decoration: InputDecoration(
        icon: Icon(Icons.lock),
        labelText: 'Confirm Password',
        hintText: 'Confirm Password',
      ),
      onSaved : (confirmPassword) => vRePassword = confirmPassword
    );

    final registerButton = Padding(
      padding: EdgeInsets.symmetric(vertical: 5.0),
      child: RaisedButton(
        onPressed: submitRegis,
        padding: EdgeInsets.all(3),
        color: Colors.lightBlue[300],
        child: Text('Continue', style: TextStyle(color: Colors.white)),
      ),
    );

    return Scaffold(
      appBar: AppBar(
        title: Text("Register"),
      ),
      body: Center(
        child: Form(
          key: _formKey,
          child: ListView(
            padding: EdgeInsets.only(top:20.0, left: 24.0, right: 24.0),
           children: <Widget>[
              txtRegisEmail,
             txtPassword,
             txtConfirmPassword,
              SizedBox(height: 15.0),
              registerButton,
           ],
          ),
        ),
      ),
    );
  }
}
import 'package:flutter/material.dart';
class LoginScreen extends StatefulWidget {
  static String tag = 'login-screen';
  @override
  _LoginScreenState createState() => new _LoginScreenState();
}
class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  String vEmail = '';
  String vPassword = '';
  void submitLogin(){
    final FormState form = _formKey.currentState;
    form.save();
    if (vEmail.isEmpty || vPassword.isEmpty){
      showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              content: Text('กรุณากรอก Username หรือ Password'),
            );
          });
      return;
    }
    else if(vEmail == "admin" && vPassword == "admin"){
      Navigator.pushNamed(context, "/main");
    }
    else{
       showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              content: Text('user หรือ password ไม่ถูกต้อง'),
            );
          });
    }
  }
  
  @override
  Widget build(BuildContext context) {
    final logo = Image.asset('assets/logo.png');
    final txtUserId = TextFormField(
      keyboardType: TextInputType.emailAddress,
      autofocus: false,
      decoration: InputDecoration(
        icon: Icon(Icons.person),
        labelText: 'User Id',
        hintText: 'User Id',
      ),
      onSaved: (username) => vEmail = username
    );

    final txtPassword = TextFormField(
      autofocus: false,
      obscureText: true,
      decoration: InputDecoration(
        icon: Icon(Icons.lock),
        labelText: 'Password',
        hintText: 'Password',
      ),
      validator: (value) {
        if (value.isEmpty){
          return 'กรุณาป้อน password';
        }
      },
      onSaved: (password) => vPassword = password
    );

    final loginButton = Padding(
      padding: EdgeInsets.symmetric(vertical: 5.0),
      child: RaisedButton(
        onPressed: submitLogin,
        padding: EdgeInsets.all(3),
        color: Colors.lightBlue[300],
        child: Text('LOGIN', style: TextStyle(color: Colors.white)),
      ),
    );

    final registerLabel = FlatButton(
      child: SizedBox(
        width: double.infinity,
        child: Text(
          'Register new account',
         style: TextStyle(color: Colors.black54),
         textAlign: TextAlign.right
        )
      ),
      onPressed: () {
        Navigator.pushNamed(context, "/register");
      },
    );

    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Form(
          key: _formKey,
          child: ListView(
            shrinkWrap: true,
           padding: EdgeInsets.only(left: 24.0, right: 24.0),
            children: <Widget>[
             logo,
              SizedBox(height: 48.0),
              txtUserId,
              txtPassword,
              SizedBox(height: 15.0),
              loginButton,
              registerLabel
            ],
          ),
        ),
      )
    );
  }
}
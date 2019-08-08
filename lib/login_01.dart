import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_login/constant.dart';

Color lightGrey = Color(0xff1A1A1A).withAlpha(127);
Color buttonBlue = Color(0xff0052FF);

class Login01 extends StatelessWidget {
  const Login01({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var inputContainer = Padding(
      padding: EdgeInsets.symmetric(
          horizontal: MediaQuery.of(context).size.width * 0.1),
      child: Container(
        width: double.maxFinite,
        decoration: BoxDecoration(
            border: Border.all(color: lightGrey, width: 1),
            borderRadius: BorderRadius.circular(5)),
        child: Column(
          children: <Widget>[
            Login01TextField(hint: 'Email Address', preFix: Icons.email),
            Padding(
              padding: EdgeInsets.only(left: 50),
              child: Container(
                height: 1,
                width: double.maxFinite,
                color: lightGrey,
              ),
            ),
            Login01TextField(
                hint: 'Password', preFix: Icons.lock, obscureText: true),
          ],
        ),
      ),
    );
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: <Widget>[
            Expanded(
              child: Image.asset(AppImage.logo),
            ),
            inputContainer,
            SizedBox(height: 12),
            FlatButton(
              child: Text(
                'Forgot Password?',
                style: TextStyle(color: buttonBlue, fontSize: 12),
              ),
              onPressed: () {},
            ),
            SizedBox(height: 12),
            Row(
              children: <Widget>[
                SizedBox(width: MediaQuery.of(context).size.width * 0.1),
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                        color: Color(0xff3B5998),
                        borderRadius: BorderRadius.circular(5)),
                    child: FlatButton(
                      child: Image.asset(AppImage.fbLogo),
                      onPressed: () {},
                    ),
                  ),
                ),
                SizedBox(width: 20.0),
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.green,
                        borderRadius: BorderRadius.circular(5)),
                    child: FlatButton(
                      child: Text(
                        'LOGIN',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                    ),
                  ),
                ),
                SizedBox(width: MediaQuery.of(context).size.width * 0.1),
              ],
            ),
            Container(
              height: 60,
              child: Center(
                child: RichText(
                  text: TextSpan(children: [
                    TextSpan(
                        text: 'By signing up, you agree with our ',
                        style: TextStyle(color: Colors.black, fontSize: 12)),
                    TextSpan(
                        text: 'Terms & Conditions',
                        style: TextStyle(
                            color: buttonBlue,
                            decoration: TextDecoration.underline,
                            fontSize: 12),
                        recognizer: TapGestureRecognizer()..onTap = () {})
                  ]),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class Login01TextField extends StatelessWidget {
  final IconData preFix;
  final String hint;
  final bool obscureText;

  Login01TextField(
      {@required this.preFix, @required this.hint, this.obscureText = false});

  @override
  Widget build(BuildContext context) {
    return Theme(
        child: TextField(
          cursorColor: Colors.green,
          obscureText: obscureText,
          decoration: InputDecoration(
              hintText: hint,
              hintStyle: TextStyle(fontSize: 16),
              border: InputBorder.none,
              prefixIcon: Icon(preFix, size: 16),
              prefixStyle: TextStyle(color: Colors.green)),
        ),
        data: Theme.of(context).copyWith(primaryColor: Colors.green));
  }
}

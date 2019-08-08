import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_login/constant.dart';

Color primaryColor = Color(0xff1A1A1A);

class Login02 extends StatefulWidget {
  @override
  _Login02State createState() => _Login02State();
}

class _Login02State extends State<Login02> {
  bool isSigninSelected = true;
  double padding;

  ScrollController _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    padding = MediaQuery.of(context).size.width * 0.1;
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.only(
            top: MediaQuery.of(context).padding.top,
            bottom: MediaQuery.of(context).padding.bottom,
          ),
          height: MediaQuery.of(context).size.height,
          child: Column(
            children: <Widget>[
              Expanded(
                child: Image.asset(AppImage.logo1),
              ),
              getFormSelector(),
              SizedBox(height: 20),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: padding),
                child: Column(
                  children: <Widget>[
                    Login2TextField(hint: 'Email Address'),
                    SizedBox(height: 12),
                    Login2TextField(hint: 'Password'),
                  ],
                ),
              ),
              Row(
                children: <Widget>[
                  Expanded(
                    child: Container(),
                  ),
                  FlatButton(
                    padding: EdgeInsets.only(right: 0),
                    child: Text(
                      'Forgot Password?',
                      style: TextStyle(color: Colors.red, fontSize: 14),
                    ),
                    onPressed: () {},
                  ),
                  SizedBox(
                    width: padding,
                  )
                ],
              ),
              SizedBox(height: 20.0),
              InkWell(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: padding),
                  child: Container(
                    height: 52,
                    width: double.maxFinite,
                    decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Center(
                      child: Text(
                        'LOGIN',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ),
                onTap: () {
                  Navigator.of(context).pop();
                },
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
                              color: Colors.red,
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
      ),
    );
  }

  Container getFormSelector() {
    return Container(
      height: 80,
      child: ListView(
        scrollDirection: Axis.horizontal,
        controller: _scrollController,
        physics: NeverScrollableScrollPhysics(),
        children: <Widget>[
          SizedBox(width: padding),
          InkWell(
            child: Text(
              'Signin',
              style: TextStyle(
                  fontSize: 60,
                  color: isSigninSelected
                      ? Colors.red
                      : primaryColor.withAlpha(21)),
            ),
            onTap: () {
              setState(() {
                isSigninSelected = true;
              });
              _scrollController.animateTo(0.0,
                  curve: Curves.easeIn, duration: Duration(milliseconds: 100));
            },
          ),
          SizedBox(width: padding),
          InkWell(
            child: Text(
              'Signup',
              style: TextStyle(
                  fontSize: 60,
                  color: isSigninSelected
                      ? primaryColor.withAlpha(21)
                      : Colors.red),
            ),
            onTap: () {
              setState(() {
                isSigninSelected = false;
              });
              _scrollController.animateTo(100.0,
                  curve: Curves.easeIn, duration: Duration(milliseconds: 100));
            },
          ),
          SizedBox(width: padding),
        ],
      ),
    );
  }
}

class Login2TextField extends StatelessWidget {
  final String hint;

  const Login2TextField({@required this.hint});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20),
      height: 52,
      decoration: BoxDecoration(
        border: Border.all(color: primaryColor.withAlpha(85), width: 1),
        borderRadius: BorderRadius.circular(5),
      ),
      child: Row(
        children: <Widget>[
          SizedBox(
            width: 105,
            child: Text(
              hint,
              style: TextStyle(color: primaryColor, fontSize: 14),
            ),
          ),
          Container(
            width: 1,
            height: 15,
            color: Color(0xff707070),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(left: 12),
              child: TextField(
                cursorColor: Colors.red,
                decoration: InputDecoration(border: InputBorder.none),
              ),
            ),
          )
        ],
      ),
    );
  }
}

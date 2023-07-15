import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:humble/home_page.dart';
import 'package:humble/utils.dart';

class AuthenticationPage extends StatefulWidget {
  const AuthenticationPage({Key? key}) : super(key: key);
  @override
  State<AuthenticationPage> createState() => _AuthenticationPageState();
}

class _AuthenticationPageState extends State<AuthenticationPage> {
  String _email = '';
  String _password = '';
  String _status = '';

  void onLoginClicked(){
    if(Utils().isEmailValid(_email) && Utils().isPasswordValid(_password)) {
      if (_email == 'abc@xyz.com' && _password == '123456') {
        setState(() {
          _status = 'VALID';
        });
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => HomePage()));
      }
    }else{
      Fluttertoast.showToast(msg: "Invalid Credentials", webBgColor: "linear-gradient(to right, #000000, #000000)");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amber,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(_status),
            Image.asset('assets/logo.png'),
            Column(
               mainAxisAlignment: MainAxisAlignment.start,
               mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(8)),
                  ),
                  child: TextField(
                      key: Key('email_field'),
                    onChanged: (value) {
                      setState(() {
                        _email = value;
                      });
                    },
                    decoration: const InputDecoration.collapsed(
                      hintText: 'Email',
                    ),
                  ),
                ),
                const SizedBox(height: 16.0),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(8)),
                  ),
                  child: TextField(
                    key: Key('password_field'),
                    onChanged: (value) {
                      setState(() {
                        _password = value;
                      });
                    },
                    obscureText: true,
                    decoration: const InputDecoration.collapsed(
                      hintText: 'Password',
                    ),
                  ),
                ),
            const SizedBox(height: 24.0),
            InkWell(
              key: Key('login_button'),
              onTap: () => onLoginClicked(),
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
                alignment: Alignment.center,
                decoration: const BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.all(Radius.circular(100)),
                ),
                child: const Text('Sign In', style: TextStyle(color: Colors.white),),
              ),
            ),
              ],
            ),
            const SizedBox.shrink(),
          ],
        ),
      ),
    );
  }
}

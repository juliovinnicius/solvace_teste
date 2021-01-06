import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:solvace_teste/src/home/home_page.dart';
import 'package:solvace_teste/src/shared/helpers/color_helper.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  Size size;
  bool dropdown = false;
  bool textLogin = true;
  bool loginButton = true;
  bool invalid = false;
  String _dropDownValue;
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: ColorLib.colorPrimary.color,
      body: Container(
        height: size.height,
        width: size.width,
        alignment: Alignment.center,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/images/logo_solvace.png',
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                margin: EdgeInsets.only(left: 17, right: 17),
                padding: EdgeInsets.only(left: 5, right: 5),
                child: TextFormField(
                  controller: emailController,
                  decoration: InputDecoration(
                      hintText: 'Email / Username', border: InputBorder.none),
                ),
                decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(width: 1),
                    borderRadius: BorderRadius.all(Radius.circular(5))),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                margin: EdgeInsets.only(left: 17, right: 17),
                padding: EdgeInsets.only(left: 5, right: 5),
                child: TextFormField(
                  controller: passwordController,
                  obscureText: true,
                  decoration: InputDecoration(
                      hintText: 'Password', border: InputBorder.none),
                ),
                decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(width: 1),
                    borderRadius: BorderRadius.all(Radius.circular(5))),
              ),
              invalid
                  ? SizedBox(
                height: 5,
              )
                  : Container(),
              invalid
                  ? Container(
                child: Text(
                  'Invalid Password',
                  style: TextStyle(
                    color: Colors.white
                  ),
                ),
              )
                  : Container(),
              dropdown
                  ? SizedBox(
                      height: 10,
                    )
                  : Container(),
              dropdown
                  ? Container(
                margin: EdgeInsets.only(left: 17, right: 17),
                padding: EdgeInsets.only(left: 5, right: 5),
                child: DropdownButton(
                  underline: Container(),
                  hint: _dropDownValue == null
                      ? Text(
                    'Enviroment',
                    style: TextStyle(
                      fontSize: 16
                    ),
                  )
                      : Text(
                    _dropDownValue,
                    style: TextStyle(
                        fontSize: 16
                    ),
                  ),
                  isExpanded: true,
                  iconSize: 30.0,
                  style: TextStyle(color: Colors.black),
                  items: ['SolvaceLabs - Development', 'SolvaceLabs - QA'].map(
                        (val) {
                      return DropdownMenuItem<String>(
                        value: val,
                        child: Text(val),
                      );
                    },
                  ).toList(),
                  onChanged: (val) {
                    setState(
                          () {
                        _dropDownValue = val;
                      },
                    );
                    Future.delayed(Duration(seconds: 2), (){
                      Navigator.push(context, MaterialPageRoute(builder: (_) => HomePage()));
                    });
                  },
                ),
                decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(width: 1),
                    borderRadius: BorderRadius.all(Radius.circular(5))),
              )
                  : Container(),
              SizedBox(
                height: 15,
              ),
              loginButton
                  ? RaisedButton(
                  color: Colors.pink,
                  onPressed: () {
                    if(emailController.text != 'admin@ewcm.com.br' || passwordController.text != 'admin123'){
                      print("${emailController.value}, ${passwordController.value}");
                      setState(() {
                        textLogin = false;
                        Future.delayed(Duration(seconds: 3),(){
                          setState(() {
                            invalid = true;
                            textLogin = true;
                          });
                        });
                      });
                    }
                    else{
                      setState(() {
                        invalid = false;
                        textLogin = false;
                        Future.delayed(Duration(seconds: 3), (){
                          setState(() {
                            dropdown = true;
                            loginButton = false;
                          });
                        });
                      });
                    }
                  },
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(2),
                      side: BorderSide(
                        color: Colors.pink,
                      )),
                  child: textLogin
                      ? Text(
                    'Login',
                    style: TextStyle(
                      color: Colors.white,
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w600,
                      fontSize: 14,
                    ),
                  )
                      : Container(
                    height: 20,
                    width: 20,
                    child: CircularProgressIndicator(),
                  )
              )
                  : Container(),
            ],
          ),
        ),
      ),
    );
  }
}

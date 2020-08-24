import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Row(
                children: [
                  Container(
                    margin: EdgeInsets.fromLTRB(16, 32, 16, 32),
                    child: Image.asset(
                      'images/logo.png',
                      height: 50,
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Container(
                      margin: EdgeInsets.fromLTRB(16, 0, 0, 8),
                      child: Text(
                        'Welcome to',
                        textAlign: TextAlign.left,
                      )),
                ],
              ),
              Row(
                children: [
                  Container(
                    margin: EdgeInsets.fromLTRB(16, 0, 8, 32),
                    child: Text('Human Resource Management System',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 22,
                            color: Colors.black87)),
                  ),
                ],
              ),
              Container(
                height: 30,
                width: double.infinity, //To make
                margin: EdgeInsets.fromLTRB(16, 10, 16, 10),
                child: TextField(
                  controller: nameController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Usename',
                  ),
                ),
              ),
              Container(
                height: 30,
                margin: EdgeInsets.fromLTRB(16, 0, 16, 8),
                child: TextField(
                  obscureText: true,
                  controller: passwordController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Password',
                  ),
                ),
              ),
              Row(
                children: [
                  Expanded(
                    child: Container(
                      margin: EdgeInsets.fromLTRB(0, 0, 16, 0),
                      child: InkWell(
                        onTap: () {
                          Navigator.of(context).pop();
                        },
                        child: Text(
                          'Forget password',
                          textDirection: TextDirection.rtl,
                          style: TextStyle(
                            fontSize: 15,
                            color: Colors.blue,
                          ),
                        ),
                        /*    child: FlatButton(
                        onPressed: () {
                          //forgot password screen
                        },
                        textColor: Colors.blue,
                        child: Text(
                          'Forgot Password',
                        ),
                      ),*/
                      ),
                    ),
                  ),
                ],
              ),
              Container(
                  height: 40,
                  width: double.infinity,
                  margin: EdgeInsets.fromLTRB(16, 8, 16, 8),
                  child: RaisedButton(
                    textColor: Colors.white,
                    color: Colors.black87,
                    child: Text('Login'),
                    onPressed: () {
                      print(nameController.text);
                      print(passwordController.text);
                    },
                  )),
              Row(
                children: <Widget>[
                  Expanded(
                    child: Container(
                      color: Colors.indigo,
                      margin: EdgeInsets.fromLTRB(16, 0, 0, 0),
                      child: Image.asset(
                        'images/googlelogo.png',
                        width: 25,
                        height: 40,
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 9,
                    child: Container(
                        height: 40,
                        // width: double.infinity,
                        margin: EdgeInsets.fromLTRB(0, 0, 16, 0),
                        child: RaisedButton(
                          textColor: Colors.white,
                          color: Colors.indigo,
                          child:
                              Text('Login with your company gooogle account'),
                          onPressed: () {
                            print(nameController.text);
                            print(passwordController.text);
                          },
                        )),
                  ),
                ],
              ),
              Row(
                children: [
                  Container(
                    margin: EdgeInsets.fromLTRB(16, 16, 16, 8),
                    child: Text('About Excellence HRMS',
                        textDirection: TextDirection.ltr,
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 20)),
                  ),
                ],
              ),
              Container(
                margin: EdgeInsets.fromLTRB(16, 0, 16, 16),
                child: Text(
                    'Say goodbye to cluttered spreadsheets From attendence to timesheets and performance, run HR on the cloud. Get more done with a simple user interface, effortless automation, and efficient processing.',
                    style: TextStyle(fontSize: 15)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

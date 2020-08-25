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
        backgroundColor: Color(0xfff8f9fa), // just add oxff before hexa code
        body: SingleChildScrollView(
                  child: SafeArea(
            child:Column(
              //      mainAxisAlignment: MainAxisAlignment.start,
              // crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Container(
                        margin: EdgeInsets.fromLTRB(16, 48, 32, 32),
                        child: Image.asset(
                          'images/logo.png',
                          height: 50,
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Container(
                        margin: EdgeInsets.fromLTRB(32, 0, 0, 0),
                        child: Text('Welcome to',
                            textAlign: TextAlign.left,
                            style: TextStyle(
                              fontSize: 18,
                              color: Color(0xff485057),
                            ))),
                  ],
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Container(
                        margin: EdgeInsets.fromLTRB(32, 0, 8, 32),
                        child: Text('Human Resource Management System',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 22,
                                color: Color(0xff485057))),
                      ),
                    ),
                  ],
                ),
                Container(
                  height: 40,
                  color: Color(0xffE8F0FE),
                  //To make
                  margin: EdgeInsets.fromLTRB(32, 10, 32, 12),
                  child: TextField(
                    controller: nameController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Usename',
                    ),
                  ),
                ),
                Container(
                  height: 40,
                  color: Color(0xffE8F0FE),
                  margin: EdgeInsets.fromLTRB(32, 0, 32, 8),
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
                        margin: EdgeInsets.fromLTRB(0, 0, 32, 0),
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
                    margin: EdgeInsets.fromLTRB(32, 8, 32, 16),
                    child: RaisedButton(
                      textColor: Colors.white,
                      color: Color(0xff4C545B),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(5.0))),
                      child: Text('Login'),
                      onPressed: () {
                        print(nameController.text);
                        print(passwordController.text);
                      },
                    )),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Container(
                        width: double.infinity,
                        margin: EdgeInsets.fromLTRB(32.0, 5.0, 32.0, 5.0),
                        child: new RaisedButton(
                            padding:
                                EdgeInsets.only(top: 3.0, bottom: 3.0, left: 3.0),
                            color: const Color(0xFF4285F4),
                            onPressed: () {},
                            shape: RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(5.0))),
                            child: new Row(
                              mainAxisSize: MainAxisSize.min,
                              children: <Widget>[
                                Container(
                                  child: new Image.asset(
                                    'images/googlelogo.png',
                                    height: 30.0,
                                    fit: BoxFit.contain,
                                  ),
                                ),
                                Container(
                                    alignment: Alignment.center,
                                    margin:
                                        EdgeInsets.only(left: 10.0, right: 10.0),
                                    child: new Text(
                                      "Login with your company google account",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold),
                                    )),
                              ],
                            )),
                      ),
                    ),
                  ],
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Container(
                        margin: EdgeInsets.fromLTRB(32, 16, 16, 8),
                        child: Text('About Excellence HRMS',
                            textDirection: TextDirection.ltr,
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                                color: Color(0xff485057))),
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Expanded(
                      child: Container(
                        margin: EdgeInsets.fromLTRB(32, 0, 32, 16),
                        child: Text(
                            'Say goodbye to cluttered spreadsheets From attendence to timesheets and performance, run HR on the cloud. Get more done with a simple user interface, effortless automation, and efficient processing.',
                            style: TextStyle(
                                fontSize: 15, color: Color(0xff485057))),
                      ),
                    ),
                  ],
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Container(
                        margin: EdgeInsets.fromLTRB(32, 16, 16, 8),
                        child: Text('Features',
                            textDirection: TextDirection.ltr,
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                                color: Color(0xff485057))),
                      ),
                    ),
                  ],
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                        child: Container(
                            margin: EdgeInsets.fromLTRB(32, 0, 0, 16),
                            child: Image.asset(
                              'images/greenbtn.png',
                              width: 10,
                              height: 10,
                            ))),
                    Expanded(
                      flex: 9,
                      child: Container(
                        margin: EdgeInsets.fromLTRB(8, 0, 32, 16),
                        child: Text('Core HR: Attendence,Leaves & Timesheets',
                            style: TextStyle(
                                fontSize: 15, color: Color(0xff485057))),
                      ),
                    ),
                  ],
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                        child: Container(
                            margin: EdgeInsets.fromLTRB(32, 0, 0, 16),
                            child: Image.asset(
                              'images/greenbtn.png',
                              width: 10,
                              height: 10,
                            ))),
                    Expanded(
                      flex: 9,
                      child: Container(
                        margin: EdgeInsets.fromLTRB(8, 0, 32, 16),
                        child: Text(
                            'Manage Employee & Maintain Employee Life Cycle',
                            style: TextStyle(
                                fontSize: 15, color: Color(0xff485057))),
                      ),
                    ),
                  ],
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                        child: Container(
                            margin: EdgeInsets.fromLTRB(32, 0, 0, 16),
                            child: Image.asset(
                              'images/greenbtn.png',
                              width: 10,
                              height: 10,
                            ))),
                    Expanded(
                      flex: 9,
                      child: Container(
                        margin: EdgeInsets.fromLTRB(8, 0, 32, 16),
                        child: Text('Salary Management',
                            style: TextStyle(
                                fontSize: 15, color: Color(0xff485057))),
                      ),
                    ),
                  ],
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                        child: Container(
                            margin: EdgeInsets.fromLTRB(32, 0, 0, 16),
                            child: Image.asset(
                              'images/greenbtn.png',
                              width: 10,
                              height: 10,
                            ))),
                    Expanded(
                      flex: 9,
                      child: Container(
                        margin: EdgeInsets.fromLTRB(8, 0, 32, 16),
                        child: Text('Mail Templates & Variables',
                            style: TextStyle(
                                fontSize: 15, color: Color(0xff485057))),
                      ),
                    ),
                  ],
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                        child: Container(
                            margin: EdgeInsets.fromLTRB(32, 0, 0, 16),
                            child: Image.asset(
                              'images/greenbtn.png',
                              width: 10,
                              height: 10,
                            ))),
                    Expanded(
                      flex: 9,
                      child: Container(
                        margin: EdgeInsets.fromLTRB(8, 0, 32, 16),
                        child: Text('Employee Document Management',
                            style: TextStyle(
                                fontSize: 15, color: Color(0xff485057))),
                      ),
                    ),
                  ],
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                        child: Container(
                            margin: EdgeInsets.fromLTRB(32, 0, 0, 16),
                            child: Image.asset(
                              'images/greenbtn.png',
                              width: 10,
                              height: 10,
                            ))),
                    Expanded(
                      flex: 9,
                      child: Container(
                        margin: EdgeInsets.fromLTRB(8, 0, 32, 16),
                        child: Text('Auditing and Inventory Management',
                            style: TextStyle(
                                fontSize: 15, color: Color(0xff485057))),
                      ),
                    ),
                  ],
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                        child: Container(
                            margin: EdgeInsets.fromLTRB(32, 0, 0, 16),
                            child: Image.asset(
                              'images/greenbtn.png',
                              width: 10,
                              height: 10,
                            ))),
                    Expanded(
                      flex: 9,
                      child: Container(
                        margin: EdgeInsets.fromLTRB(8, 0, 32, 16),
                        child: Text('Team Management',
                            style: TextStyle(
                                fontSize: 15, color: Color(0xff485057))),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

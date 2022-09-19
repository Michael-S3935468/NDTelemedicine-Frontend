import 'package:flutter/material.dart';
import 'package:ndtelemedicine/main.dart';
import '/signup/signup.dart';


void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LoginPage(),
    );
  }
}

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _LoginKey = GlobalKey<FormState>();
  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool _isObscure = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: const Color.fromRGBO(21, 101, 192, 1),
        title: SizedBox(
          height: 30,
          child: Image.asset('images/Header-Base.png'),
        ),
        centerTitle: true,
      ),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/Login-Background.png'),
            opacity: 0.6,
            fit: BoxFit.fitHeight,
            alignment: Alignment.center,
          ),
        ),
        child: Form(
          key: _LoginKey,
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: ListView(
              children: <Widget>[
                Container(
                  alignment: Alignment.center,
                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 50),
                  child: const Text(
                    "Login",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 30,
                        fontWeight: FontWeight.w500),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.only(left: 10),
                  child: const Text("Email Address"),
                ),
                Container(
                  padding: const EdgeInsets.all(10),
                  // Email form, if form is null return an error
                  child: TextFormField(
                    controller: nameController,
                    decoration: const InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                        labelText: "Enter Email here",
                        hintText:  "example@domain.net"
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Please enter an email!";
                      }
                      return null;
                    },
                  ),
                ),
                Container(
                  padding: const EdgeInsets.only(left: 10),
                  child: const Text("Password"),
                ),
                Container(
                  padding: const EdgeInsets.all(10),
                  // Password form, if form is null return an error
                  child: TextFormField(
                    controller: passwordController,
                    obscureText: _isObscure,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      labelText: "Enter password here",
                      hintText:  "Password",
                      suffixIcon: IconButton(
                        icon: Icon(_isObscure
                            ? Icons.visibility_off
                            : Icons.visibility),
                        onPressed: () {
                          setState(() {
                            _isObscure = !_isObscure;
                          });
                        },
                      ),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Please enter a password!";
                      }
                      return null;
                    },
                  ),
                ),
                Column(children: <Widget>[
                  Container(
                    height: 50,
                    width: 350,
                    decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    // Login Button, proceeds to navigate to home page if checks are valid
                    child: ElevatedButton(
                      // Validation Check, checks if both email and password form are valid
                      onPressed: () {
                        if (_LoginKey.currentState!.validate()) {
                          //If the form is valid, login is successful and proceed to home page
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => const MyHomePage(
                                title: "NDTelemedicine",
                              )));
                        }
                      },
                      child: const Text(
                        "Login",
                        style: TextStyle(color: Colors.white, fontSize: 25),
                      ),
                    ),
                  ),
                  Row(children: <Widget>[
                    Expanded(
                      child: Container(
                          margin:
                              const EdgeInsets.only(left: 10.0, right: 20.0),
                          child: const Divider(
                            color: Colors.black,
                            height: 36,
                          )),
                    ),
                    const Text("OR"),
                    Expanded(
                      child: Container(
                          margin:
                              const EdgeInsets.only(left: 20.0, right: 10.0),
                          child: const Divider(
                            color: Colors.black,
                            height: 36,
                          )),
                    ),
                  ]),
                  Container(
                    height: 50,
                    width: 350,
                    decoration: BoxDecoration(
                      color: Colors.blueGrey,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => const SignUpPage()));
                      },
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.blueGrey),
                      child: const Text(
                        "Sign Up",
                        style: TextStyle(color: Colors.white, fontSize: 25),
                      ),
                    ),
                  ),
                ]),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
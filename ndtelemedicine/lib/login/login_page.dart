import 'package:flutter/material.dart';
import 'package:ndtelemedicine/login/login-api/api_service.dart';
import 'package:ndtelemedicine/state_models/LoginResponse.dart';
import 'package:ndtelemedicine/main.dart';
import 'package:ndtelemedicine/state_models/Patient.dart';
import 'package:ndtelemedicine/state_models/Session.dart';
import 'package:provider/provider.dart';
import '/signup/signup.dart';
import '../state_models/LoginRequest.dart';

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
  bool _loginSuccess = true;
  bool _loading = false;
  late LoginResponse _loginResponse;

  // Request login user with credentials
  void _logIn(LoginRequest loginRequest) async {
    _loginResponse = (await LoginAPI().sendLogin(loginRequest));
    _loginSuccess = _loginResponse.success;
    _loading = false;
    Future.delayed(const Duration(seconds: 1)).then((value) => setState(() {}));
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<Session>(builder: (context, session, child) {
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
                    padding: const EdgeInsets.symmetric(
                        horizontal: 10, vertical: 50),
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
                          hintText: "example@domain.net"),
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
                        hintText: "Password",
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
                    // Display error message when login unsuccessful
                    (!_loginSuccess)
                        ? Container(
                            margin: const EdgeInsets.only(bottom: 10),
                            padding: const EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              color: Colors.red,
                            ),
                            child: const Text(
                              "Email and/or Password are incorrect!",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 16),
                            ),
                          )
                        : const SizedBox(),
                    Container(
                      height: 50,
                      width: 350,
                      decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      // Login Button
                      child: ElevatedButton(
                        onPressed: () {
                          // Validation Check, checks if both email and password form are valid
                          if (_LoginKey.currentState!.validate()) {
                            setState(() {
                              _loading = true;
                            });
                            // Request to login
                            _logIn(LoginRequest(
                                email: nameController.text,
                                password: passwordController.text));

                            Future.delayed(const Duration(seconds: 1), () {
                              // Proceeds to navigate to home page if request is valid
                              if (_loginResponse.success) {
                                session.setPatient(Patient(_loginResponse.user!));
                                session.setJWT(_loginResponse.token!);
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) => const MyHomePage()));
                              }
                            });
                          }
                        },
                        child: (_loading)
                            ? const CircularProgressIndicator(
                                color: Colors.white,
                              )
                            : const Text(
                                "Login",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 25),
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
                        style:
                            ElevatedButton.styleFrom(primary: Colors.blueGrey),
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
    });
  }
}

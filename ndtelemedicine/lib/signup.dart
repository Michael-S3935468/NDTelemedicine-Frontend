import 'package:flutter/material.dart';
import 'package:ndtelemedicine/login.dart';

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

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _SignUpPage();
}

class _SignUpPage extends State<SignUpPage> {
  final _formKey = GlobalKey<FormState>();
  final _passKey = GlobalKey<FormFieldState>();

  String _name = '';
  String _email = '';
  int _age = -1;
  int _selectedSex = 0;
  int _selectedSymptoms = 0;
  String _password = '';

  bool _isPasswordVisibile = true;
  bool _isConfrimPasswordVisibile = true;
  bool _termsChecked = true;

  List<DropdownMenuItem<int>> sexList = [];

  // Function to load List of Genders for user to choose
  void loadSexList() {
    sexList = [];
    sexList.add(const DropdownMenuItem(
      child: Text("Male"),
      value: 0,
    ));
    sexList.add(const DropdownMenuItem(
      child: Text("Female"),
      value: 1,
    ));
    sexList.add(const DropdownMenuItem(
      child: Text("Other"),
      value: 2,
    ));
  }

  // Validation Check for email
  String? validateEmail(String? value) {
    if (value!.isEmpty) {
      return "Please enter an email address!";
    }

    Pattern pattern =
        r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+";
    RegExp regex = RegExp(pattern.toString());
    if (!regex.hasMatch(value.toString())) {
      return "Enter a valid email";
    } else {
      return null;
    }
  }

  void onPressedSubmit() {
    if (_formKey.currentState!.validate() && _termsChecked) {
      _formKey.currentState?.save();

      ScaffoldMessenger.of(context)
          .showSnackBar(const SnackBar(content: Text("Form Submitted")));
    }
  }

  @override
  Widget build(BuildContext context) {
    loadSexList();
    return Scaffold(
      appBar: AppBar(
        // automaticallyImplyLeading: false,
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
          key: _formKey,
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: ListView(
              children: <Widget>[
                Container(
                  padding: const EdgeInsets.all(10),
                  child: TextFormField(
                    decoration: const InputDecoration(
                      labelText: "Enter Name",
                      hintText: "Name",
                      filled: true,
                      fillColor: Colors.white,
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Please enter a name!";
                      } else {
                        return null;
                      }
                    },
                    onSaved: (value) {
                      setState(() {
                        _name = value.toString();
                      });
                    },
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(10),
                  child: TextFormField(
                    decoration: const InputDecoration(
                      labelText: "Enter Email",
                      hintText: "example@domain.net",
                      filled: true,
                      fillColor: Colors.white,
                    ),
                    validator: validateEmail,
                    onSaved: (value) {
                      setState(() {
                        _email = value.toString();
                      });
                    },
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.circular(10.0),
                    color: Colors.white,
                  ),
                  child: DropdownButton(
                    items: sexList,
                    value: _selectedSex,
                    isExpanded: true,
                    hint: const Text("Select Sex"),
                    onChanged: (value) {
                      setState(() {
                        _selectedSex = int.parse(value.toString());
                      });
                    },
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(10),
                  child: TextFormField(
                    decoration: const InputDecoration(
                      labelText: "Enter Age",
                      hintText: "Age",
                      filled: true,
                      fillColor: Colors.white,
                    ),
                    keyboardType: TextInputType.number,
                    validator: (value) {
                      var numVal = int.tryParse(value.toString());
                      if (value!.isEmpty) {
                        return "Please Enter Age!";
                      } else if (value!.isNotEmpty &&
                          (numVal! <= 0 || numVal! >= 120)) {
                        return "Please Enter Valid Age!";
                      } else {
                        return null;
                      }
                    },
                    onSaved: (value) {
                      setState(() {
                        _age = int.parse(value.toString());
                      });
                    },
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(10),
                  child: TextFormField(
                    key: _passKey,
                    obscureText: _isPasswordVisibile,
                    decoration: InputDecoration(
                      labelText: "Enter password",
                      hintText: "Password",
                      filled: true,
                      fillColor: Colors.white,
                      suffixIcon: IconButton(
                        icon: Icon(_isPasswordVisibile
                            ? Icons.visibility_off
                            : Icons.visibility),
                        onPressed: () {
                          setState(() {
                            _isPasswordVisibile = !_isPasswordVisibile;
                          });
                        },
                      ),
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Please Enter a password!";
                      } else if (value.length < 8) {
                        return "Password should be more than 8 characters long!";
                      } else {
                        return null;
                      }
                    },
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(10),
                  child: TextFormField(
                    obscureText: _isConfrimPasswordVisibile,
                    decoration: InputDecoration(
                      labelText: "Confirm Password",
                      hintText: "Password",
                      filled: true,
                      fillColor: Colors.white,
                      suffixIcon: IconButton(
                        icon: Icon(_isConfrimPasswordVisibile
                            ? Icons.visibility_off
                            : Icons.visibility),
                        onPressed: () {
                          setState(() {
                            _isConfrimPasswordVisibile =
                                !_isConfrimPasswordVisibile;
                          });
                        },
                      ),
                    ),
                    validator: (value) {
                      if (value != null && value.isEmpty) {
                        return "Enter password again";
                      }
                      var password = _passKey.currentState?.value;
                      if (value != null && value.compareTo(password) != 0) {
                        return "Password mismatch!";
                      } else {
                        return null;
                      }
                    },
                    onSaved: (value) {
                      setState(() {
                        _password = value.toString();
                      });
                    },
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(10),
                  child: CheckboxListTile(
                    value: _termsChecked,
                    onChanged: (value) {
                      setState(() {
                        _termsChecked =
                            value.toString().toLowerCase() == 'true';
                      });
                    },
                    subtitle: !_termsChecked
                        ? const Text(
                            "Required",
                            style: TextStyle(color: Colors.red, fontSize: 12),
                          )
                        : null,
                    title: const Text("I agree to the terms and conditions"),
                    controlAffinity: ListTileControlAffinity.leading,
                  ),
                ),
                Container(
                  height: 50,
                  width: 350,
                  decoration: BoxDecoration(
                    color: Colors.blueGrey,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: ElevatedButton(
                    // onPressed: () {
                    // },
                    onPressed: onPressedSubmit,
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blueGrey),
                    child: const Text(
                      "Sign Up",
                      style: TextStyle(color: Colors.white, fontSize: 25),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

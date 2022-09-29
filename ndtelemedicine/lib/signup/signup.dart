import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ndtelemedicine/login/login.dart';

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

  // Variables used to store the inputs of the forms
  String _name = '';
  String _email = '';
  int _age = -1;
  int _selectedSexIndex = 0;
  String _selectedSex = '';
  String _password = '';

  bool _isPasswordVisible = true;
  bool _isConfirmPasswordVisible = true;
  bool _termsChecked = false;

  // List used to load the Sex List elements to a Toggle Button
  final List<bool> _initialSexList = <bool>[true, false, false];
  List<Widget> sexList = const <Widget>[
    Text('Male'),
    Text('Female'),
    Text('Other')
  ];

  // Validation Check for email
  String? validateEmail(String? value) {
    if (value!.isEmpty) {
      return "Please enter an email address!";
    }

    // Regex is used to match if an input meets the criteria
    // - Alphanumeric and special symbols before the '@' prefix
    // - Alphabetical characters + Numbers before the '.' symbol
    // - Alphabetical characters after the '.' symbol
    Pattern pattern =
        r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+";
    RegExp regex = RegExp(pattern.toString());
    if (!regex.hasMatch(value.toString())) {
      return "Enter a valid email";
    } else {
      return null;
    }
  }

  // Function after the Sign Up button has been pressed
  // Checks to see if the forms are valid
  // If the form is valid, the page will return to the login screen
  void onPressedSubmit() {
    if (_formKey.currentState!.validate() && _termsChecked) {
      _formKey.currentState?.save();

      // Converts _selectedSexIndex to a string
      if(_selectedSexIndex == 0){ // Index is Male
        _selectedSex = "Male";
      } else if (_selectedSexIndex == 1) { // Index is Female
        _selectedSex = "Female";
      } else { // Index is other
        _selectedSex = "Other";
      }

      // FOR TESTING - showing the inputs after the user has submitted
      showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: const Text('Thanks!'),
              content: Text(
                  'Name: $_name\nemail: $_email\nAge: $_age\nSex: $_selectedSex\nPassword: $_password\n '),
              actions: <Widget>[
                TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                    // Push to login screen after pressing 'OK'
                    Navigator.of(context).push(MaterialPageRoute(builder: (context) => const LoginPage()));
                  },
                  child: const Text('OK'),
                ),
              ],
            );
          });
      // Displays a Snackbar (temporary banner) at the bottom of the screen to show form is submitted successfully
      ScaffoldMessenger.of(context)
          .showSnackBar(const SnackBar(content: Text("Form Submitted")));

    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(21, 101, 192, 1),
        title: SizedBox(
          height: 30,
          child: Image.asset('images/Header-Base.png'),
        ),
        centerTitle: true,
      ),
      body: Container(
        decoration: const BoxDecoration(
            // image: DecorationImage(
            //   image: AssetImage('images/Login-Background.png'),
            //   opacity: 0.6,
            //   fit: BoxFit.fitHeight,
            //   alignment: Alignment.center,
            // ),
            ),
        child: Form(
          key: _formKey,
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: ListView(
              children: <Widget>[
                Container(
                  padding: const EdgeInsets.all(10),
                  // Name form field, requires an non empty input
                  child: TextFormField(
                    decoration: const InputDecoration(
                      labelText: "Name*",
                      hintText: "FirstName LastName",
                      filled: true,
                      fillColor: Colors.white,
                      icon: Icon(Icons.person),
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
                  // Email form field, requires a valid email (refer to validateEmail function)
                  child: TextFormField(
                    decoration: const InputDecoration(
                      labelText: "Email*",
                      hintText: "example@domain.net",
                      filled: true,
                      fillColor: Colors.white,
                      icon: Icon(Icons.mail),
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
                  child: Column(
                    children: <Widget>[
                      const Text('Sex',
                          style: TextStyle(
                              color: Color.fromRGBO(112, 112, 112, 1),
                              fontSize: 18)),
                      const SizedBox(height: 5),
                      // Sex ToggleButton, only one element can be selected, on default 'Male' is initial value)
                      ToggleButtons(
                        direction: Axis.horizontal,
                        onPressed: (int index) {
                          setState(() {
                            for (int i = 0; i < _initialSexList.length; i++) {
                              _initialSexList[i] = i == index;
                            }
                            _selectedSexIndex = int.parse(index.toString());
                          });
                        },
                        borderRadius: BorderRadius.circular(10.0),
                        selectedBorderColor: Colors.blue[700],
                        selectedColor: Colors.white,
                        fillColor: Colors.blueAccent,
                        constraints: const BoxConstraints(
                          minHeight: 60.0,
                          minWidth: 60.0,
                        ),
                        isSelected: _initialSexList,
                        children: sexList,
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(10),
                  // Age form field, requires a valid age (Range between 1-119)
                  child: TextFormField(
                    decoration: const InputDecoration(
                      labelText: "Age*",
                      hintText: "How old are you?",
                      filled: true,
                      fillColor: Colors.white,
                      icon: Icon(Icons.date_range),
                    ),
                    inputFormatters: [FilteringTextInputFormatter.digitsOnly], // Formats input to only allow digits [0-9]
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
                  // Password form field, requires non empty input and input length is larger or equal to 8
                  child: TextFormField(
                    key: _passKey,
                    obscureText: _isPasswordVisible,
                    decoration: InputDecoration(
                      labelText: "Password*",
                      filled: true,
                      fillColor: Colors.white,
                      icon: Icon(Icons.lock),
                      suffixIcon: IconButton(
                        icon: Icon(_isPasswordVisible
                            ? Icons.visibility_off
                            : Icons.visibility),
                        onPressed: () {
                          setState(() {
                            _isPasswordVisible = !_isPasswordVisible;
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
                  // Password Confirm form field, requires same input as Password form field
                  child: TextFormField(
                    obscureText: _isConfirmPasswordVisible,
                    decoration: InputDecoration(
                      labelText: "Re-type password*",
                      filled: true,
                      fillColor: Colors.white,
                      icon: Icon(Icons.lock),
                      suffixIcon: IconButton(
                        icon: Icon(_isConfirmPasswordVisible
                            ? Icons.visibility_off
                            : Icons.visibility),
                        onPressed: () {
                          setState(() {
                            _isConfirmPasswordVisible =
                                !_isConfirmPasswordVisible;
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
                  // Confirmation Checkbox, required to be ticked
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
                  // Sign Up button, performs a form validation check before submitting, if form is valid, return to login page
                  child: ElevatedButton(
                    onPressed: onPressedSubmit,
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blueAccent),
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

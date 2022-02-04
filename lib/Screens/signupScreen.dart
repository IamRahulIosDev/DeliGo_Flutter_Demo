import 'package:flutter/material.dart';

class signupScreen extends StatelessWidget {
  signupScreen({Key? key}) : super(key: key);
  final _firstNameTextController = TextEditingController();
  final _lastNameTextController = TextEditingController();
  final _emailTextController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "SIGN UP",
        ),
        backgroundColor: Colors.black,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 30.0,
            vertical: 50.0,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 20.0),
                child: Center(
                  child: Text(
                    "Enter your contact information",
                    style: TextStyle(
                      fontWeight: FontWeight.normal,
                      fontSize: 20.0,
                    ),
                  ),
                ),
              ),
              signupCustomTextField(
                "First Name",
                _firstNameTextController,
              ),
              signupCustomTextField(
                "Last Name",
                _lastNameTextController,
              ),
              signupCustomTextField(
                "Email",
                _emailTextController,
              ),
              Padding(
                padding: const EdgeInsets.only(
                  top: 25.0,
                ),
                child: Text(
                  "Mobile",
                  style: TextStyle(
                    fontWeight: FontWeight.normal,
                    fontSize: 14,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  top: 12.0,
                ),
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.grey[200],
                    borderRadius: BorderRadius.circular(
                      50.0,
                    ),
                  ),
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(
                          left: 20.0,
                        ),
                        child: Text(
                          "+971",
                          style: TextStyle(
                            color: Colors.grey[800],
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                          left: 10.0,
                        ),
                        child: Container(
                          width: 2.0,
                          height: 25.0,
                          color: Colors.blue,
                        ),
                      ),
                      Flexible(
                          child: TextFormField(
                        decoration: InputDecoration(
                          contentPadding: const EdgeInsets.only(
                            left: 10.0,
                          ),
                          filled: true,
                          fillColor: Colors.transparent,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(
                              50.0,
                            ),
                            borderSide: BorderSide.none,
                          ),
                          hintText: "Mobile",
                        ),
                      )),
                    ],
                  ),
                ),
              ),
              Center(
                child: Padding(
                  padding: const EdgeInsets.only(top: 50.0),
                  child: ElevatedButton(
                    onPressed: () {
                      print(_firstNameTextController.text);
                      print(_lastNameTextController.text);
                      print(_emailTextController.text);
                    },
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        vertical: 15.0,
                        horizontal: 50.0,
                      ),
                      child: Text(
                        "SEND OTP",
                        style: TextStyle(
                          fontSize: 16.0,
                        ),
                      ),
                    ),
                    style: ButtonStyle(
                      elevation: MaterialStateProperty.all(0),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(
                              50.0,
                            ),
                          ),
                          side: BorderSide.none,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

//MARK: - custom text fields for sign up details (user input)

class signupCustomTextField extends StatefulWidget {
  signupCustomTextField(this.hintText, this.customController);
  String hintText;
  TextEditingController customController;

  @override
  State<signupCustomTextField> createState() => _signupCustomTextFieldState();
}

class _signupCustomTextFieldState extends State<signupCustomTextField> {
  var isCompleteTyping = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        top: 25.0,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            widget.hintText,
            style: TextStyle(
              fontWeight: FontWeight.normal,
              fontSize: 14,
            ),
          ),
          FocusScope(
            onFocusChange: (val) {
              if (!val) {
                if (!widget.customController.text.isEmpty) {
                  setState(() {
                    isCompleteTyping = true;
                  });
                } else {
                  setState(() {
                    isCompleteTyping = false;
                  });
                }
              }
            },
            child: Padding(
              padding: const EdgeInsets.only(
                top: 12.0,
              ),
              child: TextFormField(
                controller: widget.customController,
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.only(
                    left: 20.0,
                  ),
                  filled: true,
                  fillColor: Colors.grey[200],
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(
                      50.0,
                    ),
                    borderSide: BorderSide.none,
                  ),
                  hintText: widget.hintText,
                  suffixIcon: isCompleteTyping == false
                      ? null
                      : Icon(
                          Icons.check,
                          color: Colors.green,
                        ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

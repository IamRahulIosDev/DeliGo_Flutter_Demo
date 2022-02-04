import 'package:flutter/material.dart';

class otpLoginScreen extends StatefulWidget {
  const otpLoginScreen({Key? key}) : super(key: key);

  @override
  State<otpLoginScreen> createState() => _otpLoginScreenState();
}

class _otpLoginScreenState extends State<otpLoginScreen> {
  // 4 text editing controllers that associate with the 4 input fields
  final TextEditingController _fieldOne = TextEditingController();
  final TextEditingController _fieldTwo = TextEditingController();
  final TextEditingController _fieldThree = TextEditingController();
  final TextEditingController _fieldFour = TextEditingController();

  // This is the entered code
  String? _otp;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "LOGIN",
        ),
        backgroundColor: Colors.black,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        color: Colors.transparent,
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 30.0,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Padding(
                  padding: EdgeInsets.only(bottom: 20.0),
                  child: Center(
                    child: Text(
                      "Enter received OTP code below",
                      style: TextStyle(
                        fontWeight: FontWeight.normal,
                        fontSize: 20.0,
                      ),
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Flexible(child: OtpInput(_fieldOne, true)),
                    Flexible(child: OtpInput(_fieldTwo, false)),
                    Flexible(child: OtpInput(_fieldThree, false)),
                    Flexible(child: OtpInput(_fieldFour, false))
                  ],
                ),
                Center(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 50.0),
                    child: ElevatedButton(
                      onPressed: () {
                        setState(
                          () {
                            _otp = _fieldOne.text +
                                _fieldTwo.text +
                                _fieldThree.text +
                                _fieldFour.text;
                          },
                        );
                        print(_otp ?? "Please enter OTP for complete");
                      },
                      child: const Padding(
                        padding: EdgeInsets.symmetric(
                          vertical: 15.0,
                          horizontal: 20.0,
                        ),
                        child: Text(
                          "CREATE ACCOUNT",
                          style: TextStyle(
                            fontSize: 16.0,
                          ),
                        ),
                      ),
                      style: ButtonStyle(
                        elevation: MaterialStateProperty.all(0),
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                          const RoundedRectangleBorder(
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
                Padding(
                  padding: const EdgeInsets.only(top: 10.0),
                  child: TextButton(
                    onPressed: () {},
                    child: const Text(
                      "Did not receive the code? Send again",
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

// Create an input widget that takes only one digit
class OtpInput extends StatelessWidget {
  final TextEditingController controller;
  final bool autoFocus;
  const OtpInput(this.controller, this.autoFocus, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: TextField(
        autofocus: autoFocus,
        textAlign: TextAlign.center,
        keyboardType: TextInputType.number,
        controller: controller,
        maxLength: 1,
        // cursorColor: Theme.of(context).primaryColor,
        decoration: const InputDecoration(
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(
              color: Colors.blue,
              width: 2.0,
            ),
          ),
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(
              color: Colors.blue,
              width: 2.0,
            ),
          ),
          border: UnderlineInputBorder(
            borderSide: BorderSide(
              color: Colors.blue,
              width: 2.0,
            ),
          ),
          counterText: '',
          hintStyle: TextStyle(
            color: Colors.black,
            fontSize: 20.0,
          ),
        ),
        onChanged: (value) {
          if (value.length == 1) {
            FocusScope.of(context).nextFocus();
          } else if (value.isEmpty) {
            FocusScope.of(context).previousFocus();
          }
        },
        style: TextStyle(
          fontSize: 20.0,
          fontWeight: FontWeight.bold,
        ),
        obscureText: true,
      ),
    );
  }
}

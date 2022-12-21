import 'package:flutter/material.dart';
import 'package:midterm/utils/helpers.dart';

import '../constant/routes.dart';
import '../utils/buttons/elevatedbutton.dart';

enum SignupValidationState {
  usernameInvalid,
}

class SignupPage extends StatefulWidget {
  const SignupPage({Key? key}) : super(key: key);

  @override
  _SignupPageState createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();
  final _passwordConfirmController = TextEditingController();
  final _emailAddressController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Form(
          key: _formKey,
          child: ListView(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            children: <Widget>[
              addVerticalSpace(12),
              TextFormField(
                controller: _usernameController,
                decoration: const InputDecoration(
                  filled: true,
                  labelText: 'Username',
                ),
                obscureText: false,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter username';
                  }
                  if (!isUsernameValid(value)) {
                    return 'Username is invalid';
                  }
                  return null;
                },
              ),
              addVerticalSpace(12),
              TextFormField(
                controller: _passwordController,
                decoration: const InputDecoration(
                  filled: true,
                  labelText: 'Password',
                ),
                obscureText: true,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter password';
                  }
                  return null;
                },
              ),
              addVerticalSpace(12),
              TextFormField(
                controller: _passwordConfirmController,
                decoration: const InputDecoration(
                  filled: true,
                  labelText: 'Confirm Password',
                ),
                obscureText: true,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter password';
                  }
                  if (value != _passwordController.text) {
                    return "Confirm Password doesn't match Password";
                  }
                  return null;
                },
              ),
              addVerticalSpace(12),
              TextFormField(
                controller: _emailAddressController,
                decoration: const InputDecoration(
                  filled: true,
                  labelText: 'Email Address',
                ),
                obscureText: false,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter email address';
                  }
                  return null;
                },
              ),
              addVerticalSpace(12),
              OverflowBar(
                alignment: MainAxisAlignment.end,
                children: <Widget>[
                  MyElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          Navigator.pushNamedAndRemoveUntil(context, loginRoute, (route) => false);
                        }
                      },
                      text: 'SIGN UP'),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

bool isUsernameValid(String userName) {
  bool hasThreeDigits = userName.contains(RegExp(r'[0-9]{3,}'));
  bool hasThreeCharacters = userName.contains(RegExp(r'[a-zA-Z]{3,}'));
  //bool hasSpecialCharacters = userName.contains(RegExp(r'[!@#$%^&*(),.?":{}|<>]'));
  bool hasMinLength = userName.length > 6;

  return hasThreeDigits & hasThreeCharacters & hasMinLength;
}

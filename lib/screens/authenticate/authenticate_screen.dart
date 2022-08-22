import 'package:flutter/material.dart';
import 'package:fluttertestsocial/common/constants.dart';
import 'package:fluttertestsocial/common/loading.dart';

class AuthenticateScreen extends StatefulWidget {
  const AuthenticateScreen({super.key});

  @override
  State<AuthenticateScreen> createState() => _AuthenticateScreenState();
}

class _AuthenticateScreenState extends State<AuthenticateScreen> {
  final _formKey = GlobalKey<FormState>();
  String error = '';
  bool loading = false;

  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  bool showSignIn = true;

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  void toogleView() {
    setState(() {
      _formKey.currentState!.reset();
      error = '';
      emailController.text = '';
      passwordController.text = '';
      showSignIn = !showSignIn;
    });
  }

  @override
  Widget build(BuildContext context) {
    return loading
        ? const Loading()
        : Scaffold(
            backgroundColor: Colors.white,
            appBar: AppBar(
              backgroundColor: Colors.blueGrey,
              elevation: 0,
              title: Text(showSignIn
                  ? 'Sign in to Water Social'
                  : 'Register to Water Social'),
              actions: <Widget>[
                TextButton.icon(
                  onPressed: () => toogleView(),
                  icon: const Icon(
                    Icons.person,
                    color: Colors.white,
                  ),
                  label: Text(
                    showSignIn ? 'Register' : 'Sign In',
                    style: const TextStyle(
                      color: Colors.white,
                    ),
                  ),
                )
              ],
            ),
            body: Container(
              padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 30),
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    TextFormField(
                      controller: emailController,
                      decoration:
                          textInputDecoration.copyWith(hintText: 'email'),
                      validator: (value) =>
                          value!.isEmpty ? 'Enter an email' : null,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    TextFormField(
                      controller: passwordController,
                      decoration:
                          textInputDecoration.copyWith(hintText: 'password'),
                      obscureText: true,
                      validator: (value) => value!.length < 6
                          ? 'Enter an password with at least 6 characters'
                          : null,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          setState(() => loading = true);
                          var password = passwordController.value.text;
                          var email = passwordController.value.text;

                          // TODO Call firebase auth
                        }

                        dynamic result = null;

                        if (result == null) {
                          setState(() {
                            loading = false;
                            error = 'Please supply a valid email';
                          });
                        }
                      },
                      child: Text(
                        showSignIn ? 'Sign In' : 'Register',
                        style: const TextStyle(color: Colors.white),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      error,
                      style: const TextStyle(
                        color: Colors.red,
                        fontSize: 15,
                      ),
                    )
                  ],
                ),
              ),
            ),
          );
  }
}

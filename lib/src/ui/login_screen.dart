import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({Key? key}) : super(key: key);

  final _usernameController = TextEditingController();
  final _passowrdController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Login",
              style: Theme.of(context).textTheme.headline4,
            ),
            TextField(
              controller: _usernameController,
              decoration: InputDecoration(
                hintText: "username",
                // TODO: Add username error text
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            TextField(
              controller: _passowrdController,
              decoration: InputDecoration(
                hintText: "password",
                // TODO: Add password error text
              ),
              obscureText: true,
            ),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
              onPressed: () {
                // TODO : Validate then navigate to Home
              },
              child: const Text("Login"),
            )
          ],
        ),
      ),
    );
  }
}

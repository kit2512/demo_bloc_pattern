import 'package:demo_bloc_pattern/src/blocs/login_bloc.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({Key? key}) : super(key: key);

  final _loginBlog = LoginBlog();
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
            StreamBuilder<String>(
              stream: _loginBlog.userStream,
              builder: (context, snapshot) {
                return TextField(
                  controller: _usernameController,
                  decoration: InputDecoration(
                    hintText: "username",
                    errorText:
                        snapshot.hasError ? snapshot.error.toString() : null,
                  ),
                );
              },
            ),
            const SizedBox(
              height: 20,
            ),
            StreamBuilder<String>(
              stream: _loginBlog.passswordStream,
              initialData: null,
              builder: (context, snapshot) {
                return TextField(
                  controller: _passowrdController,
                  decoration: InputDecoration(
                    hintText: "password",
                    errorText:
                        snapshot.hasError ? snapshot.error.toString() : null,
                  ),
                  obscureText: true,
                );
              },
            ),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
              onPressed: () {
                if (_loginBlog.isValidInfo(
                    _usernameController.text, _passowrdController.text)) {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return const Scaffold(
                      body: Center(
                        child: Text("Success"),
                      ),
                    );
                  }));
                }
              },
              child: const Text("Login"),
            )
          ],
        ),
      ),
    );
  }
}

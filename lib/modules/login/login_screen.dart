import 'package:first_flutter_application/shared/components/componets.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  var emailControler = TextEditingController();

  var passwordControler = TextEditingController();

  var formKey = GlobalKey<FormState>();

  bool showPassword = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.login_outlined),
        title: Text('Login Page'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Center(
          child: SingleChildScrollView(
            child: Form(
              key: formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Login',
                    style: TextStyle(fontSize: 40.0, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 40.0,
                  ),
                  defulteFormField(
                    controller: emailControler,
                    label: 'email address',
                    keyboardType: TextInputType.emailAddress,
                    prefix: Icons.email,
                    validate: (value){
                      if(value!.isEmpty){
                        return 'email can not be empty';
                      }
                      return null;
                    }
                  ),
                  SizedBox(
                    height: 15.0,
                  ),
                  defulteFormField(
                      controller: passwordControler,
                      isPassword: !showPassword,
                      label: 'Password',
                      keyboardType: TextInputType.visiblePassword,
                      prefix: Icons.lock,
                      suffix: GestureDetector(
                        onTap: (){
                          setState(() {
                            showPassword = !showPassword;
                          });
                        },
                        child: Icon(
                            showPassword ? Icons.visibility_off : Icons.visibility
                        ),
                      ),
                      validate: (value){
                        if(value!.isEmpty){
                          return 'password is too short';
                        }
                        return null;
                      }
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  defulteButton(
                    text: 'login',
                    function: () {
                      if(formKey.currentState!.validate()){
                        print(emailControler.text);
                        print(passwordControler.text);
                      }
                    },
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  Row(
                    children: [
                      Text(
                        'Don\'t have an account?',
                      ),
                      TextButton(
                        child: Text(
                          'Register Now',
                        ),
                        onPressed: () {},
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

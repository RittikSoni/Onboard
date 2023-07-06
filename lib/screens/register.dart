import 'package:flutter/material.dart';
import 'package:rs_onboard/constant/style.dart';
import 'package:rs_onboard/screens/login.dart';
import 'package:rs_onboard/utils/route.dart';

class Register extends StatefulWidget {
  const Register({Key? key}) : super(key: key);

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  bool hidePassword = true;
  bool hideConfirmPassword = true;
  bool isAgree = false;

  String? emailError;
  String? usernameError;
  String? passError;
  String? confirmPassError;
  @override
  Widget build(BuildContext context) {
    const textStyle = TextStyle(fontWeight: FontWeight.w600);
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(
            left: 15.0, right: 15.0, top: 50.0, bottom: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          mainAxisSize: MainAxisSize.max,
          children: [
            const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Create Account',
                  style: CustomStyle.headingTextStyle,
                ),
                Text(
                  'Connect with your friends today',
                  style: CustomStyle.subHeadingTextStyle,
                ),
              ],
            ),
            const SizedBox(
              height: 10.0,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Email',
                  style: textStyle,
                ),
                TextField(
                  controller: _emailController,
                  textInputAction: TextInputAction.next,
                  keyboardType: TextInputType.emailAddress,
                  decoration: customTextFieldDecoration(
                    hintText: 'Enter your email here',
                    errorText: emailError,
                  ),
                ),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Username',
                  style: textStyle,
                ),
                TextField(
                  controller: _usernameController,
                  textInputAction: TextInputAction.next,
                  keyboardType: TextInputType.emailAddress,
                  decoration: customTextFieldDecoration(
                    hintText: 'Enter your username here',
                    errorText: usernameError,
                  ),
                ),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Password',
                  style: textStyle,
                ),
                TextField(
                  controller: _passwordController,
                  textInputAction: TextInputAction.next,
                  obscureText: hidePassword,
                  enableSuggestions: false,
                  autocorrect: false,
                  decoration: customTextFieldDecoration(
                    hintText: 'Enter your password here',
                    errorText: passError,
                    isPass: true,
                    toogle: hidePassword,
                    onIconTap: () {
                      setState(() {
                        hidePassword = !hidePassword;
                      });
                    },
                  ),
                ),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Confirm Password',
                  style: textStyle,
                ),
                TextField(
                  controller: _confirmPasswordController,
                  textInputAction: TextInputAction.done,
                  obscureText: hideConfirmPassword,
                  enableSuggestions: false,
                  autocorrect: false,
                  decoration: customTextFieldDecoration(
                    hintText: 'Confirm password here',
                    errorText: confirmPassError,
                    isPass: true,
                    toogle: hideConfirmPassword,
                    onIconTap: () {
                      setState(() {
                        hideConfirmPassword = !hideConfirmPassword;
                      });
                    },
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InkWell(
                  onTap: () {
                    setState(() {
                      isAgree = !isAgree;
                    });
                  },
                  child: Row(
                    children: [
                      Checkbox(
                        value: isAgree,
                        onChanged: null,
                        checkColor: Colors.white,
                        fillColor: const MaterialStatePropertyAll(Colors.blue),
                      ),
                      const Text('I agree to the terms and conditions.'),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                style: customButtonStyle(),
                onPressed: () {
                  if (_emailController.text.trim().isEmpty ||
                      _usernameController.text.trim().isEmpty ||
                      _passwordController.text.trim().isEmpty ||
                      _confirmPasswordController.text.trim().isEmpty) {
                    setState(() {
                      emailError = _emailController.text.trim().isEmpty
                          ? 'Email required.'
                          : null;
                      usernameError = _usernameController.text.trim().isEmpty
                          ? 'Username required.'
                          : null;
                      passError = _passwordController.text.trim().isEmpty
                          ? 'Password required'
                          : null;
                      confirmPassError =
                          _confirmPasswordController.text.trim().isEmpty
                              ? 'Confirm password required.'
                              : null;
                    });
                  } else if (_passwordController.text.trim() !=
                      _confirmPasswordController.text.trim()) {
                    setState(() {
                      emailError = null;
                      usernameError = null;
                      passError = null;
                      confirmPassError = 'Password does not match.';
                    });
                  } else {
                    setState(() {
                      emailError = null;
                      usernameError = null;
                      passError = null;
                      confirmPassError = null;
                    });
                  }
                },
                child: const Text('Next'),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text('Already have an account?'),
                TextButton(
                    onPressed: () {
                      CustomRoute()
                          .pushRemove(context: context, page: const Login());
                    },
                    child: const Text('LogIn')),
              ],
            )
          ],
        ),
      ),
    );
  }

  InputDecoration customTextFieldDecoration({
    String? hintText,
    String? errorText,
    bool? isPass,
    bool? toogle,
    VoidCallback? onIconTap,
  }) {
    return InputDecoration(
      errorText: errorText,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      filled: true,
      hintStyle: TextStyle(color: Colors.grey[800]),
      hintText: hintText ?? 'Type here...',
      fillColor: Colors.white70,
      suffixIcon: isPass == true
          ? IconButton(
              onPressed: onIconTap,
              icon:
                  Icon(toogle == true ? Icons.remove_red_eye : Icons.password),
            )
          : null,
    );
  }
}

import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:rs_onboard/constant/style.dart';
import 'package:rs_onboard/screens/home.dart';
import 'package:rs_onboard/screens/register.dart';
import 'package:rs_onboard/utils/route.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  bool hidePassword = true;
  bool isRememberMe = false;
  String? username;
  String? profile;
  final GoogleSignIn _googleSignIn = GoogleSignIn();
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
                  'Hi,Welcome back ! 👋',
                  style: CustomStyle.headingTextStyle,
                ),
                Text(
                  'Hello again, you\'ve been missed!',
                  style: CustomStyle.subHeadingTextStyle,
                ),
              ],
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
                  keyboardType: TextInputType.emailAddress,
                  decoration: customTextFieldDecoration(
                      hintText: 'Enter your email here'),
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
                  obscureText: hidePassword,
                  enableSuggestions: false,
                  autocorrect: false,
                  decoration: customTextFieldDecoration(
                    hintText: 'Enter your password here',
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
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InkWell(
                  onTap: () {
                    setState(() {
                      isRememberMe = !isRememberMe;
                    });
                  },
                  child: Row(
                    children: [
                      Checkbox(
                        value: isRememberMe,
                        onChanged: null,
                        checkColor: Colors.white,
                        fillColor: const MaterialStatePropertyAll(Colors.blue),
                      ),
                      const Text('Remember me'),
                    ],
                  ),
                ),
                TextButton(
                    onPressed: () {}, child: const Text('forgot password?')),
              ],
            ),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {},
                style: customButtonStyle(),
                child: const Text('Login'),
              ),
            ),
            const Row(children: <Widget>[
              Expanded(
                  child: Divider(
                endIndent: 10.0,
              )),
              Text("Or Login With"),
              Expanded(
                  child: Divider(
                indent: 10.0,
              )),
            ]),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SocialButton(
                    isGoogle: true,
                    onTap: () async {
                      await _googleSignIn.signIn().then(
                            (value) => {
                              setState(
                                () {
                                  username = value?.displayName;
                                  profile = value?.photoUrl;
                                },
                              ),
                              CustomRoute().pushRemove(
                                  context: context,
                                  page: Home(
                                    username: username,
                                    imageUrl: profile,
                                  ))
                            },
                          );
                    }),
                const SocialButton(),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text('Don\'t have an account?'),
                TextButton(
                    onPressed: () {
                      CustomRoute()
                          .push(context: context, page: const Register());
                    },
                    child: const Text('SignUp')),
              ],
            )
          ],
        ),
      ),
    );
  }

  InputDecoration customTextFieldDecoration({
    String? hintText,
    bool? isPass,
    bool? toogle,
    VoidCallback? onIconTap,
  }) {
    return InputDecoration(
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

class SocialButton extends StatelessWidget {
  const SocialButton({
    this.isGoogle,
    this.onTap,
    super.key,
  });
  final bool? isGoogle;
  final VoidCallback? onTap;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(10.0),
      onTap: onTap ?? () {},
      child: Container(
        padding: const EdgeInsets.all(10.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          border: Border.all(color: Colors.grey),
        ),
        child: Row(
          children: [
            isGoogle == true
                ? Image.network(
                    'https://pixlok.com/wp-content/uploads/2021/04/Google-Icon-PNG.jpg',
                    height: 20.0,
                    width: 20.0,
                  )
                : const Icon(Icons.facebook),
            const SizedBox(
              width: 10.0,
            ),
            Text(isGoogle == true ? 'Google' : 'facebook'),
          ],
        ),
      ),
    );
  }
}

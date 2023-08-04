import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../main_screen.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final formKey = GlobalKey<FormState>(); //
  late TextEditingController usernameCtrl;
  late TextEditingController passwordCtrl;
  late TextEditingController confirmpasswordCtrl;
  bool isobscure = true;
  bool isconfirmobscure = true;
  @override
  void initState() {
    usernameCtrl = TextEditingController();
    passwordCtrl = TextEditingController();
    confirmpasswordCtrl = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    usernameCtrl.dispose();
    passwordCtrl.dispose();
    confirmpasswordCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                children: [
                  Container(
                    height: 60,
                    width: 100,
                    color: Colors.teal.shade200,
                  ),
                ],
              ),
              const SizedBox(
                height: 12,
              ),
              const Text(
                "Let's study together.",
                style: TextStyle(
                    color: Colors.black87,
                    fontSize: 16,
                    fontWeight: FontWeight.normal),
              ),
              const SizedBox(
                height: 12,
              ),
              Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: InkWell(
                      onTap: () {},
                      child: Container(
                        padding: const EdgeInsets.symmetric(vertical: 12),
                        decoration: BoxDecoration(
                            color: Colors.transparent,
                            borderRadius:
                                const BorderRadius.all(Radius.circular(6)),
                            border: Border.all(
                                color: Colors.grey.shade300, width: 1)),
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset(
                                "assets/ic/fb-ic.png",
                                height: 32,
                              ),
                              const SizedBox(
                                width: 8,
                              ),
                              const Text("Facebook")
                            ]),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                  Expanded(
                    flex: 1,
                    child: InkWell(
                      onTap: () {},
                      child: Container(
                        padding: const EdgeInsets.symmetric(vertical: 12),
                        decoration: BoxDecoration(
                            color: Colors.transparent,
                            borderRadius:
                                const BorderRadius.all(Radius.circular(6)),
                            border: Border.all(
                                color: Colors.grey.shade300, width: 1)),
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset(
                                "assets/ic/g-ic.png",
                                height: 32,
                              ),
                              const SizedBox(
                                width: 8,
                              ),
                              const Text("Google")
                            ]),
                      ),
                    ),
                  )
                ],
              ),
              const SizedBox(
                height: 16,
              ),
              Container(
                  padding: const EdgeInsets.all(5),
                  decoration:
                      BoxDecoration(border: Border.all(color: Colors.grey)),
                  child: Form(
                      key: formKey,
                      child: Column(
                        children: [
                          TextFormField(
                            controller: usernameCtrl,
                            style: const TextStyle(color: Colors.black87),
                            cursorColor: Colors.teal.shade200,
                            decoration: InputDecoration(
                              prefixIcon: Icon(
                                Icons.person_outline,
                                color: Colors.teal.shade200,
                                size: 27,
                              ),
                              border: InputBorder.none,
                              hintText: 'Username',
                              hintStyle: TextStyle(
                                  color: Colors.grey.shade400,
                                  fontWeight: FontWeight.w400),
                            ),
                            validator: (value) {
                              if (value!.isEmpty ||
                                  !RegExp(r'[a-z A-Z]+$').hasMatch(value)) {
                                return "Please enter correct username";
                              } else {
                                return null;
                              }
                            },
                          ),
                          Container(
                              margin: const EdgeInsets.symmetric(
                                  vertical: 1, horizontal: 18),
                              child: const Divider(
                                thickness: 1,
                                height: 1,
                                color: Colors.grey,
                              )),
                          TextFormField(
                            controller: passwordCtrl,
                            obscureText: isobscure,
                            style: const TextStyle(color: Colors.black87),
                            cursorColor: Colors.teal.shade200,
                            decoration: InputDecoration(
                              prefixIcon: Icon(
                                Icons.lock_outlined,
                                color: Colors.teal.shade200,
                                size: 27,
                              ),
                              suffixIcon: TextButton(
                                  onPressed: () {
                                    setState(() {
                                      isobscure = !isobscure;
                                    });
                                  },
                                  child: Text(
                                    isobscure ? "Show" : "Hide",
                                    style: const TextStyle(
                                        color: Colors.grey, fontSize: 17),
                                  )),
                              border: InputBorder.none,
                              hintText: 'Password',
                              hintStyle: TextStyle(
                                  color: Colors.grey.shade400,
                                  fontWeight: FontWeight.w400),
                            ),
                            validator: (value) {
                              if (value!.isEmpty ||
                                  !RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$')
                                      .hasMatch(value)) {
                                return "Please enter a valid password";
                              } else {
                                return null;
                              }
                            },
                          ),
                          Container(
                              margin: const EdgeInsets.symmetric(
                                  vertical: 1, horizontal: 18),
                              child: const Divider(
                                thickness: 1,
                                height: 1,
                                color: Colors.grey,
                              )),
                          TextFormField(
                            controller: confirmpasswordCtrl,
                            obscureText: isconfirmobscure,
                            style: const TextStyle(color: Colors.black87),
                            cursorColor: Colors.teal.shade200,
                            decoration: InputDecoration(
                              prefixIcon: Icon(
                                Icons.lock_outlined,
                                color: Colors.teal.shade200,
                                size: 27,
                              ),
                              suffixIcon: TextButton(
                                  onPressed: () {
                                    setState(() {
                                      isconfirmobscure = !isconfirmobscure;
                                    });
                                  },
                                  child: Text(
                                    isconfirmobscure ? "Show" : "Hide",
                                    style: const TextStyle(
                                        color: Colors.grey, fontSize: 17),
                                  )),
                              border: InputBorder.none,
                              hintText: 'Confirm Password',
                              hintStyle: TextStyle(
                                  color: Colors.grey.shade400,
                                  fontWeight: FontWeight.w400),
                            ),
                            validator: (value) {
                              if (value!.isEmpty) {
                                return "Please confirm your new password";
                              }
                              if (value != passwordCtrl.text) {
                                return "Confirm password doesn't match ";
                              } else {
                                return null;
                              }
                            },
                          )
                        ],
                      ))),
              const SizedBox(
                height: 22,
              ),
              Row(
                children: [
                  Expanded(
                    child: CupertinoButton(
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        color: Colors.teal.shade400,
                        borderRadius:
                            const BorderRadius.all(Radius.circular(6)),
                        child: const Text(
                          'Start Reading',
                          style: TextStyle(color: Colors.white),
                        ),
                        onPressed: () {
                          if (formKey.currentState!.validate()) {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const MainScreenPage()));
                          }
                          // Navigator.push(
                          //     context,
                          //     MaterialPageRoute(
                          //         builder: (context) =>
                          //             const MainScreenPage()));
                        }),
                  ),
                ],
              ),
              const SizedBox(
                height: 7,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Already a member?",
                    style: TextStyle(
                        color: Colors.teal.shade200,
                        //fontWeight: FontWeight.bold,
                        fontSize: 16),
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                  TextButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const RegisterPage()));
                        Navigator.of(context).pop();
                      },
                      child: Text(
                        "Signin",
                        style: TextStyle(
                            color: Colors.teal.shade200,
                            fontWeight: FontWeight.bold,
                            fontSize: 16),
                      ))
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

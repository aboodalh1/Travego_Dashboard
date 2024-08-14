import 'package:flutter/material.dart';
import 'package:travego_dashboard/Dio/dioHelper.dart';
import 'package:travego_dashboard/feature/desktop_feature/presentation/desktop/Home_screen.dart';
import 'package:travego_dashboard/models/user_model.dart';
import 'package:travego_dashboard/shared/component/component.dart';
import 'package:travego_dashboard/shared/constant/constant.dart';

import '../../../../models/get_all_client/all_client_model.dart';

class Desktoplogin extends StatefulWidget {
  Desktoplogin({super.key});

  @override
  State<Desktoplogin> createState() => _DesktoploginState();
}

class _DesktoploginState extends State<Desktoplogin> {
  var emailController = TextEditingController();
  var passwordController = TextEditingController();

  Map<String, String?> user = {'email': '', 'password': ''};

  var formKey = GlobalKey<FormState>();
  final GlobalKey<FormState> _formkey = GlobalKey();

  var pv = true;
  var pvc = true;
  bool isloading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: const BoxDecoration(
          gradient: LinearGradient(colors: [
            Color.fromARGB(255, 1, 144, 160),
            Color.fromARGB(255, 162, 231, 255),
            Color.fromARGB(185, 1, 144, 160),
            Color.fromARGB(255, 162, 231, 255),
          ]),
        ),
        child: Column(
          children: [
            Row(
              children: [
                Container(
                  alignment: Alignment.centerLeft,
                  padding: const EdgeInsets.only(left: 40, top: 10),
                  height: MediaQuery.of(context).size.height * 0.18,
                  child: const Text(
                    'Welcom To Travego',
                    style: TextStyle(
                        fontSize: 50,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        fontFamily: 'RobotoCondensed'),
                  ),
                ),
              ],
            ),
            Container(
              margin: const EdgeInsets.only(left: 20, right: 10),
              height: MediaQuery.of(context).size.height * 0.7,
              width: MediaQuery.of(context).size.width * 0.5,
              child: Card(
                shadowColor: Colors.black,
                elevation: 20,
                color: const Color.fromARGB(255, 253, 253, 253),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(50),
                ),
                child: isloading == false
                    ? Column(
                        children: [
                          Container(
                            padding: const EdgeInsets.only(top: 10, bottom: 30),
                            alignment: Alignment.center,
                            child: const Text(
                              'Login in Dashboard',
                              style: TextStyle(
                                fontSize: 40,
                                color: Color.fromARGB(255, 1, 144, 160),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.27,
                            width: MediaQuery.of(context).size.width * 0.65,
                            // color: Colors.amber,
                            child: LayoutBuilder(
                                builder: (ctx, cont) => Form(
                                      key: _formkey,
                                      child: Column(
                                        children: [
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              SizedBox(
                                                width: cont.maxWidth * 0.53,
                                                child: TextFormField(
                                                  controller: emailController,
                                                  decoration: InputDecoration(
                                                      labelText: ' Email ',
                                                      labelStyle: TextStyle(
                                                          color: const Color
                                                                  .fromARGB(255, 1,
                                                                  144, 160)
                                                              .withOpacity(0.5),
                                                          fontSize: 18),
                                                      icon: const Icon(
                                                        Icons.email,
                                                        color: Color.fromARGB(
                                                            255, 1, 144, 160),
                                                        size: 37,
                                                      ),
                                                      focusedBorder:
                                                          const OutlineInputBorder(
                                                              borderSide:
                                                                  BorderSide(
                                                        color: Color.fromARGB(
                                                            255, 1, 144, 160),
                                                      )),
                                                      enabledBorder:
                                                          OutlineInputBorder(
                                                        borderSide:
                                                            const BorderSide(
                                                          color: Color.fromARGB(
                                                              255, 1, 144, 160),
                                                          width: 1.4,
                                                        ),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(30),
                                                      ),
                                                      border: OutlineInputBorder(
                                                          borderSide:
                                                              const BorderSide(
                                                                  color: Color
                                                                      .fromARGB(
                                                                          255,
                                                                          1,
                                                                          144,
                                                                          160),
                                                                  width: 2.0),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      8.0))),
                                                  validator: (val) {
                                                    if (val == null ||
                                                        val.isEmpty) {
                                                      return 'Email is not true ';
                                                    } else {
                                                      return null;
                                                    }
                                                  },
                                                  // onSaved: (newValue) {
                                                  //     userlog['email'] = newValue;

                                                  // },
                                                ),
                                              ),
                                              SizedBox(
                                                width: cont.maxHeight * 0.2,
                                              ),
                                            ],
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                top: 20, bottom: 0),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                SizedBox(
                                                  width: cont.maxWidth * 0.53,
                                                  child: TextFormField(
                                                    controller:
                                                        passwordController,
                                                    obscureText: pv,
                                                    decoration: InputDecoration(
                                                        labelText: ' Password ',
                                                        labelStyle: TextStyle(
                                                            color:
                                                                const Color
                                                                        .fromARGB(
                                                                        255,
                                                                        1,
                                                                        144,
                                                                        160)
                                                                    .withOpacity(
                                                                        0.5),
                                                            fontSize: 18),
                                                        suffixIcon: Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                  .only(
                                                                  left: 5.0),
                                                          child: IconButton(
                                                              onPressed: () {
                                                                setState(() {
                                                                  pv = !pv;
                                                                });
                                                              },
                                                              icon: Icon(pv
                                                                  ? Icons
                                                                      .visibility
                                                                  : Icons
                                                                      .visibility_off)),
                                                        ),
                                                        icon: const Icon(
                                                          Icons.password,
                                                          size: 37,
                                                          color: Color.fromARGB(
                                                              255, 1, 144, 160),
                                                        ),
                                                        focusedBorder:
                                                            const OutlineInputBorder(
                                                                borderSide:
                                                                    BorderSide(
                                                          color: Color.fromARGB(
                                                              255, 1, 144, 160),
                                                        )),
                                                        enabledBorder:
                                                            OutlineInputBorder(
                                                          borderSide:
                                                              const BorderSide(
                                                            color:
                                                                Color.fromARGB(
                                                                    255,
                                                                    1,
                                                                    144,
                                                                    160),
                                                            width: 1.4,
                                                          ),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(30),
                                                        ),
                                                        border: OutlineInputBorder(
                                                            borderSide:
                                                                const BorderSide(
                                                                    color: Color
                                                                        .fromARGB(
                                                                            255,
                                                                            1,
                                                                            144,
                                                                            160),
                                                                    width: 2.0),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        8.0))),
                                                    validator: (val) {
                                                      if (val == null ||
                                                          val.isEmpty) {
                                                        return 'Password is too short  ';
                                                      } else {
                                                        return null;
                                                      }
                                                    },
                                                    // onSaved: (newValue) {
                                                    //  userlog['password'] = newValue;

                                                    // },
                                                  ),
                                                ),
                                                SizedBox(
                                                    width:
                                                        cont.maxHeight * 0.2),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    )),
                          ),
                          Container(
                            alignment: Alignment.center,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SizedBox(
                                  width: MediaQuery.of(context).size.width *
                                      0.0001,
                                ),
                                LoginButton(
                                    emailController: emailController,
                                    passwordController: passwordController),
                              ],
                            ),
                          ),
                        ],
                      )
                    : const Center(
                        child: SizedBox(
                          height: 200,
                          width: 200,
                          child: CircularProgressIndicator(),
                        ),
                      ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class LoginButton extends StatelessWidget {
  const LoginButton({
    super.key,
    required this.emailController,
    required this.passwordController,
  });

  final TextEditingController emailController;
  final TextEditingController passwordController;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: () async {
          ScaffoldMessenger.of(context)
              .showSnackBar(SnackBar(content: Text('Loading...')));
          DioHelper.postData(url: 'Auth/Manager/Manager_Login', data: {
            "email": emailController.text,
            "password": passwordController.text
          }).then((value) {
            userModel = UserModel.fromJson(value.data);
            token = userModel!.body!.token;

            DioHelper.getData(path: 'Auth/Manager/Get_AllClient', token: token)
                .then((value) {
              allClientModel = AllClientModel.fromJson(value.data);
              showToast(
                  text: value.data['message'], state: ToastStates.SUCCESS);
            });
            navigateAndFinish(context, const HomePageScreen());
            showToast(text: userModel!.message!, state: ToastStates.SUCCESS);
          }).catchError((e) {
            showToast(
                text: e.response?.data['message'], state: ToastStates.ERROR);
          });
        },
        style: ElevatedButton.styleFrom(
            padding: const EdgeInsets.fromLTRB(40, 16, 40, 16),
            backgroundColor: Colors.white,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30))),
        child: const Center(
          child: Text(
            ' Login ',
            style: TextStyle(
                fontSize: 20,
                fontStyle: FontStyle.italic,
                fontFamily: 'Pacifico'),
          ),
        ));
  }
}

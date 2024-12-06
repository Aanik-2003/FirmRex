import 'package:firebase_auth/firebase_auth.dart';
import 'package:firm_rex/auth/user_auth.dart';
import 'package:firm_rex/views/signuppage.dart';
import 'package:firm_rex/views/user_dashboard.dart';
import 'package:esewa_flutter_sdk/esewa_config.dart';
import 'package:esewa_flutter_sdk/esewa_flutter_sdk.dart';
import 'package:esewa_flutter_sdk/esewa_payment.dart';
import 'package:esewa_flutter_sdk/esewa_payment_success_result.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';


class LoginPage extends StatefulWidget {
  @override
  State<LoginPage> createState() {
    return LoginPageState();
  }
}


class LoginPageState extends State<LoginPage> {

  final _auth = UserAuth();

  final _user_email = TextEditingController();
  final _user_password = TextEditingController();

  @override
  void dispose(){
    super.dispose();
    _user_email.dispose();
    _user_password.dispose();
  }

  @override
  void initState(){
    super.initState();
    // GetApi().getNewsApiCall();
  }

  // esewapaymentcall(){
  //   try {
  //     EsewaFlutterSdk.initPayment(
  //       esewaConfig: EsewaConfig(
  //         environment: Environment.test,
  //         clientId: StaticValue.CLIENT_ID,
  //         secretId: StaticValue.SECRET_KEY,
  //       ),
  //       esewaPayment: EsewaPayment(
  //         productId: "1d71jd81",
  //         productName: "Product One",
  //         productPrice: "20", callbackUrl: '',
  //       ),
  //       onPaymentSuccess: (EsewaPaymentSuccessResult data) {
  //         debugPrint(":::SUCCESS::: => $data");
  //         // verifyTransactionStatus(data);
  //       },
  //       onPaymentFailure: (data) {
  //         debugPrint(":::FAILURE::: => $data");
  //       },
  //       onPaymentCancellation: (data) {
  //         debugPrint(":::CANCELLATION::: => $data");
  //       },
  //     );
  //   } on Exception catch (e) {
  //     debugPrint("EXCEPTION : ${e.toString()}");
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child:
        Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.white, Colors.green.shade100],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
          child: SafeArea(
            child: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom), // Adjust for keyboard
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    // Top section with the logo
                    const SizedBox(height: 15),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(15), // Add rounded corners directly to the image
                      child: Image.asset(
                        "images/logo_nobg.png",
                        width: size.width / 1.7, // Set width
                        height: size.height / 4, // Set height
                        fit: BoxFit.fill, // Adjust how the image fits the box
                      ),
                    ),
                    const SizedBox(height: 10),

                    // Input fields
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      child: Column(
                        children: [
                          TextField(
                            controller: _user_email,
                            decoration: InputDecoration(
                              labelText: "Email Address",
                              prefixIcon: const Icon(Icons.email),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                            ),
                          ),
                          const SizedBox(height: 15),
                          TextField(
                            controller: _user_password,
                            obscureText: true,
                            decoration: InputDecoration(
                              labelText: "Password",
                              prefixIcon: const Icon(Icons.lock),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 15),

                    // Forgot Password
                    Padding(
                      padding: const EdgeInsets.only(left: 200.0),
                      child: SizedBox(
                        width: 232,
                        child: Text(
                          'Forgot Password?',
                          style: TextStyle(
                            color: Color(0xFFF67E27),
                            fontSize: 16,
                            fontFamily: 'Fredoka',
                            fontWeight: FontWeight.w400,
                            height: 0,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 25),

                    // Login button
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      child: SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: _login,
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.green,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                          ),
                          child: const Text(
                            "LOGIN",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 5),
                    RichText(
                      text: TextSpan(
                        text: "Don't have an account? ",
                        style: const TextStyle(color: Colors.black, fontSize: 16),
                        children: [
                          TextSpan(
                            text: "SignUp",
                            style: const TextStyle(
                              color: Colors.blue,
                              fontWeight: FontWeight.bold,
                              decoration: TextDecoration.underline,
                            ),
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => Signuppage(), // Replace with your LoginPage widget
                                  ),
                                );
                              },
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(height: 10,),

                    // Google Connect button
                    const Text(
                      "Or Connect With",
                      style: TextStyle(color: Colors.grey),
                    ),
                    const SizedBox(height: 10),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      child: SizedBox(
                        width: double.infinity,
                        child: ElevatedButton.icon(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.green,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                          ),
                          icon: Image.asset(
                            'images/google_icon_nobg.png',
                            width: 22, // Set the size of the logo
                            height: 22,
                          ),
                          label: const Text("Google"),
                        ),
                      ),
                    ),

                    // Footer section
                    SizedBox(height: size.height/12),
                    const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text(
                        "© All Rights Reserved to ANS - 2024",
                        style: TextStyle(color: Colors.grey),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
  _login() async {
    await _auth.loginUserWithEmailAndPassword(
      _user_email.text,
      _user_password.text,
      context,
    );
  }

}

import 'package:firm_rex/views/dashboard.dart';
import 'package:firm_rex/views/static.dart';
import 'package:esewa_flutter_sdk/esewa_config.dart';
import 'package:esewa_flutter_sdk/esewa_flutter_sdk.dart';
import 'package:esewa_flutter_sdk/esewa_payment.dart';
import 'package:esewa_flutter_sdk/esewa_payment_success_result.dart';
import 'package:flutter/material.dart';

import '../api/get.dart';

class LoginPage extends StatefulWidget {
  @override
  State<LoginPage> createState() {
    return LoginPageState();
  }
}

class LoginPageState extends State<LoginPage> {
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
      body: SizedBox(
        width: size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Image
            Container(
              width: size.width / 2,
              child: Image.asset(
                "images/foot_print.jpg",
                fit: BoxFit.cover,
              )
            ),
            // Container
            Container(
              height: size.height / 2,
              width: size.width / 1.1,
              decoration: BoxDecoration(
                color: Colors.tealAccent,
                borderRadius: BorderRadius.circular(15),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(height: 15),
                  TextField(
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.grey[300],
                      hintText: "Email Address",
                      prefixIcon: Icon(
                        Icons.email,
                        color: Colors.black,
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide.none,
                      ),
                    ),
                  ),
                  SizedBox(height: 15),
                  TextField(
                    obscureText: true, // For password input
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.grey[300],
                      hintText: "Password",
                      prefixIcon: Icon(
                        Icons.lock,
                        color: Colors.black,
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide.none,
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                  // Forgot Password Link
                  GestureDetector(
                    onTap: () {
                      // Navigate to Forgot Password Page
                      print("Forgot Password tapped");
                    },
                    child: Text(
                      "Forgot Password?",
                      style: TextStyle(
                        color: Colors.red,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  SizedBox(height: 15),
                  GestureDetector(
                    onTap: () {
                      // Navigator.push(
                      //   context,
                      //   MaterialPageRoute(builder: (context) => const DashboardPage()), // Correct class name
                      // );
                      // esewapaymentcall();
                    },
                    child: Align(
                      alignment: Alignment.center,
                      child: Container(
                        width: size.width / 1.5,  // Adjust width here
                        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                        decoration: BoxDecoration(
                          color: Colors.red,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Text(
                          "LOGIN",
                          style: TextStyle(color: Colors.white),
                          textAlign: TextAlign.center,  // Center text inside the button
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

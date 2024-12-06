import 'package:flutter/material.dart';


class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

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
            SizedBox(
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
                  const SizedBox(height: 15),
                  TextField(
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.grey[300],
                      hintText: "Email Address",
                      prefixIcon: const Icon(
                        Icons.email,
                        color: Colors.black,
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide.none,
                      ),
                    ),
                  ),
                  const SizedBox(height: 15),
                  TextField(
                    obscureText: true, // For password input
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.grey[300],
                      hintText: "Password",
                      prefixIcon: const Icon(
                        Icons.lock,
                        color: Colors.black,
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide.none,
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  // Forgot Password Link
                  GestureDetector(
                    onTap: () {
                      // Navigate to Forgot Password Page
                      print("Forgot Password tapped");
                    },
                    child: const Text(
                      "Forgot Password?",
                      style: TextStyle(
                        color: Colors.red,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const SizedBox(height: 15),
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
                        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                        decoration: BoxDecoration(
                          color: Colors.red,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: const Text(
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

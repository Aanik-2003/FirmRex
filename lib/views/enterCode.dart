import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'setNewPassword.dart';

class EnterCode extends StatelessWidget {
  const EnterCode({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const EnterCodeScreen(),
    );
  }
}

class EnterCodeScreen extends StatefulWidget {
  const EnterCodeScreen({super.key});

  @override
  _EnterCodeScreenState createState() => _EnterCodeScreenState();
}

class _EnterCodeScreenState extends State<EnterCodeScreen> {
  // FocusNodes for each text field to manage focus
  final List<FocusNode> _focusNodes = List.generate(5, (_) => FocusNode());
  final List<TextEditingController> _controllers = List.generate(5, (_) => TextEditingController());

  @override
  void dispose() {
    // Dispose all controllers and focus nodes when no longer needed
    for (var controller in _controllers) {
      controller.dispose();
    }
    for (var focusNode in _focusNodes) {
      focusNode.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // Get screen width and height for responsive layout
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: SingleChildScrollView( // Make the body scrollable when keyboard appears
        child: Padding(
          padding: EdgeInsets.all(width * 0.05), // responsive padding
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Check your email",
                style: TextStyle(
                  fontSize: width * 0.06, // responsive font size
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              SizedBox(height: height * 0.01), // responsive spacing
              Text(
                "We sent a reset link to alpha...@gmail.com\nEnter the 5-digit code mentioned in the email",
                style: TextStyle(
                  fontSize: width * 0.04, // responsive font size
                  color: Colors.grey,
                ),
              ),
              SizedBox(height: height * 0.05), // responsive spacing

              // Row of 5 TextFields
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: List.generate(5, (index) {
                  return SizedBox(
                    width: width * 0.12, // responsive width for each text field
                    child: TextField(
                      controller: _controllers[index],
                      focusNode: _focusNodes[index],
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: width * 0.05), // responsive font size
                      keyboardType: TextInputType.number,
                      maxLength: 1,
                      inputFormatters: [
                        FilteringTextInputFormatter.digitsOnly,
                      ],
                      decoration: InputDecoration(
                        counterText: '',
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(width * 0.02), // responsive border radius
                          borderSide: const BorderSide(color: Colors.grey),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(width * 0.02),
                          borderSide: const BorderSide(color: Colors.green),
                        ),
                      ),
                      onChanged: (value) {
                        if (value.isNotEmpty && index < 4) {
                          // Move focus to the next text field automatically
                          FocusScope.of(context).requestFocus(_focusNodes[index + 1]);
                        }
                      },
                    ),
                  );
                }),
              ),
              SizedBox(height: height * 0.04), // responsive spacing

              // Verify Code Button
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => SetNewPasswordScreen()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                    padding: EdgeInsets.symmetric(vertical: height * 0.02), // responsive padding
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(width * 0.02), // responsive border radius
                    ),
                  ),
                  child: Text(
                    "Verify Code",
                    style: TextStyle(
                      fontSize: width * 0.05, // responsive font size
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              SizedBox(height: height * 0.02), // responsive spacing

              // Resend Email Button
              Center(
                child: TextButton(
                  onPressed: () {
                    // Handle resend email
                  },
                  child: Text(
                    "Haven’t got the email yet? Resend Email",
                    style: TextStyle(
                      color: Colors.blue,
                      decoration: TextDecoration.underline,
                      fontSize: width * 0.04, // responsive font size
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

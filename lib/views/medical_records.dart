import 'package:firm_rex/views/pet_health.dart';
import 'package:firm_rex/views/user_dashboard.dart';
import 'package:flutter/material.dart';

class MedicalRecords extends StatelessWidget {
  Widget buildHorizontalScroll(int itemCount){
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: List.generate(
          itemCount,
              (index) => Padding(padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child:
            Container(
              width: 180,
              height: 120,
              decoration: ShapeDecoration(
                color: Colors.white,
                shape: RoundedRectangleBorder(
                  side: BorderSide(
                    width: 1,
                    color: Colors.black.withOpacity(0.3),
                  ),
                  borderRadius: BorderRadius.circular(15),
                ),
                shadows: [
                  BoxShadow(
                    color: Color(0x3F000000),
                    blurRadius: 4,
                    offset: Offset(0, 4),
                    spreadRadius: 0,
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
  Widget buildVerticalScroll(int itemCount){
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Column(
        children: List.generate(
          itemCount,
              (index) => Padding(padding: const EdgeInsets.symmetric(vertical: 10.0),
            child:
            Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Allergies',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontFamily: 'Fredoka',
                      fontWeight: FontWeight.w600,
                      height: 0,
                    ),
                  ),
                  const SizedBox(height: 10,),
                  buildHorizontalScroll(5),
                  const SizedBox(height: 10,),
                  Text(
                    'Cough',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontFamily: 'Fredoka',
                      fontWeight: FontWeight.w600,
                      height: 0,
                    ),
                  ),
                  const SizedBox(height: 10,),
                  buildHorizontalScroll(5),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  const MedicalRecords({Key? key}) : super(key: key);

  // Popup form method
  void _showPopupForm(BuildContext context) {
    final _formKey = GlobalKey<FormState>();
    String? name;
    String? age;

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Add Medical Record'),
          content: Form(
            key: _formKey,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextFormField(
                  decoration: const InputDecoration(labelText: 'Name'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter a name';
                    }
                    return null;
                  },
                  onSaved: (value) => name = value,
                ),
                const SizedBox(height: 10),
                TextFormField(
                  decoration: const InputDecoration(labelText: 'Age'),
                  keyboardType: TextInputType.number,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter age';
                    }
                    return null;
                  },
                  onSaved: (value) => age = value,
                ),
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(), // Close dialog
              child: const Text('Cancel'),
            ),
            ElevatedButton(
              onPressed: () {
                if (_formKey.currentState?.validate() ?? false) {
                  _formKey.currentState?.save();
                  // Process form data here (e.g., save to database or list)
                  Navigator.of(context).pop(); // Close dialog
                }
              },
              child: const Text('Save'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,

        children: [
          Container(
            width: double.infinity, // Full width of the screen
            height: 110,
            padding: const EdgeInsets.only(top: 30.0),
            decoration: BoxDecoration(
              color: Colors.green, // Set the container color to green
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(0),
                bottomRight: Radius.circular(0),
              ),
            ),
            child:
            Column(
              children: [
                Container(
                  // padding: const EdgeInsets.symmetric(vertical: 0.0),
                  child:
                  Row(
                    children: [
                      IconButton(
                        icon: Icon(Icons.arrow_back, color: Colors.white),
                        onPressed: () {
                          Navigator.pop(context); // Navigate back
                        },
                      ),
                      const SizedBox(width: 8),
                      const Text(
                        "Pet Health",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),

                ),
                Container(
                  padding: const EdgeInsets.only(left: 50,),
                  child:
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 16),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => PetHealth()),
                          );
                        },
                        child: const Text(
                          "Wellness",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      const SizedBox(width: 80),
                      const Text(
                        "Medical Records",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          decoration: TextDecoration.underline,
                          decorationColor: Colors.white,
                          decorationThickness: 4,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),

          ),
          const SizedBox(height: 20,),
          Container(
            width: 408,
            height: 230,
            padding: const EdgeInsets.only(top: 10),
            decoration: ShapeDecoration(
              color: Colors.white,
              shape: RoundedRectangleBorder(
                side: BorderSide(
                  width: 1,
                  color: Colors.black.withOpacity(0.30000001192092896),
                ),
              ),
              shadows: [
                BoxShadow(
                  color: Color(0x3F000000),
                  blurRadius: 4,
                  offset: Offset(0, 4),
                  spreadRadius: 0,
                )
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  child: Row(
                    children: [
                      Text(
                        '  Past vaccinations',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 25,
                          fontFamily: 'Fredoka',
                          fontWeight: FontWeight.w600,
                          height: 0,
                        ),
                      ),
                      const SizedBox(width: 80,),
                      Text(
                        'New',
                        style: TextStyle(
                          color: Colors.blue,
                          fontSize: 14,
                          fontFamily: 'Fredoka',
                          fontWeight: FontWeight.w600,
                          height: 0,
                          decoration: TextDecoration.underline,
                          decorationColor: Colors.blue,
                          decorationThickness: 3,
                        ),

                      ),
                      const SizedBox(width: 10,),
                      GestureDetector(
                        onTap: () {
                          print("Widget clicked!");
                          _showPopupForm(context);
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.white, // Background color of the container (optional)
                            shape: BoxShape.circle, // Makes it circular
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.2), // Shadow color
                                blurRadius: 6, // Softness of the shadow
                                offset: Offset(0, 3), // Shadow position: x (horizontal), y (vertical)
                              ),
                            ],
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0), // Optional padding for better sizing
                            child: Icon(
                              Icons.add, // The clickable icon
                              size: 32,
                              color: Colors.blue,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20,),
                Container(
                  padding: const EdgeInsets.only(left: 5),
                  child: Column(
                    children: [
                      buildHorizontalScroll(5),
                    ],
                  ),
                ),
              ],
            ),

          ),
          const SizedBox(height: 20,),
          Container(
            width: 408,
            height: 410,
            padding: const EdgeInsets.only(top: 10, left: 10),
            decoration: ShapeDecoration(
              color: Colors.white,
              shape: RoundedRectangleBorder(
                side: BorderSide(
                  width: 1,
                  color: Colors.black.withOpacity(0.30000001192092896),
                ),
              ),
              shadows: [
                BoxShadow(
                  color: Color(0x3F000000),
                  blurRadius: 4,
                  offset: Offset(0, 4),
                  spreadRadius: 0,
                )
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  child: Row(
                    children: [
                      Text(
                        'Past Treatements',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 25,
                          fontFamily: 'Fredoka',
                          fontWeight: FontWeight.w600,
                          height: 0,
                        ),
                      ),
                      const SizedBox(width: 80,),
                      Text(
                        'New',
                        style: TextStyle(
                            color: Colors.blue,
                            fontSize: 14,
                            fontFamily: 'Fredoka',
                            fontWeight: FontWeight.w600,
                            height: 0,
                            decoration: TextDecoration.underline,
                            decorationColor: Colors.blue,
                            decorationThickness: 3,
                        ),

                      ),
                      const SizedBox(width: 10,),
                      GestureDetector(
                        onTap: () {
                          print("Widget clicked!");
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.white, // Background color of the container (optional)
                            shape: BoxShape.circle, // Makes it circular
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.2), // Shadow color
                                blurRadius: 6, // Softness of the shadow
                                offset: Offset(0, 3), // Shadow position: x (horizontal), y (vertical)
                              ),
                            ],
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0), // Optional padding for better sizing
                            child: Icon(
                              Icons.add, // The clickable icon
                              size: 32,
                              color: Colors.blue,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  height: 350,
                    child: buildVerticalScroll(5)
                ),
              ],
            ),
          ),
          const SizedBox(height: 10,),
          Container(
            width: 412,
            height: 90,
            padding: const EdgeInsets.symmetric(vertical: 17.0, horizontal: 16.0),
            decoration: ShapeDecoration(
              color: Colors.green,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(0),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                IconHelper.buildIconWithLabel(Icons.home, 'Home', Colors.green,),
                const SizedBox(width: 12),
                IconHelper.buildIconWithLabel(Icons.explore, "Explore", Colors.green),
                const SizedBox(width: 12),
                IconHelper.buildIconWithLabel(Icons.map, "Map", Colors.green),
                const SizedBox(width: 12),
                IconHelper.buildIconWithLabel(Icons.settings, "Manage", Colors.green),
                const SizedBox(width: 12),
                IconHelper.buildIconWithLabel(Icons.person, "Profile", Colors.green),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

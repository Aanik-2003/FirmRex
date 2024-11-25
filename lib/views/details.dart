import 'package:firm_rex/views/dashboard.dart';
import 'package:flutter/material.dart';

class DetailsPage extends StatefulWidget {
  const DetailsPage({super.key});

  @override
  State<DetailsPage> createState() => _detailsPageState();
}

verticalScrollFunction(var size, var color) {
  return Container(
    width: size.width / 1.5,
    height: size.height / 6,
    margin: const EdgeInsets.only(top: 10, left: 10),
    decoration: BoxDecoration(
      color: Color(color),
      borderRadius: BorderRadius.circular(20),
    ),
    child: Stack(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: Image.asset(
            "images/bg_flutter.jpeg",
            fit: BoxFit.cover,
            width: double.infinity,
            height: double.infinity,
          ),
        ),
        Center(
          child: Icon(
            Icons.play_circle,
            size: 50, // Adjust the size as needed
            color: Colors.white, // Change the color as needed
          ),
        ),
        Positioned(
          bottom: 50,
          left: 50,
          child: Container(
            width: size.width / 2,
            child: Text(
              "Sept 20, 2024",
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.normal,
                  fontSize: 14),
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ),
      ],
    ),
  );
}

class _detailsPageState extends State<DetailsPage> {
  horizontalScrollFunction(var size, var color) {
    return Container(
      width: size.width / 1.05,
      height: size.height / 5,
      margin: EdgeInsets.only(left: 0, right: 0),
      decoration: BoxDecoration(
          color: Color(color), borderRadius: BorderRadius.circular(20)),
      child: Stack(
        children: [
          Container(
            height: size.height / 5,
            width: size.width / 1,
            child: ClipRRect(
                borderRadius: BorderRadius.circular(0),
                child:
                    // Image.network(
                    //     "https://cdn.pixabay.com/photo/2018/01/14/23/12/nature-3082832_1280.jpg",
                    // fit: BoxFit.cover,)
                    Image.asset(
                  "images/bg_flutter.jpeg",
                  fit: BoxFit.cover,
                )),
          ),
          Center(
              child: Icon(
            Icons.play_circle,
            size: 60,
            color: Colors.white,
          )),
          Positioned(
            left: 5,
            top: 5,
            child: GestureDetector(
              onTap: () {
                // Add your navigation code here
                Navigator.pop(context); // Example: navigate back
              },
              child: Icon(
                Icons.arrow_back,
                size: 50,
                color: Colors.white,
              ),
            ),
          ),

          Positioned(
              right: 5,
              top: 5,
              child: Icon(
                Icons.share,
                size: 40,
                color: Colors.white,
              )),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: size.height / 5,
            width: size.width / 1,
            child: ListView.builder(
              itemCount: 1,
              // scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return horizontalScrollFunction(size, 0xffffff2345);
              },
            ),
          ),
          Container(
            width: size.width,
            margin: EdgeInsets.only(left: 10, right: 10),
            child: Column(
              crossAxisAlignment:
                  CrossAxisAlignment.start, // Aligns children to the left
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: Text(
                    "First Image Of My Flutter Project."
                    "This is my new project...",
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 25),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 8),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Oliver Isaacs",
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.normal,
                          fontSize: 20,
                        ),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                      Text(
                        "Sep 27, 2024",
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.normal,
                          fontSize: 20,
                        ),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                ),
                Container(
                  child: Text(
                    "First Image Of My Flutter Project."
                    "This is my new project...ahfahfseahf afhesafhsajf ashfaf"
                    "auff ahfuaf afdhuajef adfh adufh",
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 20),
                    maxLines: 20,
                    overflow: TextOverflow.ellipsis,
                  ),
                )
              ],
            ),
          ),
          Container(
            height: size.height / 2.1,
            width: size.width,
            child: ListView.builder(
              itemCount: 20,
              scrollDirection: Axis.vertical,
              itemBuilder: (context, index) {
                return dashboardPageState.verticalScrollFunction(size, 000000);
              },
            ),
          ),
        ],
      ),
    );
  }
}

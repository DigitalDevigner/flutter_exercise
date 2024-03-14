import 'package:flutter/material.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Profile"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(0),
        child: ListView(
          children: const [
            Padding(
              padding: EdgeInsets.only(left: 16.0, bottom: 32.0),
              child: CircleAvatar(
                radius:
                    98, // Change this radius for the width of the circular border
                backgroundColor: Colors.amber,
                child: CircleAvatar(
                  radius:
                      96, // This radius is the radius of the picture in the circle avatar itself.
                  backgroundImage: NetworkImage(
                    "https://cdn.costumewall.com/wp-content/uploads/2018/08/fred-flintstone.jpg",
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 16.0, bottom: 8.0),
              child: Text(
                "Name: Fred Flintstone",
                style: TextStyle(fontSize: 16.0),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 16.0, bottom: 8.0),
              child: Text(
                "Location: Bedrock",
                style: TextStyle(fontSize: 16.0),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 16.0, bottom: 8.0),
              child: Text(
                "Birthday: 10,000 BC",
                style: TextStyle(fontSize: 16.0),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 16.0, bottom: 8.0),
              child: Text(
                "Joined: 9,985 BC",
                style: TextStyle(fontSize: 16.0),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

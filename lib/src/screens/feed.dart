import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';

import 'detail.dart';
import 'profile.dart';

class Feed extends StatefulWidget {
  const Feed({super.key});

  @override
  State<Feed> createState() => _FeedState();
}

class _FeedState extends State<Feed> {
  List items = [];

  Future<void> readJson() async {
    final String response =
        await rootBundle.loadString('assets/data/posts.json');
    final data = await json.decode(response);
    setState(() {
      items = data["posts"];
    });
  }

  Card buildCard(items, index) {
    return Card(
        elevation: 4.0,
        child: Column(
          children: [
            ListTile(
                title: Text(items[index]["member_name"]),
                subtitle: Text(items[index]["title"]),
                trailing: Text(DateFormat.yMMMd()
                    .format(DateTime.parse(items[index]["created_at"])))),
            SizedBox(
              height: 200.0,
              child: Ink.image(
                image: NetworkImage(items[index]["images"][0]["url"]),
                fit: BoxFit.cover,
              ),
            ),
            Container(
              padding: const EdgeInsets.all(16.0),
              alignment: Alignment.centerLeft,
              child: Text(
                items[index]["text"],
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            ButtonBar(
              children: [
                const Icon(Icons.favorite_outline),
                TextButton(
                    child: const Text('LEARN MORE'),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                Detail(item: items[index])),
                      );
                    })
              ],
            )
          ],
        ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Feed"),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.account_circle),
            tooltip: 'Profile Icon',
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const Profile()),
              );
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(4),
        child: Column(
          children: [
            ElevatedButton(
              onPressed: readJson,
              child: const Text('Load Data'),
            ),
            items.isNotEmpty
                ? Expanded(
                    child: ListView.builder(
                      itemCount: items.length,
                      itemBuilder: (context, index) {
                        return buildCard(items, index);
                      },
                    ),
                  )
                : Container()
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:social_media_app/models/notification.dart';
import 'package:social_media_app/pages/profile.dart';
import 'package:social_media_app/widgets/indicators.dart';

class ViewActivityDetails extends StatefulWidget {
  final ActivityModel activity;

  ViewActivityDetails({this.activity});

  @override
  _ViewActivityDetailsState createState() => _ViewActivityDetailsState();
}

class _ViewActivityDetailsState extends State<ViewActivityDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Icon(Icons.keyboard_backspace),
        ),
      ),
      body: ListView(
        children: [
          buildImage(context),
          ListTile(
            contentPadding: EdgeInsets.symmetric(horizontal: 20.0),
            leading: GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) =>
                          Profile(profileId: widget.activity.userId),
                    ));
              },
              child: CircleAvatar(
                radius: 25.0,
                backgroundImage: NetworkImage(widget.activity.userDp),
              ),
            ),
            title: Text(
              widget.activity.username,
              style: TextStyle(fontWeight: FontWeight.w800),
            ),
            subtitle: Row(
              children: [
                Icon(Feather.clock, size: 13.0),
                SizedBox(width: 3.0),
                Text(
                  "${widget.activity.timestamp.toDate()}",
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.0),
            child: Text(
              widget.activity?.commentData ?? "",
              style: TextStyle(fontWeight: FontWeight.w400),
            ),
          ),
          Divider(),
        ],
      ),
    );
  }

  buildImage(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(5.0),
        child: Image.network(
           widget.activity.mediaUrl,
          height: 400.0,
          fit: BoxFit.cover,
          width: MediaQuery.of(context).size.width,
        ),
      ),
    );
  }
}

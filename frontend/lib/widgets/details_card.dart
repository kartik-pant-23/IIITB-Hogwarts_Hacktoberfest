import 'package:flutter/material.dart';

class DetailsCard extends StatefulWidget {
  final String groupIcon;
  final String name;
  final String email;
  final String group;
  final String score;
  const DetailsCard(
      {Key? key,
      required this.name,
      required this.email,
      required this.groupIcon,
      required this.group,
      required this.score})
      : super(key: key);

  @override
  _DetailsCardState createState() => _DetailsCardState();
}

class _DetailsCardState extends State<DetailsCard> {
  @override
  Widget build(BuildContext context) {
    double WIDTH = MediaQuery.of(context).size.width;

    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      color: Colors.transparent,
      child: Container(
        width: WIDTH,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
          child: Column(
            children: [
              Container(
                height: 90,
                width: 90,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(50),
                  child: Image.network(
                    widget.groupIcon,
                    fit: BoxFit.contain,
                  ),
                ),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(50))),
              ),
              Text('Name: ${widget.name}', style: TextStyle(fontSize: 18)),
              Text('Email: ${widget.email}', style: TextStyle(fontSize: 18)),
              Text('Group: ${widget.group}', style: TextStyle(fontSize: 18)),
              Text('Score: ${widget.score}', style: TextStyle(fontSize: 18)),
            ],
          ),
        ),
      ),
    );
  }
}

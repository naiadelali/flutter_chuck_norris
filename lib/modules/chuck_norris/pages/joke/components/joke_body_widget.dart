import '../../../models/chuck_joke_model.dart';
import 'package:flutter/material.dart';

class JokeBodyWidget extends StatelessWidget {
  const JokeBodyWidget({
    Key? key,
    required this.displayJoke,
  }) : super(key: key);

  final ChuckJokeModel? displayJoke;

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height * 0.3;
    return ListView(
      padding: EdgeInsets.fromLTRB(0.0, height, 0.0, 32.0),
      children: <Widget>[
        Container(
          margin: EdgeInsets.symmetric(horizontal: 40.0),
          decoration: BoxDecoration(
              color: Color(0xFFFFFFFF),
              shape: BoxShape.rectangle,
              borderRadius: BorderRadius.only( topLeft: Radius.circular(25.0),bottomRight: Radius.circular(25.0)
              )
          ),
          padding: EdgeInsets.symmetric(horizontal: 32.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                margin: EdgeInsets.all(8),
                child: Image.network(displayJoke!.iconUrl),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Text(displayJoke?.joke ?? '', style: TextStyle(color: Colors.black, fontSize: 14)),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

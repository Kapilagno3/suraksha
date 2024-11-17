import 'package:flutter/material.dart';
import 'package:flutter_ringtone_player/flutter_ringtone_player.dart';

// ignore: must_be_immutable
class FakeCallScreen extends StatefulWidget {
  static const String route = '/fakeCallScreen';

  final String fakeCallerName;

  // FakeCallScreen();
  const FakeCallScreen({Key? key, required this.fakeCallerName}) : super(key: key);

  @override
  _FakeCallScreenState createState() => _FakeCallScreenState();
}

class _FakeCallScreenState extends State<FakeCallScreen> {
  String fakeCallerName = "divij";

  // _FakeCallScreenState({@required this.fakeCallerName});

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    FlutterRingtonePlayer.play(
      android: AndroidSounds.ringtone,
      ios: IosSounds.glass,
      // looping: true, // Android only - API >= 28
      // volume: 10.0, // Android only - API >= 28
    );
  }

  @override
  void dispose() {
    // TODO: implement dispose
    FlutterRingtonePlayer.stop();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          FloatingActionButton(
            heroTag: 1,
            backgroundColor: Colors.redAccent,
            onPressed: () {
              FlutterRingtonePlayer.stop();
              Navigator.pop(context);
            },
            child: const Icon(
              Icons.call_end_rounded,
            ),
          ),
          FloatingActionButton(
            heroTag: 2,
            backgroundColor: const Color.fromRGBO(0, 250, 0, 0.9),
            onPressed: () {},
            child: const Icon(
              Icons.phone,
            ),
          ),
        ],
      ),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: ExactAssetImage('assets/fakeCallBG.jpg'),
              fit: BoxFit.cover),
        ),
        child: Column(
          children: <Widget>[
            const SizedBox(
              height: 100.0,
            ),
            Container(
              alignment: Alignment.center,
              padding: const EdgeInsets.all(20.0),
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.black,
              ),
              child: const Icon(
                Icons.person,
                size: 50.0,
                color: Color.fromRGBO(253, 200, 4, 1.0),
              ),
            ),
            Container(
              alignment: Alignment.center,
              margin: const EdgeInsets.only(top: 10.0),
              child: Text(
                fakeCallerName,
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 25.0,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

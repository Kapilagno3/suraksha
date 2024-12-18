import 'dart:math';
import 'package:flutter/material.dart';
import 'dart:async';
import 'package:flutter_incoming_call/flutter_incoming_call.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:uuid/uuid.dart';


class Fake extends StatefulWidget {
  const Fake({Key? key}) : super(key: key);

  @override
  _FakeState createState() => _FakeState();
}

class _FakeState extends State<Fake> {
  var uuid = const Uuid();
  int quoteIndex = 0;

  late BaseCallEvent _lastEvent;
  late CallEvent _lastCallEvent;
  late HoldEvent _lastHoldEvent;
  late MuteEvent _lastMuteEvent;
  late DmtfEvent _lastDmtfEvent;
  late AudioSessionEvent _lastAudioSessionEvent;

  void _incomingCall() {
    final uid = uuid.v4();
    const name = 'Home';
    const avatar =
        'https://scontent.fhel6-1.fna.fbcdn.net/v/t1.0-9/62009611_2487704877929752_6506356917743386624_n.jpg?_nc_cat=102&_nc_sid=09cbfe&_nc_ohc=cIgJjOYlVj0AX_J7pnl&_nc_ht=scontent.fhel6-1.fna&oh=ef2b213b74bd6999cd74e3d5de235cf4&oe=5F6E3331';
    const handle = 'Home';
    const type = HandleType.generic;
    const isVideo = true;
    FlutterIncomingCall.displayIncomingCall(
        uid, name, avatar, handle, type, isVideo);
  }

  void _endCurrentCall() {
    FlutterIncomingCall.endCall(_lastCallEvent.uuid);
    }

  void _endAllCalls() {
    FlutterIncomingCall.endAllCalls();
  }

  @override
  void initState() {
    super.initState();
    FlutterIncomingCall.configure(
        appName: 'example_incoming_call',
        duration: 30000,
        android: ConfigAndroid(
          vibration: true,
          ringtonePath: 'default',
          channelId: 'calls',
          channelName: 'Calls channel name',
          channelDescription: 'Calls channel description',
        ),
        ios: ConfigIOS(
          iconName: 'AppIcon40x40',
          ringtonePath: null,
          includesCallsInRecents: false,
          supportsVideo: true,
          maximumCallGroups: 2,
          maximumCallsPerCallGroup: 1,
        ));
    FlutterIncomingCall.onEvent.listen((event) {
      setState(() {
        _lastEvent = event;
      });
      if (event is CallEvent) {
        setState(() {
          _lastCallEvent = event;
        });
      } else if (event is HoldEvent) {
        setState(() {
          _lastHoldEvent = event;
        });
      } else if (event is MuteEvent) {
        setState(() {
          _lastMuteEvent = event;
        });
      } else if (event is DmtfEvent) {
        setState(() {
          _lastDmtfEvent = event;
        });
      } else if (event is AudioSessionEvent) {
        setState(() {
          _lastAudioSessionEvent = event;
        });
      }
    });
  }

  @override
  void dispose() {
    _endAllCalls();
    super.dispose();
  }

  getRandomInt(fromClick) {
    Random rnd = Random();

    quoteIndex = rnd.nextInt(4);
    if (mounted && fromClick) {
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
            appBar: AppBar(
              leading: IconButton(
                icon: const Icon(Icons.arrow_back, color: Colors.black),
                onPressed: () => Navigator.of(context).pop(),
              ),
              iconTheme: const IconThemeData(
                color: Colors.black, //change your color here
              ),
              backgroundColor: Colors.white,
              title: const Text(
                "Fake Call",
                style: TextStyle(color: Colors.black),
              ),
            ),
            body: SafeArea(
                child: Stack(fit: StackFit.expand, children: [
              Container(
                decoration: BoxDecoration(
                  image: const DecorationImage(
                    image: AssetImage(
                      'assets/bg-top.png',
                    ),
                    fit: BoxFit.fitWidth,
                    alignment: Alignment.topCenter,
                  ),
                  // color: Colors.grey[50].withOpacity(0.3),
                  color: Colors.grey[50]?.withOpacity(0.3),
                ),
                // child: Container(
                //   height:MediaQuery.of(context).size.height,
                //   width: MediaQuery.of(context).size.width,
                //   decoration: new BoxDecoration(
                //     color: const Color(0xff7c94b6),
                //     image: new DecorationImage(
                //         fit: BoxFit.fitWidth,
                //         colorFilter: new ColorFilter.mode(Colors.redAccent.withOpacity(0.2), BlendMode.dstATop),
                //         image: AssetImage('assets/call3.jpg')
                //     ),
                //   ),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    SizedBox(height: MediaQuery.of(context).size.height / 20),
                    const SizedBox(
                      height: 25,
                    ),
                    GestureDetector(
                      onTap: _incomingCall,
                      child: Container(
                        padding: const EdgeInsets.all(10),
                        margin: const EdgeInsets.all(15),
                        height: 60,
                        alignment: Alignment.center,
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(15)),
                          gradient: LinearGradient(
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                            colors: [
                              Color(0xFFFD8080),
                              Color(0xFFFB8580),
                              Color(0xFFFBD079),
                            ],
                          ),
                        ),
                        // width: MediaQuery.of(context).size.width/1.8,
                        // color: Colors.orange,
                        child: Text(
                          "Incoming call now",
                          style: GoogleFonts.lato(
                              textStyle: const TextStyle(
                            color: Colors.white,
                            fontSize: 17,
                            fontWeight: FontWeight.bold,
                          )),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                    const SizedBox(height: 16),
                    GestureDetector(
                      onTap: () =>
                          Future.delayed(const Duration(seconds: 5), _incomingCall),
                      child: Container(
                        // padding: EdgeInsets.all(10),
                        margin: const EdgeInsets.all(15),
                        height: 60,
                        alignment: Alignment.center,
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                          gradient: LinearGradient(
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                            colors: [
                              Color(0xFFFD8080),
                              Color(0xFFFB8580),
                              Color(0xFFFBD079),
                            ],
                          ),
                        ),
                        // width: MediaQuery.of(context).size.width/1.8,
                        // color: Colors.orange,
                        child: Text(
                          "Incoming call delay 5 sec",
                          style: GoogleFonts.lato(
                              textStyle: const TextStyle(
                            color: Colors.white,
                            fontSize: 17,
                            fontWeight: FontWeight.bold,
                          )),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                    const SizedBox(height: 16),
                    GestureDetector(
                      onTap: _endCurrentCall,
                      child: Container(
                        // padding: EdgeInsets.all(10),
                        margin: const EdgeInsets.all(15),
                        height: 60,
                        alignment: Alignment.center,
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                          gradient: LinearGradient(
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                            colors: [
                              Color(0xFFFD8080),
                              Color(0xFFFB8580),
                              Color(0xFFFBD079),
                            ],
                          ),
                        ),
                        // width: MediaQuery.of(context).size.width/1.8,
                        // color: Colors.orange,
                        child: Text(
                          "End current call",
                          style: GoogleFonts.lato(
                              textStyle: const TextStyle(
                            color: Colors.white,
                            fontSize: 17,
                            fontWeight: FontWeight.bold,
                          )),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                    const SizedBox(height: 16),
                    GestureDetector(
                      onTap: _endAllCalls,
                      child: Container(
                        // padding: EdgeInsets.all(10),
                        margin: const EdgeInsets.all(15),
                        height: 60,
                        alignment: Alignment.center,
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                          gradient: LinearGradient(
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                            colors: [
                              Color(0xFFFD8080),
                              Color(0xFFFB8580),
                              Color(0xFFFBD079),
                            ],
                          ),
                        ),
                        // width: MediaQuery.of(context).size.width/1.8,
                        // color: Colors.orange,
                        child: Text(
                          "End all calls",
                          style: GoogleFonts.lato(
                              textStyle: const TextStyle(
                            color: Colors.white,
                            fontSize: 17,
                            fontWeight: FontWeight.bold,
                          )),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                    Image.asset("assets/bk_women.png",
                        height: MediaQuery.of(context).size.height / 5,
                        alignment: AlignmentDirectional.bottomCenter),
                  ],
                ),
              ),
            ]))));
  }
}

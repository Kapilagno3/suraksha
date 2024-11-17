import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class Ho extends StatefulWidget {
  const Ho({Key? key}) : super(key: key);

  @override
  _HoState createState() => _HoState();
}

class _HoState extends State<Ho> {
  // YoutubePlayerController controller;
  final List<YoutubePlayerController> _controllers = [];
  List<String> urls = [
    'https://youtu.be/tD9JPEq0lJ0',
    'https://youtu.be/T7aNSRoDCmg',
    'https://youtu.be/VIu9sCogmrs',
    'https://youtu.be/bR476k1hPNk',
    'https://youtu.be/Gx3_x6RH1J4',
    'https://youtu.be/bLB85VwjkY0',
    'https://youtu.be/kPdnSPjuucE',
    'https://youtu.be/Ww1DeUSC94o'
  ];
  // @override
  // void initState() {
  //   urls.forEach((url) {
  //     _controllers = YoutubePlayerController(
  //         initialVideoId: YoutubePlayer.convertUrlToId(url));
  //     _controllers.add(_controllers);
  //   });

  //   super.initState();
  // }

  @override
  void initState() {
    super.initState();
    for (var url in urls) {
      var controller = YoutubePlayerController(
        initialVideoId: YoutubePlayer.convertUrlToId(url)!,
        flags: const YoutubePlayerFlags(
          autoPlay: false,
          mute: false,
        ),
      );
      _controllers.add(controller);
    }
  }

  Widget buildController(int no) {
    return YoutubePlayer(
      controller: _controllers[no],
      showVideoProgressIndicator: true,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
          "Self Defence Techniques",
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: Container(
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              buildController(0),
              const SizedBox(height: 10.0),
              buildController(1),
              const SizedBox(height: 10.0),
              buildController(2),
              const SizedBox(height: 10.0),
              buildController(3),
              const SizedBox(height: 10.0),
              buildController(4),
              const SizedBox(height: 10.0),
              buildController(5),
              const SizedBox(height: 10.0),
              buildController(6),
              const SizedBox(height: 10.0),
              buildController(7),
              const SizedBox(height: 10.0),
            ],
          ),
        ),
      ),
    );
  }
}

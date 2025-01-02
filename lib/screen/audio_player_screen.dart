import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';

class AudioPlayerScreen extends StatefulWidget {
  @override
  _AudioPlayerScreenState createState() => _AudioPlayerScreenState();
}

class _AudioPlayerScreenState extends State<AudioPlayerScreen>
    with SingleTickerProviderStateMixin {
  final _audioPlayer = AudioPlayer();
  bool _isPlaying = false;
  Duration _position = Duration.zero;
  Duration _duration = Duration.zero;

  late AnimationController _rotationController;

  @override
  void initState() {
    super.initState();

    // Initialize animation controller for rotation
    _rotationController = AnimationController(
      vsync: this,
      duration: Duration(seconds: 10), // Adjust for rotation speed
    );

    // Listeners for audio duration and position
    _audioPlayer.onDurationChanged.listen((newDuration) {
      setState(() {
        _duration = newDuration;
      });
    });
    _audioPlayer.onPositionChanged.listen((position) {
      setState(() {
        _position = position;
      });
    });

    // Listener for when audio completes
    _audioPlayer.onPlayerComplete.listen((event) {
      setState(() {
        // Reset position and stop rotation when audio finishes
        _position = Duration.zero;
        _rotationController.stop();
        _rotationController.reset();
        _isPlaying = false;
      });
    });
  }

  @override
  void dispose() {
    _rotationController.dispose();
    _audioPlayer.dispose();
    super.dispose();
  }

  void _toggleAudio() async {
    if (_isPlaying) {
      await _audioPlayer.pause();
      _rotationController.stop(); // Stop rotation when paused
    } else {
      await _audioPlayer.play(AssetSource("Yiruma_-_River_Flows_in_You_(Hydr0.org).mp3"));
      _rotationController.repeat(); // Start rotation when playing
    }
    setState(() {
      _isPlaying = !_isPlaying;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(3, 51, 84, 1),
      appBar: AppBar(title: Text("Audio Player", style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white),),
      backgroundColor: Color(0xff0e1324),),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                RotationTransition(
                  turns: _rotationController,
                  child: CircleAvatar(
                    backgroundColor: Colors.white,
                    radius: 80,
                    backgroundImage: NetworkImage(
                      "https://c.saavncdn.com/572/River-Flows-in-You-English-2015-20180429015213-500x500.jpg",
                    ),
                  ),
                ),
                SizedBox(height: 10),
                Text("River Flows in You", style: TextStyle(fontSize: 20, color:Color.fromRGBO(245, 144, 29,0.9))),
                SizedBox(height: 5),
                Text("Yuki", style: TextStyle(fontSize: 16, color:Color.fromRGBO(252, 244, 235,0.9))),
              ],
            ),
            Column(
              children: [
                Slider(
                  activeColor: Color.fromRGBO(245, 144, 29,1),
                  inactiveColor: Colors.grey,
                  min: 0,
                  max: _duration.inSeconds.toDouble(),
                  value: _position.inSeconds.toDouble().clamp(0.0, _duration.inSeconds.toDouble()),
                  onChanged: (value) async {
                    final newPosition = Duration(seconds: value.toInt());
                    await _audioPlayer.seek(newPosition);
                    setState(() {
                      _position = newPosition;
                    });
                  },
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(formatTime(_position), style: TextStyle(color: Color.fromRGBO(252, 244, 235,0.9)),),
                      Text(formatTime(_duration), style: TextStyle(color: Color.fromRGBO(252, 244, 235,0.9)),),
                    ],
                  ),
                ),
                IconButton(
                  icon: Icon(
                    _isPlaying ? Icons.pause : Icons.play_arrow,
                    size: 64,
                  ),
                  onPressed: _toggleAudio,
                  color:Color.fromRGBO(252, 244, 235,0.9),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  String formatTime(Duration duration) {
    final hours = duration.inHours;
    final minutes = duration.inMinutes.remainder(60);
    final seconds = duration.inSeconds.remainder(60);
    return [
      if (hours > 0) hours,
      minutes,
      seconds,
    ].map((unit) => unit.toString().padLeft(2, '0')).join(":");
  }
}

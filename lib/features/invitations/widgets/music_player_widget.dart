import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';

import '../../../gen/assets.gen.dart';

class PlayMusicButton extends StatefulWidget {
  const PlayMusicButton({super.key});

  @override
  State<PlayMusicButton> createState() => _PlayMusicButtonState();
}

class _PlayMusicButtonState extends State<PlayMusicButton> {
  final AudioPlayer _audioPlayer = AudioPlayer();
  bool _isPlaying = false;

  Future<void> _toggleMusic() async {
    if (_isPlaying) {
      await _audioPlayer.pause();
    } else {
      await _audioPlayer.play(AssetSource(Assets.music.edSheeranPerfect));
    }
    setState(() {
      _isPlaying = !_isPlaying;
    });
  }

  @override
  Widget build(BuildContext context) => Center(
        child: ElevatedButton(
          onPressed: _toggleMusic,
          style: ElevatedButton.styleFrom(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30),
            ),
            backgroundColor: Colors.transparent,
            shadowColor: Colors.transparent,
          ),
          child: DecoratedBox(
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                colors: [Color(0xFFB88E62), Color(0xFF8B5E3C)],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              borderRadius: BorderRadius.circular(30),
            ),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
              constraints: const BoxConstraints(minWidth: 150),
              alignment: Alignment.center,
              child: Text(
                _isPlaying ? 'Musiqani To‘xtatish' : 'Musiqani O‘ynatish',
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                ),
              ),
            ),
          ),
        ),
      );
}

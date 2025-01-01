// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:equatable/equatable.dart';
//
// // Audio Player Events
// abstract class AudioEvent extends Equatable {
//   @override
//   List<Object?> get props => [];
// }
//
// class PlayAudio extends AudioEvent {}
// class PauseAudio extends AudioEvent {}
// class StopAudio extends AudioEvent {}
//
// // Audio Player States
// abstract class AudioState extends Equatable {
//   @override
//   List<Object?> get props => [];
// }
//
// class AudioInitial extends AudioState {}
// class AudioPlaying extends AudioState {}
// class AudioPaused extends AudioState {}
// class AudioStopped extends AudioState {}
//
// // Audio Player BLoC Logic
// class AudioBloc extends Bloc<AudioEvent, AudioState> {
//   AudioBloc() : super(AudioInitial());
//
//   @override
//   Stream<AudioState> mapEventToState(AudioEvent event) async* {
//     if (event is PlayAudio) {
//       yield AudioPlaying();
//     } else if (event is PauseAudio) {
//       yield AudioPaused();
//     } else if (event is StopAudio) {
//       yield AudioStopped();
//     }
//   }
// }

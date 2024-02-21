




import '../data/diplome_model.dart';

abstract class DiplomeProfileState {}

class DiplomeProfileInitial extends DiplomeProfileState {}

class DiplomeProfileLoading extends DiplomeProfileState {}

class DiplomeProfileLoaded extends DiplomeProfileState {
   final List<DiplomeModel> diplomeProfiles;

   DiplomeProfileLoaded({required this.diplomeProfiles});
}

class DiplomeProfileError extends DiplomeProfileState {
  final String message;

  DiplomeProfileError({required this.message});
}

import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marketing_experts/data/diplome_model.dart';


import '../data/gallery_model.dart';
import 'diplome_profile_state.dart';


class DiplomeProfileCubit extends Cubit<DiplomeProfileState> {
  DiplomeProfileCubit() : super(DiplomeProfileInitial());

  Future<String> _getJson() =>
      rootBundle.loadString('assets/json/data_diploma.json');

  void getDiplomeProfile() async {
    emit(DiplomeProfileLoading());
    try {
      List<dynamic> jsonResult = json.decode(await _getJson());
      List<DiplomeModel> diplomes =
      jsonResult.map((e) => DiplomeModel.fromJson(e)).toList();
      emit(DiplomeProfileLoaded(diplomeProfiles: diplomes));
    } catch (e) {
      emit(DiplomeProfileError(message: 'Terjadi kesalahan saat memuat data'));
    }
  }
}

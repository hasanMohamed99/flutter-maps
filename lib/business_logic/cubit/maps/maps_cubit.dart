// ignore_for_file: depend_on_referenced_packages

import 'package:bloc/bloc.dart';
import 'package:flutter_maps/data/models/place.dart';
import 'package:flutter_maps/data/models/place_directions.dart';
import 'package:flutter_maps/data/models/place_suggestion.dart';
import 'package:flutter_maps/data/repository/maps_repo.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:meta/meta.dart';

part 'maps_state.dart';

class MapsCubit extends Cubit<MapsState> {
  final MapsRepository mapsRepository;
  MapsCubit(this.mapsRepository) : super(MapsInitial());

  void emitPlaceSuggestions({required String place, required sessionToken}){
    mapsRepository.fetchSuggestions(place: place, sessionToken: sessionToken).then((suggestions) {
      emit(PlacesLoaded(suggestions));
    });
  }

  void emitPlaceLocation({required String placeId, required sessionToken}){
    mapsRepository.getPlaceLocation(placeId: placeId, sessionToken: sessionToken).then((place) {
      emit(PlacesLocationLoaded(place));
    });
  }

  void emitPlaceDirections({required LatLng origin, required LatLng destination}){
    mapsRepository.getDirections(origin: origin, destination: destination).then((directions) {
      emit(DirectionsLoaded(directions));
    });
  }
}

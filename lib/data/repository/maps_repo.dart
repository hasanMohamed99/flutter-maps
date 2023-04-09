import 'package:flutter_maps/data/models/place.dart';
import 'package:flutter_maps/data/models/place_directions.dart';
import 'package:flutter_maps/data/models/place_suggestion.dart';
import 'package:flutter_maps/data/web_services/places_web_services.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapsRepository {
  final PlacesWebServices placesWebServices;

  MapsRepository(this.placesWebServices);

  Future<List<dynamic>> fetchSuggestions({
    required String place,
    required String sessionToken,
  }) async {
    final suggestions = await placesWebServices.fetchSuggestions(
      place: place,
      sessionToken: sessionToken,
    );
    return suggestions.map((suggestion) => PlaceSuggestion.fromJson(suggestion)).toList();
  }

  Future<Place> getPlaceLocation({
    required String placeId,
    required String sessionToken,
  }) async {
    final place = await placesWebServices.getPlaceLocation(
      placeId: placeId,
      sessionToken: sessionToken,
    );
    return Place.fromJson(place);
  }

  Future<PLaceDirections> getDirections({
    required LatLng origin,       /// origin = current location
    required LatLng destination,  /// destination = searched for location
  }) async {
    final directions = await placesWebServices.getDirections(
      origin: origin,
      destination: destination,
    );
    return PLaceDirections.fromJson(directions);
  }
}

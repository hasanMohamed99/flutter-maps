import 'package:dio/dio.dart';
import 'package:flutter_maps/constants/strings.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class PlacesWebServices {
  late Dio dio;

  PlacesWebServices() {
    BaseOptions options = BaseOptions(
      connectTimeout: const Duration(seconds: 20),
      receiveTimeout: const Duration(seconds: 20),
      receiveDataWhenStatusError: true,
    );
    dio = Dio(options);
  }

  Future<List<dynamic>> fetchSuggestions({
    required String place,
    required String sessionToken,
  }) async {
    try {
      Response response =
          await dio.get(MyStrings.suggestionsBaseUrl, queryParameters: {
        'input': place,
        'types': 'address',
        'components': 'country:eg',
        'key': MyStrings.googleApiKey,
        'sessiontoken': sessionToken,
      });
      return response.data['predictions'];
    } catch (error) {
      // ignore: avoid_print
      print(error.toString());
      return [];
    }
  }

  Future<dynamic> getPlaceLocation({
    required String placeId,
    required String sessionToken,
  }) async {
    try {
      Response response =
      await dio.get(MyStrings.placeLocationBaseUrl, queryParameters: {
        'place_id': placeId,
        'fields': 'geometry',
        'key': MyStrings.googleApiKey,
        'sessiontoken': sessionToken,
      });
      return response.data;
    } catch (error) {
      // ignore: avoid_print
      print(error.toString());
      return Future.error('Place Location Error: ', StackTrace.fromString('this is error trace'));
    }
  }

  Future<dynamic> getDirections({
    required LatLng origin,       /// origin = current location
    required LatLng destination,  /// destination = searched for location
  }) async {
    try {
      Response response =
      await dio.get(MyStrings.directionsBaseUrl, queryParameters: {
        'origin': '${origin.latitude},${origin.longitude}',
        'destination': '${destination.latitude},${destination.longitude}',
        'key': MyStrings.googleApiKey,
      });
      return response.data;
    } catch (error) {
      return Future.error('Place Location Error: ', StackTrace.fromString('this is error trace'));
    }
  }
}

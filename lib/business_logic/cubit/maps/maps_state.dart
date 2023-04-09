part of 'maps_cubit.dart';

@immutable
abstract class MapsState {}

class MapsInitial extends MapsState {}

class PlacesLoaded extends MapsState{
  final List<dynamic> places;

  PlacesLoaded(this.places);
}

class PlacesLocationLoaded extends MapsState{
  final Place place;

  PlacesLocationLoaded(this.place);
}

class DirectionsLoaded extends MapsState{
  final PLaceDirections pLaceDirections;

  DirectionsLoaded(this.pLaceDirections);
}



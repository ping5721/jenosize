part of 'restaurant_bloc.dart';

@immutable
abstract class RestaurantEvent {}

class RestarantStarted extends RestaurantEvent {}

class RestarantSearch extends RestaurantEvent {
  final String search;

  RestarantSearch(this.search);
}

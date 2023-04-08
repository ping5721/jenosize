part of 'restaurant_bloc.dart';

@immutable
abstract class RestaurantState {}

class RestaurantInitial extends RestaurantState {}

class RestaurantLoading extends RestaurantState {}

class RestaurantSuccess extends RestaurantState {
  final List<Restaurant> restaurants;

  RestaurantSuccess(this.restaurants);
}

class RestaurantFailure extends RestaurantState {}

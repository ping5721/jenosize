import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:jenosize/model/restuarant.dart';
import 'package:jenosize/repository/restaurant_repository.dart';

part 'restaurant_event.dart';
part 'restaurant_state.dart';

class RestaurantBloc extends Bloc<RestaurantEvent, RestaurantState> {
  final IRestaurantRepository restaurantRepository;

  RestaurantBloc(this.restaurantRepository) : super(RestaurantInitial()) {
    on<RestaurantEvent>(
      (event, emit) async {
        if (event is RestarantStarted) {
          emit(RestaurantLoading());
          await restaurantRepository
              .getList()
              .then((restaurants) => emit(
                    RestaurantSuccess(restaurants),
                  ))
              .onError(
            (error, stackTrace) {
              emit(
                RestaurantFailure(),
              );
            },
          );
        }

        if (event is RestarantSearch) {
          emit(RestaurantLoading());
          await restaurantRepository
              .getList(search: event.search)
              .then((restaurants) => emit(
                    RestaurantSuccess(restaurants),
                  ))
              .onError(
            (error, stackTrace) {
              emit(
                RestaurantFailure(),
              );
            },
          );
        }
      },
    );
  }
}

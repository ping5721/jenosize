import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jenosize/pages/search_page/bloc/restaurant_bloc.dart';
import 'package:jenosize/widgets/restuarant_card.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocListener<RestaurantBloc, RestaurantState>(
      listener: (context, state) {
        if (state is RestaurantFailure) {
          const snackBar = SnackBar(
            content: Text('Something went wrong!'),
          );
          ScaffoldMessenger.of(context).showSnackBar(snackBar);
        }
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text('รายชื่อร้านอาหาร'),
        ),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
              child: TextFormField(
                onFieldSubmitted: (String search) {
                  context.read<RestaurantBloc>().add(RestarantSearch(search));
                },
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(
                      20,
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              child: BlocBuilder<RestaurantBloc, RestaurantState>(
                builder: (context, state) {
                  if (state is RestaurantSuccess) {
                    if (state.restaurants.isEmpty) {
                      return const Center(child: Text('No data'));
                    } else {
                      return ListView.builder(
                        padding: const EdgeInsets.all(20),
                        itemBuilder: (context, index) {
                          return RestuarantCard(
                            restaurant: state.restaurants[index],
                          );
                        },
                        itemCount: state.restaurants.length,
                      );
                    }
                  }
                  if (state is RestaurantLoading) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                  if (state is RestaurantFailure) {
                    return const Center(
                      child: Text('Error'),
                    );
                  }
                  return const SizedBox();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

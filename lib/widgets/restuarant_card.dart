import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:jenosize/model/restuarant.dart';
import 'package:jenosize/pages/map_page/map_page_argument.dart';

class RestuarantCard extends StatelessWidget {
  const RestuarantCard({Key? key, required this.restaurant}) : super(key: key);

  final Restaurant restaurant;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () async {
        await Navigator.of(context).pushNamed(
          '/map',
          arguments: MapPageArgument(
            restaurant.name,
            LatLng(
              double.parse(restaurant.latitude),
              double.parse(restaurant.longitude),
            ),
          ),
        );
      },
      leading: ClipRRect(
        borderRadius: BorderRadius.circular(8.0),
        child: Image.network(
          restaurant.imageProfile,
          fit: BoxFit.cover,
        ),
      ),
      title: Text(
        restaurant.name,
      ),
      subtitle: Text(
        restaurant.description,
        maxLines: 3,
      ),
      isThreeLine: true,
    );
  }
}

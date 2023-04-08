import 'package:flutter/material.dart';
import 'package:jenosize/model/restuarant.dart';

class RestuarantCard extends StatelessWidget {
  const RestuarantCard({Key? key, required this.restaurant}) : super(key: key);

  final Restaurant restaurant;

  @override
  Widget build(BuildContext context) {
    return ListTile(
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

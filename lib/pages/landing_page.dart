import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:jenosize/pages/map_page/map_page_argument.dart';

class LandingPage extends StatelessWidget {
  const LandingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/jenosize.png'),
            ElevatedButton(
              onPressed: () async {
                await Navigator.of(context).pushNamed('/search');
              },
              child: const Text(
                'ค้นหาร้านอาหาร',
              ),
            ),
            ElevatedButton(
              onPressed: () async {
                await Navigator.of(context).pushNamed(
                  '/map',
                  arguments: MapPageArgument(
                    'Jenosize',
                    const LatLng(
                      13.89422613348108,
                      100.51625995310687,
                    ),
                  ),
                );
              },
              child: const Text(
                'แผนที่บริษัท Jenosize',
              ),
            )
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

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
                await Navigator.of(context).pushNamed('/map');
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

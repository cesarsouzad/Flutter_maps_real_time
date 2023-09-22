import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:primeiro_projeto_flutter/utils/colors_standard.dart';
import 'package:permission_handler/permission_handler.dart';

class Maps extends StatefulWidget {
  const Maps({Key? key}) : super(key: key);

  @override
  _MapsState createState() => _MapsState();
}

MinhaPosicao() async {
  Position _PositionReal = await Geolocator.getCurrentPosition();
  print(_PositionReal);
}

class _MapsState extends State<Maps> {
  late GoogleMapController mapController;

  final LatLng _center = const LatLng(-7.9636988418928425, -54.7911170829231);

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('MAP REAL TIME'),
          backgroundColor: Colors.green[700],
          titleSpacing: 130,
          actions: [
            IconButton(
              icon: Icon(Icons.location_on), // Ícone do botão
              onPressed: () async {
                var status = await Permission.location.request();
                if (status.isGranted) {
                  Position position = await Geolocator.getCurrentPosition();
                  print(position);
                } else {
                  print('Permissão de localização negada');
                }

                MinhaPosicao();
              },
            ),
          ],
        ),
        body: GoogleMap(
          onMapCreated: _onMapCreated,
          initialCameraPosition: CameraPosition(
            target: _center,
            zoom: 4.0,
          ),
          myLocationEnabled: true,
          myLocationButtonEnabled: true,
        ),
      ),
    );
  }
}

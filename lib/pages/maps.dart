import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:permission_handler/permission_handler.dart';

class Maps extends StatefulWidget {
  const Maps({Key? key}) : super(key: key);

  @override
  _MapsState createState() => _MapsState();
}

class _MapsState extends State<Maps> {
  late GoogleMapController mapController;

  final LatLng _center = const LatLng(-7.9636988418928425, -54.7911170829231);

  bool authorizeLocation = false;
  LatLng? currentLocation;

  Set<Marker> markers = Set(); // Adicionando um conjunto de marcadores

  @override
  void initState() {
    super.initState();
    checkLocationPermission();
  }

  checkLocationPermission() async {
    var status = await Permission.location.request();
    if (status.isGranted) {
      Position position = await Geolocator.getCurrentPosition();
      // Carregando o BitmapDescriptor de forma assíncrona
      BitmapDescriptor customMarker = await BitmapDescriptor.fromAssetImage(
        ImageConfiguration(devicePixelRatio: 2.5),
        "lib/assets/custom_marker.png",
      );

      // Atualizando o estado após a conclusão do trabalho assíncrono
      setState(() {
        authorizeLocation = true;
        currentLocation = LatLng(position.latitude, position.longitude);

        // Adicionando um marcador personalizado ao conjunto de marcadores
        markers.add(
          Marker(
            markerId: MarkerId("1"),
            position: currentLocation!,
            icon: customMarker,
            infoWindow: InfoWindow(
              title: 'Você está aqui!',

              // snippet: 'Descrição do marcador...',
            ),
            anchor: Offset(0.5, 0.5),
          ),
        );
      });
    } else {
      print('Permissão de localização negada');
      _noPermission(context,
          'Permissão de localização negada! Por favor permita acesso a localização.');
    }
  }

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
    if (currentLocation != null) {
      mapController.animateCamera(
        CameraUpdate.newCameraPosition(
          CameraPosition(
            target: currentLocation!,
            zoom: 17.0,
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        // appBar: AppBar(
        //   title: Center(child: const Text('REAL TIME')),
        //   backgroundColor: Colors.green[700],
        // ),
        body: authorizeLocation
            ? GoogleMap(
                onMapCreated: _onMapCreated,
                initialCameraPosition: CameraPosition(
                  target: currentLocation ?? _center,
                  zoom: 15.0,
                ),
                // myLocationEnabled: true,
                myLocationButtonEnabled: true,
                markers: markers, // Adicionando marcadores ao mapa
              )
            : Center(
                child: CircularProgressIndicator(),
              ),
      ),
    );
  }
}

void _noPermission(BuildContext context, String message) {
  final snackBar = SnackBar(
    content: Text(
      message,
      style: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.bold,
      ),
      textAlign: TextAlign.center,
    ),
    backgroundColor: Colors.redAccent,
    padding: EdgeInsets.symmetric(vertical: 200),
  );
  ScaffoldMessenger.of(context).showSnackBar(snackBar);
}

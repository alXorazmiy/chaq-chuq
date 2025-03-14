import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:chaqchuq/app/model/address.dart';
import 'package:chaqchuq/app/pages/address/bloc/address_event.dart';
import 'package:chaqchuq/app/pages/address/bloc/address_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:translator/translator.dart';
import 'package:yandex_geocoder/yandex_geocoder.dart' as geo;
import 'package:yandex_mapkit/yandex_mapkit.dart' as yandmap;


class MyAddressBloc extends Bloc<MyAddressEvent, MyAddressStates> {
    MyAddressBloc(): super(MyAddressStates(
            myAddressList: [],
            myaddress: MyAddressModel(),
            initialPosition: yandmap.CameraPosition(
                target: yandmap.Point(latitude: 41.311155, longitude: 69.279732),
                zoom: 14
            ),
    )) {

    
        on<GetCurrentLocation>(_getCurrentLocation);
        
        
        on<MapMoved>(_mapMoved);
        on<MapStopped>(_mapStopped);
        // on<CreateAddress>(_createAddress);
        // on<UpdateAddress>(_updateAddress);
        // on<UpdateAddressItem>(_updateAddressItem);
        // on<DeleteAddress>(_deleteAddress);

        on<AddressNameEvent>(_addressNameEvent);
     
    }



    void _mapMoved(MapMoved event, emit) async {
        emit(state.copyWith(isLoader: true));
    }
    void _mapStopped(MapStopped event, emit) async {

        final geocoder = geo.YandexGeocoder(apiKey: "8d1479bf-b436-4cb2-bde3-338cb6a99706");
        final response = await geocoder.getGeocode(
            geo.ReverseGeocodeRequest(
            pointGeocode: (lat: event.cameraPosition.target.latitude, lon: event.cameraPosition.target.longitude),
            lang: geo.Lang.enEn
            ),
        );

        var address = response.firstAddress;
        print(address);
        var components = address?.components ?? [];

        String? city = components.firstWhere(
            (c) => c.kind == geo.KindResponse.locality,
            orElse: () => geo.Component(kind: geo.KindResponse.locality, name: 'Noma’lum shahar'),
        ).name;

        String? street = components.firstWhere(
            (c) => c.kind == geo.KindResponse.street,
            orElse: () => geo.Component(kind: geo.KindResponse.street, name: 'Noma’lum ko‘cha'),
        ).name;

        String? houseNumber = components.firstWhere(
            (c) => c.kind == geo.KindResponse.house,
            orElse: () => geo.Component(kind: geo.KindResponse.house, name: 'Noma’lum uy raqami'),
        ).name;
        String? district = components.firstWhere(
            (c) => c.kind == geo.KindResponse.district,
            orElse: () => geo.Component(kind: geo.KindResponse.district, name: 'Noma’lum uy raqami'),
        ).name;
        String? area = components.firstWhere(
            (c) => c.kind == geo.KindResponse.area,
            orElse: () => geo.Component(kind: geo.KindResponse.area, name: 'Noma’lum uy raqami'),
        ).name;
        String? province = components.firstWhere(
            (c) => c.kind == geo.KindResponse.province,
            orElse: () => geo.Component(kind: geo.KindResponse.province, name: 'Noma’lum uy raqami'),
        ).name;
        String? metro = components.firstWhere(
            (c) => c.kind == geo.KindResponse.metro,
            orElse: () => geo.Component(kind: geo.KindResponse.metro, name: 'Noma’lum uy raqami'),
        ).name;

        print("Shahar: $city");
        print("Ko‘cha: $street");
        print("Uy raqami: $houseNumber");
        print("district: $district");
        print("area: $area");
        print("province: $province");
        print("metro: $metro");

        // final translator = GoogleTranslator();

        // translator.translate(address, from: 'en', to: 'uz').then(print);
        // address = address.replaceAll("Uzbekistan,", "").replaceAll("District", "Tumani").replaceAll("street", "ko'chasi");
        emit(state.copyWith(
            initialPosition: event.cameraPosition,
            // myaddress: state.myaddress.copyWith(addressName: address)
        ));
    }

    void _addressNameEvent(AddressNameEvent event, emit) async {
        emit(state.copyWith(myaddress: state.myaddress.copyWith(addressName: event.addressName)));
    }


    Future<void> _getCurrentLocation(GetCurrentLocation event, emit) async {
        emit(state.copyWith(isLoader: true));
        
        PermissionStatus permission = await Permission.locationWhenInUse.status;
        if (permission.isGranted) {
            Position position = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high,);
            yandmap.Point newLocation = yandmap.Point(latitude: position.latitude, longitude: position.longitude);


            if (state.mapController != null) {
                state.mapController!.moveCamera(
                    yandmap.CameraUpdate.newCameraPosition(
                        yandmap.CameraPosition(target: newLocation, zoom: 17),
                    ),
                    animation: const yandmap.MapAnimation(duration: 0.5),
                );
                
            }
            emit(state.copyWith(
                initialPosition: yandmap.CameraPosition(target: newLocation, zoom: 17),
            ));
        } 
        
        else if (permission.isDenied) {
            PermissionStatus newPermission = await Permission.locationWhenInUse.request();
            if (newPermission.isGranted) {
                _getCurrentLocation(event, emit);
            }
        }

        event.context.read<MyAddressBloc>().add(MapStopped(cameraPosition: state.initialPosition));

        emit(state.copyWith(isLoader: false));
    }



//   void _createAddress(CreateAddress event, emit) async {
//     var phoneNumber = StorageRepository.getString(key: "phoneNumber");

//     var response = await apiClient.request(
//       url: UrlHelper.costumerIdGet(phoneNumber: phoneNumber),
//       method: RequestType.get,
//     );
//     var body = jsonDecode(response);
//     emit(state.copyWith(
//         myaddress: state.myaddress.copyWith(
//             customerId: body["id"],
//             entrance: state.myaddress.entrance.toString(),
//             contactNumber: phoneNumber,
//             doorPhone: phoneNumber)));
//     try {
//       var response = await apiClient.request(
//         url: UrlHelper.costumerLocationCreate,
//         method: RequestType.post,
//         body: state.myaddress.toJson(),
//       );
//       response = await apiClient.request(
//         url: UrlHelper.costumerLocationGetAll,
//         method: RequestType.get,
//       );

//       final jsonData = jsonDecode(response);
//       final List<MyAddressModel> customerInfoList =
//           MyAddressModel.fromJsonList(jsonData["data"]);

//       emit(state.copyWith(
//         myAddressList: customerInfoList,
//       ));
//       AppNavigator.pop();
//     } on ApiException catch (e) {
//       log(e.toString());
//     }
//   }

//   void _updateAddress(UpdateAddress event, emit) async {
//     CameraPosition newPosition = CameraPosition(
//       target: LatLng(event.myaddress.latitude, event.myaddress.longitude),
//       zoom: 17,
//     );
//     if (state.mapController != null) {
//       state.mapController!
//           .animateCamera(CameraUpdate.newCameraPosition(newPosition));
//     }
//     emit(state.copyWith(
//         myaddress: state.myaddress.copyWith(
//           id: event.myaddress.id,
//           addressName: event.myaddress.addressName,
//           street: event.myaddress.street,
//           city: event.myaddress.city,
//           region: event.myaddress.region,
//           doorPhone: event.myaddress.doorPhone,
//           entrance: event.myaddress.entrance,
//           apartment: event.myaddress.apartment,
//           floor: event.myaddress.floor,
//           home: event.myaddress.home,
//           comment: event.myaddress.comment,
//           contactNumber: event.myaddress.contactNumber,
//           latitude: event.myaddress.latitude - 0.0000001,
//           longitude: event.myaddress.longitude,
//         ),
//         initialPosition: newPosition));
//   }

//   void _updateAddressItem(UpdateAddressItem event, emit) async {
//     var phoneNumber = StorageRepository.getString(key: "phoneNumber");
//     emit(state.copyWith(
//         myaddress: state.myaddress.copyWith(
//             customerId: 3,
//             entrance: state.myaddress.entrance,
//             apartment: state.myaddress.apartment ?? 0,
//             contactNumber: phoneNumber,
//             doorPhone: phoneNumber)));
//     try {
//       var response = await apiClient.request(
//         url: UrlHelper.costumerLocationUpdate,
//         method: RequestType.put,
//         body: state.myaddress.toJson(),
//       );
//       response = await apiClient.request(
//         url: UrlHelper.costumerLocationGetAll,
//         method: RequestType.get,
//       );
//       final jsonData = jsonDecode(response);
//       final List<MyAddressModel> customerInfoList =
//           MyAddressModel.fromJsonList(jsonData["data"]);

//       emit(state.copyWith(
//         myAddressList: customerInfoList,
//       ));
//       AppNavigator.pop();
//     } on ApiException catch (e) {
//       log(e.toString());
//     }
//   }

//   void _deleteAddress(DeleteAddress event, emit) async {
//     try {
//       var response = await apiClient.request(
//         url: "/CustomerLocation/delete/${event.id}",
//         method: RequestType.delete,
//       );
//       response = await apiClient.request(
//         url: UrlHelper.costumerLocationGetAll,
//         method: RequestType.get,
//       );
//       final jsonData = jsonDecode(response);
//       final List<MyAddressModel> customerInfoList =
//           MyAddressModel.fromJsonList(jsonData["data"]);

//       emit(state.copyWith(
//         myAddressList: customerInfoList,
//       ));
//     } on ApiException catch (e) {
//       log(e.toString());
//     }
//   }
}
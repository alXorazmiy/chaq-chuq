import 'package:chaqchuq/app/model/address.dart';
import 'package:yandex_mapkit/yandex_mapkit.dart';

class MyAddressStates {
    bool isButton;
    bool isLoader;
    bool isEdit;
    YandexMapController? mapController;
    CameraPosition initialPosition = CameraPosition(target: Point(latitude: 41.311155, longitude: 69.279732), zoom: 14);

    final List<MyAddressModel> myAddressList;
    MyAddressModel myaddress;

    void onMapCreated(YandexMapController controller) {
        mapController = controller;
        mapController?.moveCamera(
            CameraUpdate.newCameraPosition(initialPosition),
            animation: MapAnimation(type: MapAnimationType.smooth, duration: 0.5),
        );
    }

    MyAddressStates({
        required this.myAddressList,
        this.isButton = false,
        this.isLoader = false,
        this.isEdit = false,
        required this.initialPosition,
        this.mapController,
        required this.myaddress
    }); 

    MyAddressStates copyWith({
        bool? isButton,
        bool? isLoader,
        bool? isEdit,
        CameraPosition? initialPosition,
        List<MyAddressModel>? myAddressList,
        YandexMapController? mapController,
        MyAddressModel? myaddress
    }) {
        return MyAddressStates(
            isButton: isButton ?? this.isButton,
            isLoader: isLoader ?? this.isLoader,
            isEdit: isEdit ?? this.isEdit,
            initialPosition: initialPosition ?? this.initialPosition,
            myAddressList: myAddressList ?? this.myAddressList,
            mapController: mapController ?? this.mapController, 
            myaddress: myaddress ?? this.myaddress
        );
    }
}
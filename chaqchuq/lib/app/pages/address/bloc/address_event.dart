import 'package:chaqchuq/app/model/address.dart';
import 'package:flutter/material.dart';
import 'package:yandex_mapkit/yandex_mapkit.dart';

class MyAddressEvent {}

class GetCurrentLocation extends MyAddressEvent {
    final BuildContext context;
    GetCurrentLocation({required this.context});
}



class MapMoved extends MyAddressEvent {}
class MapStopped extends MyAddressEvent {
    final CameraPosition cameraPosition;
    MapStopped({required this.cameraPosition});
}





class AddressNameEvent extends MyAddressEvent {
    final String addressName;
    AddressNameEvent(this.addressName);
}



class CreateAddress extends MyAddressEvent{
    final MyAddressModel myaddress;
    CreateAddress({required this.myaddress});
}



class UpdateAddress extends MyAddressEvent{
    final MyAddressModel myaddress;
    UpdateAddress({required this.myaddress});
}

class DeleteAddress extends MyAddressEvent{
    final int? id;
    DeleteAddress({required this.id});
}
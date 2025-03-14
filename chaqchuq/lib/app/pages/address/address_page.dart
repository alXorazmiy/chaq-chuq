import 'package:chaqchuq/app/model/address.dart';
import 'package:chaqchuq/app/pages/address/bloc/address_bloc.dart';
import 'package:chaqchuq/app/pages/address/bloc/address_event.dart';
import 'package:chaqchuq/app/pages/address/bloc/address_state.dart';
import 'package:chaqchuq/app/utils/colors/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:yandex_mapkit/yandex_mapkit.dart';

class AddressPage extends StatefulWidget {
  const AddressPage({super.key});

  @override
  State<AddressPage> createState() => _AddressPageState();
}

class _AddressPageState extends State<AddressPage> {
  @override
  void initState() {
    super.initState();
    context.read<MyAddressBloc>().add(GetCurrentLocation(context: context));
  }

  @override
  Widget build(BuildContext context) {
    final customColors = Theme.of(context).extension<CustomColors>()!;
    final TextEditingController _textcontroller = TextEditingController();
    return BlocBuilder<MyAddressBloc, MyAddressStates>(
      builder: (context, state) {
        return Scaffold(
          // appBar: AppBar(
          //     backgroundColor: Colors.white,
          //     elevation: 0,
          //     leading: Padding(
          //     padding: EdgeInsets.only(left: 30.w),
          //     child: Container(),
          //     ),
          //     title: const Text(
          //     "Mening manzillarim",
          //     style: TextStyle(
          //         fontSize: 24.0,
          //         fontWeight: FontWeight.bold,
          //     ),
          //     ),
          //     centerTitle: true,
          // ),
          body: Column(
            children: [
              SizedBox(
                  height: 0.7.sh,
                  child: Stack(
                    children: [
                      YandexMap(
                        tiltGesturesEnabled: false,
                        onMapCreated: (YandexMapController controller) {
                          state.onMapCreated(controller);
                        },
                        onCameraPositionChanged:
                            (cameraPosition, reason, finished) {
                          if (!finished) {
                            context.read<MyAddressBloc>().add(MapMoved());
                          } else {
                            context.read<MyAddressBloc>().add(
                                MapStopped(cameraPosition: cameraPosition));
                          }
                        },
                      ),
                      Center(
                        child: Transform.translate(
                          offset: const Offset(0, -15),
                          child: SizedBox(
                            width: 60.w,
                            height: 60.h,
                            child: Image.asset(
                              "assets/icons/homelocation.png",
                              color: customColors.danger,
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                          bottom: 30.h,
                          right: 10.w,
                          child: GestureDetector(
                            onTap: () {
                              context
                                  .read<MyAddressBloc>()
                                  .add(GetCurrentLocation(context: context));
                            },
                            child: Container(
                                width: 40.w,
                                height: 40.h,
                                decoration: BoxDecoration(
                                    color: customColors.danger,
                                    shape: BoxShape.circle),
                                child: Icon(
                                  Icons.my_location,
                                  color: Colors.white,
                                )),
                          ))
                    ],
                  ),
                ),
              BlocConsumer<MyAddressBloc, MyAddressStates>(
                    listener: (BuildContext context, MyAddressStates state) { 
                        _textcontroller.text = state.myaddress.addressName;
                     },
                    builder: (context, state) {
                        return Container(
                        height: 0.3.sh,
                        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
                        decoration: BoxDecoration(
                            color: Colors.transparent,
                        ),
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                                Container(
                                    padding: EdgeInsets.symmetric(horizontal: 10.w),
                                    decoration: BoxDecoration(
                                        color: Color(0xF5F5F50),
                                        borderRadius: BorderRadius.circular(10),
                                    ),
                                  child: TextField(
                                      controller: _textcontroller,
                                      onChanged: (value) {
                                          context.read<MyAddressBloc>().add(AddressNameEvent(_textcontroller.text));
                                      },
                                      decoration: const InputDecoration(
                                          hintText: 'Manzil',
                                          border: InputBorder.none
                                      ),
                                  ),
                                ),
                                SizedBox(height: 20.h,),
                                GestureDetector(
                                    child: Container(
                                        height: 50.h,
                                        width: 1.sw,
                                        alignment: Alignment.center,
                                        decoration: BoxDecoration(
                                            color: customColors.danger,
                                            borderRadius: BorderRadius.circular(20.r)
                                        ),
                                        child: Text("Qo'shish", style: TextStyle(color: Colors.white),),
                                    ),
                                )
                                ],
                            ),
                        );
                    },
                ),
            ],
          ),
        );
      },
    );
  }
}

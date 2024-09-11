import 'package:driver/features/main/presentation/widgets/CardContactUs.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../../helper_widgets/constans.dart';
import '../../../helper_widgets/app_loading.dart';
import '../widgets/custom_profile_appBar.dart';
import '../../data/get_contact/get_contact_bloc.dart';
import '../../data/send_contact_us/bloc.dart';

class ContactUsView extends StatefulWidget {
  const ContactUsView({super.key});

  @override
  State<ContactUsView> createState() => _ContactUsViewState();
}

class _ContactUsViewState extends State<ContactUsView> {
  final bloc = GetIt.I<GetContactBloc>()..add(GetContactEvent());
  final sendBloc = GetIt.I<SendContactUsBloc>();
  final event = SendContactUsEvent();

  @override
  Widget build(BuildContext context) {
    final MediaQueryData mediaQueryData = MediaQuery.of(context);
    return BlocBuilder<GetContactBloc, GetContactStates>(

        bloc: bloc,
        builder: (context, state) {
          if (state is GetContactLoading) {
            return const AppLoadingView();
          }
          if (state is GetContactSuccess) {
            return Scaffold(
                backgroundColor: Colors.white,
                extendBodyBehindAppBar: false,
                appBar: const CustomAppBar(
                    text: 'تواصل معنا',
              ),
                body:
               
                Padding(
                  padding:mediaQueryData.viewInsets,
              
                  child: Stack(
                      alignment: Alignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 15.0),
                          child: Column(
                          children: [
                            SizedBox(
                              height: 230,
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(12),
                                child: GoogleMap(
                                    markers: {
                                      Marker(
                                          markerId: const MarkerId('myMarekr'),
                                          position: LatLng(
                                              state.list.data.lat, state.list.data.lng),
                                          icon:BitmapDescriptor.defaultMarkerWithHue(120)
                                      )
                                    },
                                    zoomControlsEnabled: false,
                                    initialCameraPosition: CameraPosition(
                                      target:
                                          LatLng(state.list.data.lat, state.list.data.lng),
                                      zoom: 19,
                                    )),
                              ),
                            ),
                                               const  SizedBox(height: 65,),
                            SingleChildScrollView(
                              child: Flexible(
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                                  child: Column(
                                    children: [
                                      const Center(
                                      child: Text("أو يمكنك إرسال رسالة ",
                                          style: kTextStyle18),
                                    ),
                                  TextFormField(
                                      controller: event.nameController,
                                      decoration: InputDecoration(
                                          hintText: "الإسم",
                                          hintStyle: kTextStyle15light,
                                          border: OutlineInputBorder(
                                            borderRadius: BorderRadius.circular(20),
                                            borderSide: const BorderSide(
                                                color: kBorderColorField),
                                          ))),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  TextFormField(
                                      controller: event.phoneController,
                                      decoration: InputDecoration(
                                          hintText: "رقم الموبايل",
                                          hintStyle: kTextStyle15light,
                                          border: OutlineInputBorder(
                                            borderRadius: BorderRadius.circular(20),
                                            borderSide: const BorderSide(
                                              color: kBorderColorField,
                                            ),
                                          ))),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  TextFormField(
                                      controller: event.contentController,
                                      decoration: InputDecoration(
                                          contentPadding: const EdgeInsets.symmetric(vertical: 30.0,horizontal: 10),
                                          hintText: "الموضوع",
                                          hintStyle: kTextStyle15light,
                                          border: OutlineInputBorder(
                                            borderRadius: BorderRadius.circular(20),
                                            borderSide: const BorderSide(
                                                color: kBorderColorField),

                                          ))),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      BlocConsumer(
                                          bloc: sendBloc,
                                          listener: (context, state) {
                                            if (state is SendContactUsSuccessState) {
                                              ScaffoldMessenger.of(context)
                                                  .showSnackBar(const SnackBar(
                                                  backgroundColor: kPrimaryColor,
                                                  content: Center(
                                                    child: Text(
                                                      'شكرا، تم إرسال الرسالة بنجاح',
                                                      style: kTextStyle15,
                                                    ),
                                                  )));
                                            }
                                            if (state is SendContactUsFailureState) {
                                              ScaffoldMessenger.of(context)
                                                  .showSnackBar(const SnackBar(
                                                  backgroundColor: kPrimaryColor,
                                                  content: Text(
                                                    'حاول مره أخري',
                                                    style: kTextStyle15,
                                                  )));
                                            }
                                          },
                                          builder: (context, state) {
                                            if (state is SendContactUsLoadingState) {
                                              return const AppLoadingView();
                                            }
                                            return ElevatedButton(
                                                onPressed: () {
                                                  sendBloc.add(event);
                                                },
                                                child:const Text(
                                                  "إرسال",
                                                  style: kTextStyle15,
                                                ));
                                          }),



                                                        ],
                                                      ),
                                ),
                              ),
                            ),
                                             ] ),
                        ),
                        CardContactUs(location: state.list.data.location,
                        phone: state.list.data.phone ?? '',email: state.list.data.email,),
                      ]),
                )

            );
          }
          return const SizedBox();
        });
  }
}

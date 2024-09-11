import 'package:cached_network_image/cached_network_image.dart';
import 'package:driver/features/helper_widgets/app_loading.dart';
import 'package:driver/features/main/data/homePageBloc/home_page_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_it/get_it.dart';
import '../../../../core/navigator_helper.dart';
import '../widgets/customHomeAppbar.dart';
import '../widgets/customize_order_item.dart';
import '../order_details/view.dart';
class HomeView extends StatefulWidget {
   const HomeView({super.key,  });

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
final bloc = GetIt.I<HomePageBloc>()..add(HomePageEvent());

  @override
  void dispose() {
  bloc.close();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar:const  CustomAppBarHome(),
    body:
    // model.isEmpty ?const Center(child: Text("NO ORDERS"),):
   BlocBuilder<HomePageBloc,HomePageStates>(
     bloc: bloc,
     buildWhen: (previous, current) =>
     current is HomePageSuccess||current is HomePageLoading|| current is HomePageFailure,
     builder:(context, state) {
       if(state is HomePageLoading){
         return const AppLoadingView();
       }else if (state is HomePageFailure){
         return const SizedBox();

       }

       else if(state is HomePageSuccess){
         if(state.model.isEmpty){
             return Padding(
               padding: const EdgeInsets.all(8.0),

                 child: Center (child: ClipRRect(
                   borderRadius: BorderRadius.circular(22),
                   child:Image.network(
                       height: MediaQuery.of(context).size.height,
                       width: MediaQuery.of(context).size.width,
                       "https://img.freepik.com/free-vector/search-concept-yellow-folder-magnifier-icons-hand-drawn-cartoon-art-illustration_56104-891.jpg?w=826&t=st=1725578928~exp=1725579528~hmac=a8abba76325d0c4c512cb2a8327669367982bb72c4b39e2c95d0189b32972037"),
                     ),
               ),
             );}
    return ListView.separated(
         separatorBuilder: (context, index) => const Divider(thickness: 0.15,),
         shrinkWrap: true,
         physics: const NeverScrollableScrollPhysics(),
         itemBuilder:(context, index) =>GestureDetector(
           onTap: (){
             navigateTo(
                 OrderDetailsView(type: "الرئيسية",id: state.model[index].id,
                   location: state.model[index].address.location ,
                   clientName: state.model[index].clientName,
                   date: DateTime.parse("${state.model[index].date}"),
                   imageClient: state.model[index].clientImage,
                   price: state.model[index].totalPrice.toString(),
                   statusNumber:state.model[index].status,
                   addressDesc: state.model[index].address.description.toString(),
                   addressType:state.model[index].address.type.toString(),
                   deliveryPrice:state.model[index].deliveryPrice.toString() ,
                   orderPrice:state.model[index].orderPrice.toString() ,
                   payType:state.model[index].payType ,
                   totalPrice:state.model[index].totalPrice.toString() ,




                 ));
           },
           child:
             ItemBuilderForOrder(
               location: state.model[index].address.location ,
               clientName: state.model[index].clientName,
               date: DateTime.parse("${state.model[index].date}"),
               imageClient: state.model[index].clientImage,
               price: state.model[index].totalPrice.toString(),
               orderNumber:state.model[index].id,
               statusOrder:state.model[index].status,

             ),),
         itemCount: state.model.length,
         padding:  EdgeInsets.symmetric(
           horizontal: 12.w,
         ),

       );}return const SizedBox();
     },
   )
      ,
    );
  }
}

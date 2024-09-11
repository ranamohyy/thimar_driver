
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_faq/flutter_faq.dart';
import 'package:get_it/get_it.dart';

import '../../../helper_widgets/constans.dart';
import '../../../../core/custom_error_widget.dart';
import '../../../helper_widgets/app_image.dart';
import '../../../helper_widgets/app_loading.dart';
import '../../data/faqs/bloc.dart';
class BodyFaqs extends StatefulWidget {
  const BodyFaqs({super.key});

  @override
  State<BodyFaqs> createState() => _BodyFaqsState();
}

class _BodyFaqsState extends State<BodyFaqs> {
  final bloc = GetIt.I<FaqsBloc>()..add(LoadFaqsEvent());

  @override
  Widget build(BuildContext context) {
    return  BlocBuilder(
        bloc: bloc,
        builder: (context, state) {
          if (state is FaqLoadingState) {
            return const AppLoadingView();

          }else if (state is FaqSuccessState){
            return Padding(
              padding: const EdgeInsets.only(top:7,right: 2),
              child: SizedBox(
                height: 300,
                width: MediaQuery.of(context).size.width,
                child: ListView.builder(
                    itemCount: state.list.length,
                    itemBuilder:(context, index) {
                      return FAQ(
                        showDivider: false,

                        expandedIcon: const Icon(Icons.minimize,color: kPrimaryColor,),
                        collapsedIcon: const AppImage(url: "questions.png",height: 30,width: 30,),
                        queDecoration:const BoxDecoration(
                          color: Colors.transparent,
                        borderRadius: BorderRadius.all(Radius.circular(12))
                        ),
                        ansDecoration:const BoxDecoration(
                            color: Colors.transparent,
                            borderRadius: BorderRadius.all(Radius.circular(12))

                        ),
                        question:state.list[index].question ,
                        answer:state.list[index].answer ,
                        ansStyle:kTextStyle15 ,
                        queStyle: kTextStyle17,
                        separator: const SizedBox(),
                        ansPadding:const  EdgeInsets.only(top: 6,right: 4),
                        isExpanded: true,


                      );
                    }),
              ),
            );
          }else if (state is FaqFailedState){
            return CustomErrorWidget(errMessage:state.errMessage);
          }return const SizedBox();
        }

    );
  }
}

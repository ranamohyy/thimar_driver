import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

import '../../../helper_widgets/constans.dart';
import '../../../helper_widgets/app_loading.dart';
import '../widgets/custom_profile_appBar.dart';
import '../../data/suggestions/bloc.dart';

class SuggestionsView extends StatefulWidget {
  const SuggestionsView({super.key});

  @override
  State<SuggestionsView> createState() => _SuggestionsViewState();
}

class _SuggestionsViewState extends State<SuggestionsView> {
  final suggestion = GetIt.I<SuggestionsBloc>();
  final event = SuggestionsEvent();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const CustomAppBar(
          text: "الأقتراحات والشكاوي",
        ),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  TextFormField(
                      controller: event.nameController,
                      decoration: InputDecoration(
                          hintText: "الإسم",
                          hintStyle: kTextStyle15light,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                            borderSide:
                                const BorderSide(color: kBorderColorField),
                          ))),
                  const SizedBox(
                    height: 16,
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
                    height: 16,
                  ),
                  TextFormField(
                      controller: event.contentController,
                      decoration: InputDecoration(
                          hintText: "الموضوع",
                          hintStyle: kTextStyle15light,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                            borderSide: const BorderSide(
                              color: kBorderColorField,
                            ),
                          ))),
                  const SizedBox(
                    height: 30,
                  ),
                  BlocConsumer<SuggestionsBloc, SuggestionsStates>(
                      bloc: suggestion,
                      listener: (context, state) {
                        if (state is SuggestionsSuccessState) {
                          ScaffoldMessenger.of(context)
                              .showSnackBar(const SnackBar(
                                  backgroundColor: kPrimaryColor,
                                  content: Center(
                                    child: Text(
                                      'تم الأرسال بنجاح',
                                      style: kTextStyle15,
                                    ),
                                  )));
                        }
                        if (state is SuggestionsFailureState) {
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
                        if (state is SuggestionsLoadingState) {
                          return const AppLoadingView();
                        }
                        return ElevatedButton(
                            onPressed: () {
                              suggestion.add(event);
                            },
                            child: const Text(
                              "إرسال",
                              style: kTextStyle15,
                            ));
                      }),
                ]),
          ),
        ));
  }
}

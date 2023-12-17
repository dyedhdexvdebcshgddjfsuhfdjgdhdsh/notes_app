import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:notes_app/add_notes_cubit/add_notes_cubit.dart';
import 'package:notes_app/add_notes_cubit/add_notes_state.dart';
import 'package:notes_app/views/widgets/add_notes_form.dart';

class AddNotesBottomSheet extends StatefulWidget {
  const AddNotesBottomSheet({Key? key}) : super(key: key);

  @override
  State<AddNotesBottomSheet> createState() => _AddNotesBottomSheetState();
}

class _AddNotesBottomSheetState extends State<AddNotesBottomSheet> {
  // bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: BlocConsumer<AddNoteCubit, MyState>(
        builder: (context, state) {
          return ModalProgressHUD(
              inAsyncCall: state is LoadingSatate ? true : false,
              child: AddNotesForm());
        },
        listener: (context, state) {
          // Add any necessary logic in the listener
          // if (state is LoadingSatate) {
          //   isLoading = true;
          // }
          if (state is SuccessState) {
            Navigator.pop(context);
          }
          if (state is FailureState) {
            debugPrint('Failure ${state.errorMessage}');
          }
        },
      ),
    );
  }
}

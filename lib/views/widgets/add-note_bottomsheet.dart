import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
          return AbsorbPointer(
            absorbing: state is AddNotesLoadingSatate ? true : false,
            child: Padding(
              padding: EdgeInsets.only(
                  left: 16,
                  right: 16,
                  bottom: MediaQuery.of(context).viewInsets.bottom),
              child: SingleChildScrollView(child: AddNotesForm()),
            ),
          );
        },
        listener: (context, state) {
          // Add any necessary logic in the listener
          // if (state is LoadingSatate) {
          //   isLoading = true;
          // }
          if (state is AddNotesSuccessState) {
            Navigator.pop(context);
          }
          if (state is AddNotesFailureState) {
            print('Failure ${state.errorMessage}');
          }
        },
      ),
    );
  }
}

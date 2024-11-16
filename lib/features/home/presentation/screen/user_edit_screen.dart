import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:redoqdemo/features/home/data/data_sources/local/user_detail_data_source.dart';
import 'package:redoqdemo/features/home/presentation/bloc/user_detail_bloc.dart';
import 'package:redoqdemo/features/home/presentation/bloc/user_detail_event.dart';
import 'package:redoqdemo/injection_container.dart';

class UserEditScreen extends StatefulWidget {
  const UserEditScreen(
      {super.key,
      required this.type,
      this.age = '',
      this.id = '',
      this.name = ''});
  final String id;
  final String name;
  final String age;
  final UpdateType type;

  @override
  State<UserEditScreen> createState() => _UserEditScreenState();
}

class _UserEditScreenState extends State<UserEditScreen> {
  String name = '';
  String age = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: const Text("Update"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Name",
              style: TextStyle(color: Colors.black, fontSize: 16),
            ),
            const SizedBox(
              height: 5,
            ),
            TextFormField(
              initialValue: widget.name,
              onChanged: (value) {
                setState(() {
                  name = value;
                });
              },
              onFieldSubmitted: (value) {
                setState(() {
                  name = value;
                });
              },
              decoration: const InputDecoration(
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                      color:
                          Colors.grey), // Gray border color for enabled state
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                      color: Colors.grey), // Gray border color when focused
                ),
                disabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                      color: Colors.grey), // Gray border color when disabled
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            const Text(
              "Age",
              style: TextStyle(color: Colors.black, fontSize: 16),
            ),
            const SizedBox(
              height: 5,
            ),
            TextFormField(
              initialValue: widget.age,
              onChanged: (value) {
                setState(() {
                  age = value;
                });
              },
              onFieldSubmitted: (value) {
                setState(() {
                  age = value;
                });
              },
              decoration: const InputDecoration(
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                      color:
                          Colors.grey), // Gray border color for enabled state
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                      color: Colors.grey), // Gray border color when focused
                ),
                disabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                      color: Colors.grey), // Gray border color when disabled
                ),
              ),
            ),
            const Spacer(),
            SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.red,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8))),
                    onPressed: () async {
                      // i have direted call this function if you want to write usecase then use can create or add in repository
                      getIt<UserDetailLocalDataSource>().updateById(
                          id: widget.id,
                          type: widget.type,
                          fullName: name.isEmpty ? widget.name : name,
                          age: age.isEmpty
                              ? int.parse(widget.age)
                              : int.parse(age));
                      context.read<UserDetailBloc>().add(FetchUserDetails());
                      Navigator.pop(context);
                    },
                    child: const Text(
                      "Submit",
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: Colors.black),
                    ))),
            const SizedBox(
              height: 15,
            ),
          ],
        ),
      ),
    );
  }
}

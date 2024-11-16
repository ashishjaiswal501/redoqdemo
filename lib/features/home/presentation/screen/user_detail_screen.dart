import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:redoqdemo/features/home/data/data_sources/local/user_detail_data_source.dart';
import 'package:redoqdemo/features/home/domain/entity/user_deatils_entity.dart';

import 'package:redoqdemo/features/home/presentation/bloc/user_detail_bloc.dart';
import 'package:redoqdemo/features/home/presentation/bloc/user_detail_state.dart';
import 'package:redoqdemo/features/home/presentation/screen/user_edit_screen.dart';

class UserDetailScreen extends StatefulWidget {
  const UserDetailScreen({super.key});

  @override
  State<UserDetailScreen> createState() => _UserDetailScreenState();
}

class _UserDetailScreenState extends State<UserDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: ListView(
        children: [
          BlocBuilder<UserDetailBloc, UserDetailState>(
              builder: (context, state) {
            if (state is UserDetailLoadingState) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (state is UserDetailLoadedState) {
              return Column(
                children: state.userDetailEntity.participants!
                    .map((participant) => Container(
                          margin: const EdgeInsets.symmetric(
                              vertical: 10.0, horizontal: 10),
                          decoration: BoxDecoration(
                            border: Border.all(
                                color: const Color.fromARGB(255, 203, 203, 203),
                                width: 1.5),
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          child: Theme(
                            data: ThemeData()
                                .copyWith(dividerColor: Colors.transparent),
                            child: ExpansionTile(
                                key: ValueKey(participant.participantId),
                                initiallyExpanded: participant.isExpanded!,
                                title: Text(participant.fullName!),
                                subtitle: Text('Age: ${participant.age!}'),
                                trailing: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    IconButton(
                                      icon: const Icon(Icons.edit),
                                      onPressed: () {
                                        // Handle edit action
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    UserEditScreen(
                                                      type: UpdateType
                                                          .participant,
                                                      name:
                                                          participant.fullName!,
                                                      id: participant
                                                          .participantId!,
                                                      age: participant.age!
                                                          .toString(),
                                                    )));
                                      },
                                    ),
                                    Icon(participant.isExpanded != null &&
                                            participant.isExpanded!
                                        ? Icons.expand_less
                                        : Icons.expand_more),
                                  ],
                                ),
                                onExpansionChanged: (isExpanded) {
                                  // Ensure the state matches the actual expansion state

                                  setState(() {
                                    participant.isExpanded = isExpanded;
                                  });
                                },
                                children: _buildAuditions(
                                    participant.auditions ?? [])),
                          ),
                        ))
                    .toList(),
              );
            } else {
              return const Center(child: Text("Somthing went wrong"));
            }
          }),
        ],
      ),
    );
  }

  List<Widget> _buildAuditions(List<AuditionEntity> auditions) {
    return auditions.map((audition) {
      return Container(
        margin: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 10),
        decoration: BoxDecoration(
          border: Border.all(
              color: const Color.fromARGB(255, 203, 203, 203), width: 1.5),
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: Theme(
          data: ThemeData().copyWith(dividerColor: Colors.transparent),
          child: ExpansionTile(
              key: ValueKey(audition.auditionId),
              initiallyExpanded: audition.isExpanded!,
              title: Text(audition.auditionName!),
              subtitle: Text('Age: ${audition.auditionAge!}'),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  IconButton(
                    icon: const Icon(Icons.edit),
                    onPressed: () {
                      // Handle edit action
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => UserEditScreen(
                                  type: UpdateType.audition,
                                  name: audition.auditionName!,
                                  id: audition.auditionId!,
                                  age: audition.auditionAge!.toString(),
                                )),
                      );
                    },
                  ),
                  Icon(audition.isExpanded != null && audition.isExpanded!
                      ? Icons.expand_less
                      : Icons.expand_more),
                ],
              ),
              onExpansionChanged: (isExpanded) {
                // Ensure the state matches the actual expansion state

                setState(() {
                  audition.isExpanded = isExpanded;
                });
              },
              children: _buildSubAuditions(audition.subAuditions ?? [])),
        ),
      );
    }).toList();
  }

  List<Widget> _buildSubAuditions(List<SubAuditionEntity> subAuditions) {
    return subAuditions.map((subAudition) {
      return Container(
        margin: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 10),
        decoration: BoxDecoration(
          border: Border.all(
              color: const Color.fromARGB(255, 203, 203, 203), width: 1.5),
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: Theme(
          data: ThemeData().copyWith(dividerColor: Colors.transparent),
          child: ExpansionTile(
            key: ValueKey(subAudition.subAuditionId),
            initiallyExpanded: subAudition.isExpanded!,
            title: Text(subAudition.subAuditionName!),
            subtitle: Text('Age: ${subAudition.subAuditionAge}'),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                IconButton(
                  icon: const Icon(Icons.edit),
                  onPressed: () {
                    // Handle edit action
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => UserEditScreen(
                                  type: UpdateType.subAudition,
                                  name: subAudition.subAuditionName!,
                                  id: subAudition.subAuditionId!,
                                  age: subAudition.subAuditionAge!.toString(),
                                )));
                  },
                ),
                Icon(subAudition.isExpanded != null && subAudition.isExpanded!
                    ? Icons.expand_less
                    : Icons.expand_more),
              ],
            ),
            onExpansionChanged: (isExpanded) {
              setState(() {
                subAudition.isExpanded = isExpanded;
              });
            },
            children: _buildSubSubAuditions(subAudition.subSubAuditions ?? []),
          ),
        ),
      );
    }).toList();
  }

  List<Widget> _buildSubSubAuditions(
      List<SubSubAuditionEntity> subSubAuditions) {
    return subSubAuditions.map((subSubAudition) {
      return Container(
        margin: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 10),
        decoration: BoxDecoration(
          border: Border.all(
              color: const Color.fromARGB(255, 203, 203, 203), width: 1.5),
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: Theme(
          data: ThemeData().copyWith(dividerColor: Colors.transparent),
          child: ExpansionTile(
            key: ValueKey(subSubAudition.subSubAuditionId),
            initiallyExpanded: subSubAudition.isExpanded!,
            title: Text(subSubAudition.subSubAuditionName!),
            subtitle: Text('Age: ${subSubAudition.subSubAuditionAge}'),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                IconButton(
                  icon: const Icon(Icons.edit),
                  onPressed: () {
                    // Handle edit action
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => UserEditScreen(
                                  type: UpdateType.subSubAudition,
                                  name: subSubAudition.subSubAuditionName!,
                                  id: subSubAudition.subSubAuditionId!,
                                  age: subSubAudition.subSubAuditionAge!
                                      .toString(),
                                )));
                  },
                ),
                Icon(subSubAudition.isExpanded != null &&
                        subSubAudition.isExpanded!
                    ? Icons.expand_less
                    : Icons.expand_more),
              ],
            ),
            onExpansionChanged: (isExpanded) {
              setState(() {
                subSubAudition.isExpanded = isExpanded;
              });
            },
            children: [],
          ),
        ),
      );
    }).toList();
  }
}

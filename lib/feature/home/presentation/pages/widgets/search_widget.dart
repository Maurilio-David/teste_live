import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:teste_live/feature/home/presentation/bloc/episode_cubit.dart';

class SearchWidget extends StatelessWidget {
  const SearchWidget({super.key, required this.controller});

  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Flexible(
          child: TextField(
            decoration: InputDecoration(
              filled: true,
              fillColor: Colors.white,
              isDense: true,
              hintText: 'Pesquise aqui...',
              hintStyle: TextStyle(color: Colors.grey.shade400, fontSize: 14),
              prefixIcon: Icon(Icons.search, color: Colors.orange),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(60),
                borderSide: const BorderSide(width: 0, style: BorderStyle.none),
              ),
            ),
            controller: controller,
            keyboardType: TextInputType.number,
          ),
        ),
        Container(
          margin: EdgeInsets.only(left: 8),
          decoration: BoxDecoration(
            color: Colors.black,
            borderRadius: BorderRadius.all(Radius.circular(25)),
          ),
          child: IconButton(
            onPressed: () {
              final id = int.tryParse(controller.text);

              if (id != null) {
                context.read<EpisodeCubit>().getEpisode(id);
              }
            },
            icon: Icon(Icons.send, color: Colors.orange),
          ),
        ),
      ],
    );
  }
}

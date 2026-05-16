import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:teste_live/feature/episodes/presentation/bloc/history_cubit.dart';
import 'package:teste_live/feature/episodes/presentation/bloc/history_state.dart';
import 'package:teste_live/feature/episodes/presentation/pages/widgets/error_page_widget.dart';
import 'package:teste_live/feature/episodes/presentation/pages/widgets/history_success_page.dart';
import 'package:teste_live/feature/episodes/presentation/pages/widgets/loading_page_widget.dart';

class HistoryPage extends StatefulWidget {
  const HistoryPage({super.key});

  @override
  State<HistoryPage> createState() => _HistoryPageState();
}

class _HistoryPageState extends State<HistoryPage> {
  @override
  void initState() {
    super.initState();

    context.read<HistoryCubit>().getHistory();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.orange,
      appBar: AppBar(
        backgroundColor: Colors.black,
        iconTheme: IconThemeData(color: Colors.orange),
        title: const Text(
          'Histórico',
          style: TextStyle(
            color: Colors.orange,
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: BlocBuilder<HistoryCubit, HistoryState>(
        builder: (_, state) {
          if (state is HistoryLoading) {
            return PageLoadingWidget();
          }

          if (state is HistoryError) {
            return PageErrorWidget(message: state.message);
          }

          if (state is HistorySuccess) {
            return HistorySuccessPage(episodes: state.episodes);
          }

          return const SizedBox();
        },
      ),
    );
  }
}

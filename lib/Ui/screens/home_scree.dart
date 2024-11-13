import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:keywa_test_application/Ui/widgets/crypto_list.dart';
import 'package:keywa_test_application/bloc/home_bloc.dart';
import 'package:keywa_test_application/bloc/home_event.dart';
import 'package:keywa_test_application/bloc/home_state.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<HomeBloc, HomeState>(
        builder: (context, state) {
          return RefreshIndicator(
            onRefresh: () async {
              context.read<HomeBloc>().add(
                    HomeFetchDateEvent(),
                  );
            },
            child: _getHomeScreenContent(state),
          );
        },
      ),
    );
  }
}

Widget _getHomeScreenContent(HomeState state) {
  if (state is HomeLoading) {
    return const Center(child: RefreshProgressIndicator());
  } else if (state is HomeFetchDataState) {
    return state.cryptoList!.fold(
      (errorMessage) {
        return Center(child: Text(errorMessage));
      },
      (cryptoList) {
        return CryptoListTile(
          mainCryptoList: cryptoList,
        );
      },
    );
  } else {
    return const Text('');
  }
}

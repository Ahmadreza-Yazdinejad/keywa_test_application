import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:keywa_test_application/Ui/widgets/crypto_list.dart';
import 'package:keywa_test_application/Ui/widgets/wallet_options.dart';
import 'package:keywa_test_application/bloc/home_bloc.dart';
import 'package:keywa_test_application/bloc/home_event.dart';
import 'package:keywa_test_application/bloc/home_state.dart';
import 'package:keywa_test_application/constant/colors.dart';
import 'package:keywa_test_application/data/model/crypto.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: CustomColor.black,
        body: BlocBuilder<HomeBloc, HomeState>(
          builder: (context, state) {
            return RefreshIndicator(
              onRefresh: () async {
                context.read<HomeBloc>().add(HomeFetchDateEvent());
              },
              child: _buildContent(state),
            );
          },
        ),
      ),
    );
  }

  Widget _buildContent(HomeState state) {
    if (state is HomeLoading) {
      return const Center(child: RefreshProgressIndicator());
    }
    if (state is HomeFetchDataState) {
      return state.cryptoList!.fold(
        (errorMessage) => ErrorMessage(error: errorMessage),
        (cryptoList) => MainContent(cryptoList: cryptoList),
      );
    }
    return const Center(child: Text('مشکلی پیش آمده است.'));
  }
}

class ErrorMessage extends StatelessWidget {
  final String error;

  const ErrorMessage({super.key, required this.error});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        error,
        style: Theme.of(context).textTheme.bodyMedium,
      ),
    );
  }
}

class MainContent extends StatelessWidget {
  final List<Crypto> cryptoList;

  const MainContent({super.key, required this.cryptoList});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          const SizedBox(height: 50),
          const HeaderImage(),
          const SizedBox(height: 40),
          const WalletOptions(),
          const SizedBox(height: 40),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30.0),
            child: Text(
              'رمز ارز های برتر',
              textAlign: TextAlign.right,
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 28.0),
            child: Divider(),
          ),
          Expanded(child: CryptoListTile(mainCryptoList: cryptoList)),
        ],
      ),
    );
  }
}

class HeaderImage extends StatelessWidget {
  const HeaderImage({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        height: 280,
        child: Image.asset(
          'assets/images/crypto.png',
          fit: BoxFit.contain,
        ),
      ),
    );
  }
}

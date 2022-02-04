import 'package:flutter/material.dart';
import 'package:home_services/providers/service%20mangers_provider.dart';
import 'package:home_services/widgets/btn.dart';
import 'package:home_services/widgets/card_provider_managers.dart';
import 'package:provider/src/provider.dart';

class ProviderManagersView extends StatelessWidget {
  const ProviderManagersView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _serviceMangersProvider = context.watch<ServiceMangersProvider>();
    // for testing only ....
    _serviceMangersProvider.getCategories();
    //
    if (_serviceMangersProvider.isLoading) {
      return const Center(child: CircularProgressIndicator());
    }

    return Scaffold(
      body: Column(
        children: [
          _buildRatingList(_serviceMangersProvider),
          Expanded(
            child: ListView.builder(
              itemCount: _serviceMangersProvider.filterServiceManagers.length,
              itemBuilder: (context, index) {
                //
                return CardProviderManagers(
                  serviceManagersModel:
                      _serviceMangersProvider.filterServiceManagers[index],
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  _buildRatingList(ServiceMangersProvider service) {
    return ListView(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      children: List.generate(
        2,
        (index) => Btn(
          child: const Text('next'),
          onPressed: () {
            service.onFiltter('c');
          },
        ),
      ),
    );
  }
}

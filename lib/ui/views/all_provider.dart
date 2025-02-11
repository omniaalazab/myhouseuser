import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:housemanuser/controller/provider/provider_cubit.dart';
import 'package:housemanuser/controller/provider/provider_state.dart';
import 'package:housemanuser/generated/l10n.dart';
import 'package:housemanuser/helper/color_helper.dart';
import 'package:housemanuser/helper/text_style_helper.dart';
import 'package:housemanuser/ui/views/provider_details.dart';

class AllProvider extends StatelessWidget {
  const AllProvider({super.key});

  @override
  Widget build(BuildContext context) {
    Locale currentLocale = Localizations.localeOf(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(S.of(context).Category,
            style: TextStyleHelper.textStylefontSize16
                .copyWith(color: Colors.white)),
        backgroundColor: ColorHelper.purple,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back_ios_new_rounded,
            color: Colors.white,
          ),
        ),
      ),
      body: Expanded(
        child: BlocBuilder<ProviderCubit, ProviderStatus>(
          builder: (context, state) {
            if (state is ProviderLoading) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is Providerloaded) {
              final providers = (state).providerList;
              return GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    // childAspectRatio: 1.0,
                    childAspectRatio: 2.5 / 3,
                    mainAxisSpacing: 5,
                    crossAxisSpacing: 5,
                  ),
                  itemCount: providers.length,
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (_) => ProviderDetails(
                                    provider: providers[index])));
                      },
                      child: Column(
                        children: [
                          const SizedBox(
                            height: 10,
                          ),
                          ClipRRect(
                            borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(10),
                                topRight: Radius.circular(10)),
                            child: Image.network(
                              providers[index].imagePath,
                              height: 100,
                              width: double.infinity,
                              fit: BoxFit.contain,
                            ),
                          ),
                          Text(
                            (currentLocale.languageCode == 'ar')
                                ? providers[index].serviceNameAr
                                : providers[index].serviceNameEn,
                          )
                        ],
                      ),
                    );
                  });
            } else if (state is ProviderFailure) {
              return Center(child: Text(state.errorMessage));
            } else {
              return Container();
            }
          },
        ),
      ),
    );
  }
}

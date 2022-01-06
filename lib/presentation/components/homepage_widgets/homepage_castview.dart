import 'package:demoproject/modals/homescreen_models/characters_model.dart';
import 'package:demoproject/provider_stores/homescreen_controller.dart';
import 'package:demoproject/utils/global.dart';
import 'package:demoproject/utils/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePageCastView extends StatelessWidget {
  const HomePageCastView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Cast & Crew",
            style: TextStyles.smallBoldColor,
          ),
          const SizedBox(
            height: 10,
          ),
          Consumer<HomeScreenProvider>(builder: (context, data, _) {
            CharactersModelList charactersModel = data.charactersModelList;
            return ColorFiltered(
              colorFilter: data.showDetails
                  ? ColorFilter.mode(Colors.grey.shade500, BlendMode.modulate)
                  : const ColorFilter.mode(
                      Colors.transparent, BlendMode.softLight),
              child: GridView.builder(
                  itemCount: charactersModel.characterData.length,
                  padding: const EdgeInsets.all(0),
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: 5,
                      crossAxisSpacing: 5,
                      childAspectRatio: 2.5 / 4),
                  itemBuilder: (context, index) {
                    var data = charactersModel.characterData[index];

                    return GestureDetector(
                      onLongPress: () {
                        Provider.of<HomeScreenProvider>(context, listen: false)
                            .onPressStart(data);
                      },
                      onLongPressEnd: (data) {
                        Provider.of<HomeScreenProvider>(context, listen: false)
                            .onPressEnd();
                      },
                      child: Card(
                          shape: const RoundedRectangleBorder(
                              borderRadius: BorderRadius.only(
                                  topRight: Radius.circular(10),
                                  bottomLeft: Radius.circular(10)),
                              side: BorderSide(color: Colors.white60)),
                          child: ClipRRect(
                            borderRadius: const BorderRadius.only(
                                topRight: Radius.circular(10),
                                bottomLeft: Radius.circular(10)),
                            child: getNetworkImage(data.img),
                          )),
                    );
                  }),
            );
          })
        ],
      ),
    );
  }
}

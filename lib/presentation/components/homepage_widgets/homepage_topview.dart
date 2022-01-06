import 'package:demoproject/utils/global.dart';
import 'package:demoproject/utils/styles.dart';
import 'package:demoproject/utils/text_styles.dart';
import 'package:flutter/material.dart';

class HomePageTopView extends StatelessWidget {
  const HomePageTopView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: MediaQuery.of(context).size.width * 1,
          height: MediaQuery.of(context).size.height * 0.75,
          foregroundDecoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Styles.backgroundColor,
                Colors.transparent,
                Colors.transparent,
                Styles.backgroundColor
              ],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
          child: Image.asset(
            Styles.seriesImage,
            fit: BoxFit.cover,
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Breaking Bad",
                style: TextStyles.headingBoldStyle,
              ),
              const SizedBox(
                height: 5,
              ),
              Text(
                "A high school chemistry teacher diagnosed with inoperable lung cancer turns to manufacturing and selling methamphetamine in order to secure his family's future.",
                style: TextStyles.titleColor,
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Flexible(
                    flex: 1,
                    child: Wrap(
                      spacing: 10,
                      runSpacing: 10,
                      children: [
                        _getGenreWidget("Crime"),
                        _getGenreWidget("Drama"),
                        _getGenreWidget("Thriller"),
                      ],
                    ),
                  ),
                  MaterialButton(
                    color: Styles.buttonColor,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    padding: const EdgeInsets.all(20),
                    onPressed: () =>
                        openLink("https://www.netflix.com/title/70143836"),
                    child: Row(
                      children: [
                        const Icon(
                          Icons.play_circle_fill_rounded,
                          color: Styles.whiteColor,
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        Text(
                          "Watch on netflix",
                          style: TextStyles.titleColor,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
            ],
          ),
        ),
      ],
    );
  }

  _getGenreWidget(String genre) {
    return Container(
        padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: Styles.whiteColor),
        ),
        child: Text(
          genre,
          style: TextStyles.titleColor,
        ));
  }
}

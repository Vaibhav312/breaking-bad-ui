import 'package:demoproject/modals/homescreen_models/characters_model.dart';
import 'package:demoproject/utils/global.dart';
import 'package:demoproject/utils/styles.dart';
import 'package:demoproject/utils/text_styles.dart';
import 'package:flutter/material.dart';

class CustomAlert extends StatefulWidget {
  CharactersModel? data;

  CustomAlert(this.data, {Key? key}) : super(key: key);

  @override
  _CustomAlertState createState() => _CustomAlertState();
}

class _CustomAlertState extends State<CustomAlert>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation<double> scaleAnimation;

  @override
  void initState() {
    super.initState();

    controller =
        AnimationController(vsync: this, duration: const Duration(milliseconds: 450));
    scaleAnimation =
        CurvedAnimation(parent: controller, curve: Curves.decelerate);
    controller.addListener(() {
      setState(() {});
    });

    controller.forward();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
        child: ScaleTransition(
      scale: scaleAnimation,
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Material(
          borderRadius: BorderRadius.circular(20),
          color: Styles.buttonColor,
          elevation: 5,

          child: Padding(
            padding: const EdgeInsets.all(10),
            child: SizedBox(
              width: 250,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  SizedBox(
                      height: 80,
                      width: 80,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(50),
                        child: getNetworkImage(widget.data!.img),
                      )),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(widget.data!.name,
                      style: TextStyles.headingBoldStyle,textAlign: TextAlign.center,),
                  Text("As ${widget.data!.nickname}",
                      style: TextStyles.subTitleTextStyle,textAlign: TextAlign.center),
                  const SizedBox(
                    height: 10,
                  ),
                  Align(
                    alignment: Alignment.centerRight,
                    child: Text(widget.data!.status,
                        style: TextStyles.smallSubTextText),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    ));
  }
}

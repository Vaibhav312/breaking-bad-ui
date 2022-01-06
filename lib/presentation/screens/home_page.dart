import 'package:demoproject/presentation/components/custom_alert.dart';
import 'package:demoproject/presentation/components/homepage_widgets/homepage_castview.dart';
import 'package:demoproject/presentation/components/homepage_widgets/homepage_topview.dart';
import 'package:demoproject/presentation/components/loading_widgets/custom_loader.dart';
import 'package:demoproject/provider_stores/homescreen_controller.dart';
import 'package:demoproject/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Provider.of<HomeScreenProvider>(context, listen: false).getAPIData(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          color: Styles.backgroundColor,
          child: Consumer<HomeScreenProvider>(
              builder: (context, data, _) =>
                  data.isLoading ? const CustomLoader() : _getScreenView(data)),
        ),
      ),
    );
  }

  _getScreenView(HomeScreenProvider data) {
    return Stack(
      children: [
        ListView(
          shrinkWrap: true,
          children: const [HomePageTopView(), HomePageCastView()],
        ),
        data.showDetails ? CustomAlert(data.charactersModel) : const SizedBox()
      ],
    );
  }
}

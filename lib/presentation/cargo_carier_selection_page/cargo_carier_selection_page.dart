import 'package:cdt_client/presentation/cargo_carier_selection_page/widgets/cargo_carier_selection_body.dart';
import 'package:flutter/material.dart';
import 'package:hmi_core/hmi_core_translate.dart';
///
/// Page for cargo carier selection page params of the crane.
class CargoCarierSelectionPage extends StatefulWidget {
  /// 
  /// Page for cargo carier selection page params of the crane.
  const CargoCarierSelectionPage({super.key});
  //
  @override
  State<CargoCarierSelectionPage> createState() => _CargoCarierSelectionPage();
}
//
class _CargoCarierSelectionPage extends State<CargoCarierSelectionPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Initialization'.loc, style: Theme.of(context).textTheme.headlineLarge),
        automaticallyImplyLeading: false,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: CargoCarierSelectionBody(),
    );
  }
}
  
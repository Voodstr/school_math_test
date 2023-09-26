import 'package:flutter/material.dart';
import 'package:mathtest/data.dart';

class SettingsWidget extends StatelessWidget {
  const SettingsWidget({super.key, required this.settingsdData});

  final SettingsData settingsdData;

  @override
  Widget build(BuildContext context) {
    final TextEditingController durationController =
        TextEditingController(text: settingsdData.duration.toString());
    final TextEditingController questionsController =
        TextEditingController(text: settingsdData.questions.toString());
    final TextEditingController orderController =
        TextEditingController(text: settingsdData.order.toString());
    return  Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
           const Text("Настройки тестов",textScaleFactor: 3.0,),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Flexible(child: Text("Длительность теста:")),
              Flexible(
                  child: DropdownMenu<String>(
                controller: durationController,
                hintText: "в секундах",
                initialSelection: "30",
                onSelected: (value) =>
                    {settingsdData.duration = int.parse(value ?? "30")},
                dropdownMenuEntries: ["30", "90", "180", "300", "600"]
                    .map<DropdownMenuEntry<String>>((String value) {
                  return DropdownMenuEntry<String>(
                      value: value, label: "$value секунд");
                }).toList(),
              ))
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Flexible(child: Text("Количество примеров:")),
              Flexible(
                  child: DropdownMenu<String>(
                controller: questionsController,
                hintText: "количество",
                initialSelection: "5",
                onSelected: (value) =>
                    {settingsdData.questions = int.parse(value ?? "5")},
                dropdownMenuEntries: ["5", "10", "25", "50", "100"]
                    .map<DropdownMenuEntry<String>>((String value) {
                  return DropdownMenuEntry<String>(
                      value: value, label: "$value примеров");
                }).toList(),
              ))
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Flexible(child: Text("Порядок чисел:")),
              Flexible(
                  child: DropdownMenu<String>(
                controller: orderController,
                hintText: "количество",
                initialSelection: "1",
                onSelected: (value) =>
                    {settingsdData.order = int.parse(value ?? "1")},
                dropdownMenuEntries: ["1", "2", "3", "4", "5"]
                    .map<DropdownMenuEntry<String>>((String value) {
                  return DropdownMenuEntry<String>(
                      value: value, label: "$value порядок");
                }).toList(),
              ))
            ],
          ),
        ],
    );
  }
}
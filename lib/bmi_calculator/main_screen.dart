import 'package:bmi_calculator/bmi_calculator/provider.dart';
import 'package:bmi_calculator/bmi_calculator/result_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final _formKey = GlobalKey<FormState>();
  final _heightController = TextEditingController();
  final _weightController = TextEditingController();

  // 화면이 처음 시작될 때 실행되는 부분
 @override
  void initState() {
    super.initState();
    load();
  }

  // 화면 종료시 실행되는 부분
  // controller 사용시 메모리 효율을 위해 무조건 dispose 사용해야 함
  @override
  void dispose() {
    _heightController.dispose();
    _weightController.dispose();
    super.dispose();
  }

  // 입력값 저장
  Future save() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setDouble('height', double.parse(_heightController.text),);
    await prefs.setDouble('weight', double.parse(_weightController.text),);
  }

  // save에 저장된 값을 받아옴
  Future load() async {
    final prefs = await SharedPreferences.getInstance();
    final double? height = prefs.getDouble('height');
    final double? weight = prefs.getDouble('weight');

    if (height != null && weight != null) {
      _heightController.text = '$height';
      _weightController.text = '$weight';
    }
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ValueProvider(height: _heightController.text, weight: _weightController.text),
      child: Scaffold(
        appBar: AppBar(
          elevation: 2,
          shadowColor: Colors.black,
          title: const Text('비만도 계산기'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  TextFormField(
                    controller: _heightController,
                    decoration: const InputDecoration(
                        // textField의 경계에 선 그려줌
                        border: OutlineInputBorder(),
                        hintText: '키'),
                    keyboardType: TextInputType.number,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return '키를 입력하세요';
                      } else {
                        return null;
                      }
                    },
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  TextFormField(
                    controller: _weightController,
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(), hintText: '몸무게'),
                    keyboardType: TextInputType.number,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return '몸무게를 입력하세요';
                      } else {
                        return null;
                      }
                    },
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      // form에 올바른 값이 입력되지 않으면 다음 화면으로 넘어가지 않음
                      if (_formKey.currentState?.validate() == false) {
                        return;
                      }
                      save();  // Future - 오래걸림

                      Provider.of<ValueProvider>(context, listen: false)
                        ..setHeight(_heightController.text)
                        ..setWeight(_weightController.text);
      
                      // // 다음 화면으로 넘어감
                      // Navigator.push(
                      //   context,
                      //   MaterialPageRoute(
                      //     builder: (context) => ResultScreen(
                      //         height: double.parse(_heightController.text),
                      //         weight: double.parse(_weightController.text)),
                      //   ),
                      // );
                    },
                    child: const Text('결과'),
                  ),
                ],
              )),
        ),
      ),
    );
  }
}

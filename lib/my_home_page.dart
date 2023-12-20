import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int count = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('홈'),
      ),
      body: Center(
        child: Column(
          // Row 안의 값들을 정렬
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              color: Colors.red,
              width: 100,
              height: 100,
            ),
            const Text(
              'Counts',
              style: TextStyle(
                color: Colors.red,
                fontSize: 70,
              ),
            ),
            Text(
              '$count',
              style: TextStyle(
                color: Colors.red,
                fontSize: 70,
              ),
            ),
            ElevatedButton(
              onPressed: () {
                print('ElevetedButton');
              },
              child: Text('ElevatedButton'),
            ),
            TextButton(
              onPressed: () {},
              child: Text('TextButton'),
            ),
            OutlinedButton(
              onPressed: () {},
              child: Text('OutlinedButon'),
            ),
            TextField(
              decoration: const InputDecoration(
                labelText: '텍스트를 입력하세요',
                // border: OutlineInputBorder(),
              ),
              onChanged: (text) {
                // print(text);
              },
            ),
            Image.network(
                'https://images.ctfassets.net/4ivszygz9914/6b2ec486-01c5-43cc-b416-deea3983e82c/f6f28c7309686d9a6756dfbdaaac3ada/6c3a0e6a-0b5b-44b6-90bc-1074a7b7644e.jpeg?fm=webp',
                width: 100,
                height: 100,
                fit: BoxFit.cover,
            ),

          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // 화면 갱신
          setState(() {
            count++;
          });
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}

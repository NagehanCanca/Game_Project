import 'package:flutter/material.dart';

import '../home_screen/home_screen.dart';

class BackpackScreen extends StatefulWidget {
  @override
  _BackpackScreenState createState() => _BackpackScreenState();
}

class _BackpackScreenState extends State<BackpackScreen> {
  int money = 100; // Kullanıcının sahip olduğu para miktarı
  int maxMoney = 1000; // Kullanıcının maksimum para limiti
  int intelligence = 10; // Zeka özelliği
  int strength = 10; // Güç özelliği
  int energy = 10; // Enerji özelliği
  int agility = 10; // Çeviklik özelliği
  int upgradeCost = 40; // Her bir özellik yükseltme maliyeti

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => HomeScreen()));
        return false;
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Backpack'),
        ),
        body: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/icons/bground.jpg'),
              fit: BoxFit.cover,
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: ListView(
              children: <Widget>[
                buildAttributeCard('Zeka', intelligence, 'intelligence'),
                buildAttributeCard('Güç', strength, 'strength'),
                buildAttributeCard('Enerji', energy, 'energy'),
                buildAttributeCard('Çeviklik', agility, 'agility'),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget buildAttributeCard(String title, int attributeValue, String attributeName) {
    double sliderValue = attributeValue.toDouble();

    return Card(
      elevation: 4,
      margin: const EdgeInsets.all(8),
      color: Colors.transparent,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Text('$title: $attributeValue', style: const TextStyle(color: Colors.white)),
            Slider(
              value: sliderValue,
              min: 0,
              max: 100,
              onChanged: (value) {
                // Slider ile değeri güncelleme
                setState(() {
                  sliderValue = value;
                });
              },
              activeColor: Colors.black, // Slider'ın kaydırma rengi siyah
            ),
            ElevatedButton(
              onPressed: () {
                increaseAttribute(attributeName);
              },
              child: Text('Yükselt \$$upgradeCost'),
            ),
          ],
        ),
      ),
    );
  }

  // Özellikleri yükseltme işlemi
  void increaseAttribute(String attributeName) {
    if (money >= upgradeCost) {
      setState(() {
        money -= upgradeCost;
        if (attributeName == 'intelligence' && intelligence < 100) {
          intelligence += 10;
        } else if (attributeName == 'strength' && strength < 100) {
          strength += 10;
        } else if (attributeName == 'energy' && energy < 100) {
          energy += 10;
        } else if (attributeName == 'agility' && agility < 100) {
          agility += 10;
        }
      });
    } else {
      // Kullanıcının yetersiz para uyarısı
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text('Yetersiz Para'),
            content: const Text('Bu özelliği yükseltmek için yeterli paranız yok.'),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: const Text('Kapat'),
              ),
            ],
          );
        },
      );
    }
  }
}

void main() {
  runApp(MaterialApp(
    home: BackpackScreen(),
  ));
}

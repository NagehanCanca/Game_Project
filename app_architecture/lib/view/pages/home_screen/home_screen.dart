import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import '../account_screen/account_screen.dart';
import '../quest_screen/quest_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<Map<String, String>> imageList = [
    {
      "imagePath": "assets/images/club.jpg",
      "title": "Kulübe",
      "description": "Kaos dünyasına girin.",
      "questText":
          "Kulübe Karanlığı: Kapının eşikten içeri adım atar atmaz, karanlığın sizi sarıp sarmaladığını hissedersiniz. Bu kulübe, yıllardır unutulan korkuların ve gizemlerin sığınağıdır. Kapının ardındaki sessizlik, her adımınızla daha da yoğunlaşır. Karanlıkta, neler olduğunu kestirmek neredeyse imkansızdır. Kulübenin içi gizemlerle ve tehlikelerle dolu olabilir. Her tarafta sırlar ve gölgeler saklanıyor olabilir. El fenerinizin titrek ışığı, kulübenin köşelerine düşer ve korkularına ışık tutar, ancak her hareket, her nefes alışınızda daha da büyür. Kulübenin içinde hayatta kalmak için hem cesaretinizi hem de zekanızı kullanmanız gerekecek. Bilinmeyenin ardındaki gerçekleri ortaya çıkarmalı ve karanlıkla başa çıkmalısınız. Hazır mısınız? Bu karanlık kulübenin içine adım attığınızda, bilinmeyenin ve dehşetin dünyasına dalıyorsunuz. Her adımınızın ne getireceğini bilemezsiniz.",
    },
    {
      "imagePath": "assets/images/forest.jpg",
      "title": "Orman",
      "description": "Sınırlarınızı aşın",
      "questText":
          "Orman Macerası: Güneş batarken ormanın içine adım attın. Ormanın derinliklerine doğru ilerlerken ağaçların gölgesi üzerine düşerken, her adımınız bir gizemi çözmek için atılmış gibiydi. Gecenin sessizliği yavaşça sizi sararken, ormanın içinde gizlenen sırların ve korkuların farkına varacaksınız. Rüzgarın hışırtısı, ağaçların arasında sinsi bir gülümseme gibiydi. Her dalın arkasında ne olduğunu bilmemek, kalbinizin hızla çarpmasına neden oluyor. Ormanın içinde neyle karşılaşacağınızı bilmemek, sizi hem heyecanlandırıyor hem de korkutuyor. Ormanın içindeki gizemi çözmek ve karanlık sırları açığa çıkarmak için cesaretiniz ve zekanızı kullanmanız gerekecek. Tehlikelerle dolu bu yolculukta hayatta kalmak için dikkatli olmalısınız. Hazır mısınız? Ormanın derinliklerine doğru atılan bu adımda, bilinmeyene doğru bir yolculuğa çıkıyorsunuz. İyi şanslar!",
    },
    {
      "imagePath": "assets/images/cave.png",
      "title": "Mağara",
      "description": "Olmak ya da olmamak, bütün mesele bu.",
      "questText":
          "Mağara Korkusu: Mağaranın girişine vardığınızda, derin karanlığı ve yankılanan sessizliği hissedersiniz. Bu mağara, gizemlerle dolu bir dünyanın kapısını aralar. İleriye doğru adım attıkça, ayaklarınızın altındaki taşlarla dolu yolu izlersiniz, ancak mağaranın derinliklerinde neler olduğunu asla bilemezsiniz. Bu mağara, kaybolmuş zamanın izlerini taşır ve geçmişin sırlarını saklar. Fenerinizin ışığı, duvarlardaki eski yazılara ve resimlere düşer, ancak karanlık daha fazlasını saklar. Her an, her köşede beklenmedik bir tehlike olabilir. Fener ışığının titreyen parıltısı, mağaranın labirent benzeri yollarını aydınlatır, ancak bu yolculuk kolay olmayacak. Karanlıkta, zekanızı kullanarak ve gözlerinizle her köşeyi gözlemleyerek ilerlemeniz gerekecek. Bu mağara, cesaret ve bilgeliği test eden bir serüven sunar. Bilinmeyenin sırlarını çözmek ve korkuları yenebilmek için hazır olmalısınız. Are you ready? Bu mağaranın içine adım attığınızda, gizem ve tehlikenin dünyasına dalacaksınız. Karşılaşacağınız her sırrın bir anlamı vardır. ",
    },
    {
      "imagePath": "assets/images/castle.png",
      "title": "Kale",
      "description": "Cesurca savaşın ve ortaçağ efsanelerini deneyimleyin.",
      "questText":
          "Gizem ve heyecan dolu bir serüvene hazır olun! Kale Karanlığı adlı bu epik oyunda, antik bir kaleden sızan kötülükle dolu hikayeyi keşfedeceksiniz. Kale, yıllarca unutulmuş, sadece efsanelerde bahsedilen bir yapıydı. Ancak bir grup cesur maceraperest, bu eski yapıyı keşfetmeye karar verdi. Ancak kale, sadece tarihi değil, aynı zamanda karanlık sırlarla dolu. Girer girmez, sizi büyüleyen ve aynı zamanda ürperten bir atmosfer karşılayacak. Tünellerin derinliklerine doğru ilerlerken, kayıp hazineleri aramaya başlayacak ve unutulmuş hikayeleri yeniden hayata geçireceksiniz. Aynı zamanda, geçmişin hayaletleri ve tehlikeleri sizi bekliyor olacak. Oyunun başlangıcı, kale kapısından adım atmanızla birlikte sizi büyüsüne kaptıracak. Büyülü ortamlar, gizli odalar ve düşmanlarla dolu bu oyun, sizi soluksuz bırakacak. Savaşın, zeka gerektiren bulmacaları çözün, hikayeyi anlamaya çalışın ve bu eski kaleyı keşfederken geçmişin sırlarını ortaya çıkarın. Kale Karanlığı size kendinizi bir macera kahramanı gibi hissettirecek. Bu oyun, sizi içine çeken ve sizi saatlerce eğlendiren bir deneyim sunacak. Cesur olun, kaleye giriş yapın ve karanlık sırları çözmek için hazır olun!",
    },
  ];

  int _currentIndex = 0;
  CarouselController _carouselController = CarouselController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            icon: const Icon(Icons.settings),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const AccountScreen(),
                ),
              );
            },
          ),
        ],
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        child: Stack(
          children: [
            Image.asset(
              imageList[_currentIndex]["imagePath"]!,
              fit: BoxFit.cover,
            ),
            Positioned(
              child: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.bottomCenter,
                    end: Alignment.topCenter,
                    colors: [
                      Colors.grey.shade50.withOpacity(1),
                      Colors.grey.shade50.withOpacity(1),
                      Colors.grey.shade50.withOpacity(1),
                      Colors.grey.shade50.withOpacity(1),
                      Colors.grey.shade50.withOpacity(0),
                      Colors.grey.shade50.withOpacity(0),
                      Colors.grey.shade50.withOpacity(0),
                      Colors.grey.shade50.withOpacity(0),
                    ],
                  ),
                ),
              ),
            ),
            Positioned(
              bottom: 50,
              height: MediaQuery.of(context).size.height * 0.7,
              width: MediaQuery.of(context).size.width,
              child: CarouselSlider(
                carouselController: _carouselController,
                options: CarouselOptions(
                  height: 500.0,
                  aspectRatio: 16 / 9,
                  viewportFraction: 0.70,
                  enlargeCenterPage: true,
                  onPageChanged: (index, reason) {
                    setState(() {
                      _currentIndex = index;
                    });
                  },
                ),
                items: imageList.map((item) {
                  return Builder(
                    builder: (BuildContext context) {
                      return InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => QuestScreen(
                                imagePath: item["imagePath"]!,
                                title: item["title"]!,
                                description: item["description"]!,
                                imageList: imageList,
                                currentIndex: _currentIndex,
                              ),
                            ),
                          );
                        },
                        child: Container(
                          width: double.infinity,
                          margin: const EdgeInsets.symmetric(horizontal: 10.0),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20),
                            image: DecorationImage(
                              image: AssetImage(item["imagePath"]!),
                              fit: BoxFit.cover,
                            ),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Container(
                                height: 320,
                                margin: const EdgeInsets.only(top: 30),
                                clipBehavior: Clip.hardEdge,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      item["title"]!,
                                      style: const TextStyle(
                                        fontSize: 24,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    const SizedBox(height: 20),
                                    Text(
                                      item["description"]!,
                                      style: const TextStyle(
                                        fontSize: 16,
                                        color: Colors.black,
                                      ),
                                    ),
                                    const SizedBox(height: 20),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  );
                }).toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

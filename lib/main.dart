// ignore_for_file: prefer_const_constructors, sized_box_for_whitespace, non_constant_identifier_names, prefer_const_literals_to_create_immutables, avoid_unnecessary_containers

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Introducing Istanbul',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: Scaffold(
        backgroundColor: Color.fromARGB(255, 251, 251, 251),
        body: Column(
          children: [
            Header(),
            // Expanded sayfaya yayılımı sağladığı için orta kısım için kullanılır.
            Expanded(
              child: Container(
                width: double.infinity,
                child: SingleChildScrollView(
                  child: Column(
                    // Container alanları belirlenir ve kullanım kolaylığı için containerleri extract methoda dönüştürürüz.
                    children: [
                      SearchBox(),
                      Divider(),
                      TopLocations(),
                      Divider(),
                      NearLocations(),
                      Divider(),
                      Suggestions(),
                      Divider(),
                      TopRated()
                    ],
                  ),
                ),
              ),
            ),
            BottomMenu(),
          ],
        ),
      ),
    );
  }

  Container TopRated() => Container(
        // LocationItem içinde belirlerdiği parametreleri burada kullanırız.
        child: Column(
          children: [
            // TitleItem kısmında belirlediğim text düzenini burada da kullanırız.
            TitleItem("Top Roted", "View All"),
            // Yatay şekilde kaydırma işlemi yapar.
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                // LocationItem kısmında oluşturulan parametreleri burada kullanırız.
                children: [
                  LocationItem("assets/images/p6.jpg", "Haliç / Istanbul",
                      "Haliç Köprüsü", "₺ 30.0"),
                  LocationItem("assets/images/p5.jpg", "Beşiktaş / Istanbul",
                      "Dolmabahçe Sarayı", "₺ 35.0"),
                  LocationItem("assets/images/p11.jpg", "Fatih / Istanbul",
                      "Sultan Ahmet Meydanı", "₺ 25.0"),
                  LocationItem("assets/images/p4.jpg", "Istanbul / Üsküdar",
                      "Kız Kulesi", "₺ 15.0"),
                  LocationItem("assets/images/p1.jpg", "Beşiktaş / Istanbul",
                      "Ortaköy Meydanı", "₺ 20.0"),
                  LocationItem("assets/images/p3.jpg", "Fatih / Istanbul",
                      "Ayasofya Camii", "₺ 10.0"),
                ],
              ),
            )
          ],
        ),
      );

  Widget Suggestions() => Container(
        // LocationItem içinde belirlerdiği parametreleri burada kullanırız.
        child: Column(
          children: [
            // TitleItem kısmında belirlediğim text düzenini burada da kullanırız.
            TitleItem("Suggested", "View All"),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                // LocationItem kısmında oluşturulan parametreleri burada kullanırız.
                children: [
                  LocationItem("assets/images/p11.jpg", "Fatih / Istanbul",
                      "Sultan Ahmet Meydanı", "₺ 25.0"),
                  LocationItem("assets/images/p6.jpg", "Haliç / Istanbul",
                      "Haliç Köprüsü", "₺ 30.0"),
                  LocationItem("assets/images/p5.jpg", "Beşiktaş / Istanbul",
                      "Dolmabahçe Sarayı", "₺ 35.0"),
                  LocationItem("assets/images/p4.jpg", "Istanbul / Üsküdar",
                      "Kız Kulesi", "₺ 15.0"),
                  LocationItem("assets/images/p3.jpg", "Fatih / Istanbul",
                      "Ayasofya Camii", "₺ 10.0"),
                  LocationItem("assets/images/p1.jpg", "Beşiktaş / Istanbul",
                      "Ortaköy Meydanı", "₺ 20.0"),
                ],
              ),
            )
          ],
        ),
      );

  Widget NearLocations() => Container(
        // LocationItem içinde belirlerdiği parametreleri burada kullanırız.
        child: Column(
          children: [
            // TitleItem kısmında belirlediğim text düzenini burada da kullanırız.
            TitleItem("Near You", "View All"),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                // LocationItem kısmında oluşturulan parametreleri burada kullanırız.
                children: [
                  LocationItem("assets/images/p3.jpg", "Fatih / Istanbul",
                      "Ayasofya Camii", "₺ 10.0"),
                  LocationItem("assets/images/p1.jpg", "Beşiktaş / Istanbul",
                      "Ortaköy Meydanı", "₺ 20.0"),
                  LocationItem("assets/images/p4.jpg", "Istanbul / Üsküdar",
                      "Kız Kulesi", "₺ 15.0"),
                  LocationItem("assets/images/p11.jpg", "Fatih / Istanbul",
                      "Sultan Ahmet Meydanı", "₺ 25.0"),
                  LocationItem("assets/images/p5.jpg", "Beşiktaş / Istanbul",
                      "Dolmabahçe Sarayı", "₺ 35.0"),
                  LocationItem("assets/images/p6.jpg", "Haliç / Istanbul",
                      "Haliç Köprüsü", "₺ 30.0"),
                ],
              ),
            )
          ],
        ),
      );

  Widget LocationItem(
    // NearLocations kısmı için gerekli düzenlemeler burada yapıldı.

    String photo,
    String title,
    String description,
    String price,
  ) =>
      Container(
        // Kutunun şekli için gerekli düzenlemeler burada yapıldı.
        width: 165,
        padding: EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(
            color: const Color.fromARGB(15, 170, 170, 170),
          ),
          borderRadius: BorderRadius.circular(25),
        ),
        child: Column(
          // ??? burayı ikoya sor !!!
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(14),
              child: Image.asset(
                photo,
                width: 150,
              ),
            ),
            SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              mainAxisSize: MainAxisSize.max,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: TextStyle(
                        fontSize: 12,
                        color: const Color.fromARGB(255, 56, 56, 56),
                      ),
                    ),
                    Row(
                      children: [
                        Icon(
                          Icons.location_on,
                          color: Colors.grey,
                          size: 8,
                        ),
                        SizedBox(width: 2),
                        Text(
                          description,
                          style: TextStyle(
                            fontSize: 8,
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                Container(
                  // Kutunun düzenini yapar ve fiyat kısmının kodlarını düzenler.
                  padding: EdgeInsets.all(4),
                  decoration: BoxDecoration(
                    color: Color.fromRGBO(236, 125, 87, 1),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Text(
                    price,
                    style: TextStyle(
                      fontSize: 8,
                      color: Colors.white,
                    ),
                  ),
                )
              ],
            ),
          ],
        ),
      );

  Widget TopLocations() => Container(
        // StoryItem kısmında düzenlemesi yapılarak burada o fonksiyon kullanıldı.
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TitleItem("Top Locations", "View All"),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  StoryItem("assets/images/p1.jpg", "Ortaköy Camii"),
                  StoryItem("assets/images/p5.jpg", "Dolmabahçe sarayı"),
                  StoryItem("assets/images/p3.jpg", "Ayasofya Camii"),
                  StoryItem("assets/images/p4.jpg", "Kız Kulesi"),
                  StoryItem("assets/images/p8.jpg", "Boğaz Köprüsü"),
                  StoryItem("assets/images/p6.jpg", "Haliç Köprüsü"),
                  StoryItem("assets/images/p7.jpg", "Nakkaştepe"),
                  StoryItem("assets/images/p11.jpg", "Sultan Ahmet"),
                  StoryItem("assets/images/p1.jpg", "Ortaköy Camii"),
                  StoryItem("assets/images/p5.jpg", "Dolmabahçe sarayı"),
                  StoryItem("assets/images/p3.jpg", "Ayasofya Camii"),
                  StoryItem("assets/images/p4.jpg", "Kız Kulesi"),
                  StoryItem("assets/images/p8.jpg", "Boğaz Köprüsü"),
                  StoryItem("assets/images/p6.jpg", "Haliç Köprüsü"),
                  StoryItem("assets/images/p7.jpg", "Nakkaştepe"),
                  StoryItem("assets/images/p11.jpg", "Sultan Ahmet"),
                ],
              ),
            ),
          ],
        ),
      );

  Widget SearchBox() => Container(
        // Arama motoru kısmıdır.
        // Burdaki kodlar arka plandaki kutucuğun decorationunu ayarlar.
        height: 50,
        margin: EdgeInsets.all(12),
        padding: EdgeInsets.symmetric(horizontal: 12),
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(
            color: const Color.fromARGB(15, 170, 170, 170),
          ),
          borderRadius: BorderRadius.circular(25),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // Satırda iconlar ve text kısımlarını ayarlarız.
            Row(
              children: [
                Icon(
                  Icons.location_on,
                  size: 20,
                  color: Colors.grey,
                ),
                SizedBox(width: 7),
                Text(
                  "Where Would You Like To Go ?",
                  style: TextStyle(
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
            // Burası row içine alınmadı.
            Icon(
              Icons.tune,
              size: 20,
              color: Color.fromRGBO(236, 125, 87, 1),
            ),
          ],
        ),
      );

  Widget StoryItem(String photo, String name) {
    // TopLocations kısmının phptolarını ve textlerinin düzenlemesinin yapıldığı kısımdır.
    // Story kısmını temsilm eder.
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: Column(
        children: [
          Container(
            // Yuvarlak olan alanların düzenlenmesi burada
            padding: const EdgeInsets.all(2),
            decoration: BoxDecoration(
              gradient: LinearGradient(colors: [
                Color.fromARGB(255, 241, 156, 101),
                Color.fromARGB(255, 233, 92, 70),
              ]),
              shape: BoxShape.circle,
            ),
            child: Container(
              padding: const EdgeInsets.all(2),
              decoration: BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
              ),
              child: CircleAvatar(
                backgroundImage: AssetImage(photo),
                radius: 30,
              ),
            ),
          ),
          SizedBox(height: 5),
          Text(
            name,
            style: TextStyle(
              color: Color.fromARGB(255, 153, 153, 153),
              fontSize: 10,
            ),
          ),
        ],
      ),
    );
  }

  Widget TitleItem(String title, String link) {
    // Başlık kısımlarıdır
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            // Title başlık kısımlarını temsil eder.
            title,
            style: TextStyle(
              color: Color.fromARGB(255, 56, 56, 56),
              fontSize: 16,
            ),
          ),
          Text(
            // Link 'Vİew All' kısmını temsil eder.
            link,
            style: TextStyle(
              color: Color.fromARGB(255, 153, 153, 153),
              fontSize: 14,
            ),
          ),
        ],
      ),
    );
  }

  Widget Header() {
    // Sayfanın en üst kısmından bahseder.
    return Container(
      width: double.infinity,
      height: 80,
      padding: const EdgeInsets.all(8.0),
      // Bir satıra alır ve kodlarımızı burada yazarız.
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Text yazılarımızı burada yazarız.
              Text(
                "Welcome Eda A.",
                style: TextStyle(
                  color: Color.fromARGB(255, 153, 153, 153),
                  fontSize: 14,
                ),
              ),
              Text(
                "Introducing Istanbul City",
                style: TextStyle(
                  color: Color.fromARGB(255, 56, 56, 56),
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          Row(
            children: [
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                ),
                padding: const EdgeInsets.all(8.0),
                margin: const EdgeInsets.all(6.0),
                // Header kısmının iconlarını burada belirleriz.
                child: Icon(
                  Icons.sunny,
                  size: 18,
                  color: Color.fromRGBO(236, 125, 87, 1),
                ),
              ),
              SizedBox(
                width: 3,
              ),
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                ),
                padding: const EdgeInsets.all(8.0),
                margin: const EdgeInsets.all(6.0),
                child: Icon(
                  Icons.notifications,
                  size: 18,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget BottomMenu() {
    // Sayfanın en altında bulunan navigasyon kısmıdır içerisinde iconlar, textler vs. bulunabilir.
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        border: Border.all(
          color: Color.fromARGB(174, 243, 243, 243),
          width: 1,
        ),
      ),
      height: 70,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        // Iconlarımı parametrelerden alarak burada yazdım.
        children: [
          BottomMenuItem("Home", Icons.home, true),
          BottomMenuItem("Moments", Icons.groups, false),
          HiglightedItem("Book", Icons.maps_ugc),
          BottomMenuItem("Chat", Icons.forum, false),
          BottomMenuItem("Profile", Icons.person, false),
        ],
      ),
    );
  }

  Widget BottomMenuItem(String title, IconData icon, bool active) {
    // Eğer parametre false dönerse iconum bu renk olacak.
    var renk = Color.fromRGBO(174, 174, 178, 1);
    //  Eğer parametre true dönerse iconumun rengi diğerlerinden farklı renk olacak.
    if (active) {
      renk = Color.fromRGBO(43, 43, 43, 1);
    }

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        // Yatay eksende kodların nasıl hizalanması gerektiğini belirler.
        mainAxisAlignment: MainAxisAlignment.center,
        // Ana eksen boyunca widgetlerin mümkün olan en fazla yerin kaplamasını belirler.
        mainAxisSize: MainAxisSize.max,
        children: [
          Icon(icon, size: 25, color: renk),
          SizedBox(
            height: 3,
          ),
          Text(
            title,
            style: TextStyle(fontSize: 10, color: renk),
          ),
        ],
      ),
    );
  }

  Widget HiglightedItem(
    // ortadaki book iconu.
    String title,
    IconData icon,
  ) {
    var renk = Color.fromRGBO(236, 125, 87, 1);

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: [
          Icon(icon, size: 35, color: renk),
          SizedBox(
            height: 3,
          ),
          Text(
            title,
            style: TextStyle(fontSize: 10, color: renk),
          ),
        ],
      ),
    );
  }
}

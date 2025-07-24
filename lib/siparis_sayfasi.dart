import 'package:flutter/material.dart';
import 'package:siparis_uygulamasi/renkler.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class Siparis extends StatefulWidget {
  const Siparis({super.key});

  @override
  State<Siparis> createState() => _SiparisState();
}

class _SiparisState extends State<Siparis> {
  bool onion = false;
  bool pickle = false;
  bool tomato = false;
  bool mayonnaise = false;

  int quantity = 0;
  int friesQty = 0;
  int cheeseQty = 0;
  int mushroomQty = 0;

  double get total {
    return quantity * 4.5 +
        friesQty * 1.42 +
        cheeseQty * 0.66 +
        mushroomQty * 0.95;
  }

  void increment() {
    setState(() {
      quantity++;
    });
  }

  void decrement() {
    setState(() {
      if (quantity > 1) quantity--;
    });
  }

  @override
  Widget build(BuildContext context) {
    var ekranBilgisi = MediaQuery.of(context);
    final double ekranYuksekligi = ekranBilgisi.size.height;
    final double ekranGenisligi = ekranBilgisi.size.width;

    var d = AppLocalizations.of(context);

    return Scaffold(
      backgroundColor: Color(0xFFF1CCA5),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Başlık
            Padding(
              padding:
              const EdgeInsets.symmetric(horizontal: 16.0, vertical: 29.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    d!.hamburgerBaslik,
                    style: TextStyle(
                      fontSize: ekranGenisligi/15,
                      fontWeight: FontWeight.bold,
                      fontFamily: "RobotoSlab",
                      color: yaziRenk1,
                    ),
                  ),
                  Icon(
                    Icons.favorite,
                    color: Colors.red,
                    size: 40,
                  ),
                ],
              ),
            ),

            // Açıklama
            Container(
              height: ekranYuksekligi/22,
              child: Stack(
                children: [
                  Positioned(
                    top: 1,
                    left: 16,
                    child: Text(
                      d.hamburgerIcerik,
                      style: TextStyle(fontSize: 18, color: yaziRenk1,fontFamily: "RobotoSlab"),
                    ),
                  ),
                ],
              ),
            ),



            SizedBox(height: 16),

            // Fiyat solda, görsel sağda
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    d.hamburgerFiyat,
                    style: TextStyle(fontSize: 26, color: yaziRenk1),
                  ),
                  Image.asset(
                    "resimler/burger.png",
                    width: ekranGenisligi / 3,
                    fit: BoxFit.contain,
                  ),
                ],
              ),
            ),

            // Sayı kontrol (görselin altında, sağda)
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 1.0, horizontal: 30),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  IconButton(
                    onPressed: decrement,
                    icon: Icon(Icons.remove),
                  ),
                  Text(
                    '$quantity',
                    style: TextStyle(fontSize: 20),
                  ),
                  IconButton(
                    onPressed: increment,
                    icon: Icon(Icons.add),
                  ),
                ],
              ),
            ),

            SizedBox(height: 16),
            // Checkboxlar
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 0.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Sol sütun
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CheckboxRow(
                          value: onion,
                          label: d.soganYazi,
                          onChanged: (val) {
                            setState(() {
                              onion = val!;
                            });
                          },
                        ),
                        CheckboxRow(
                          value: pickle,
                          label: d.tursuYazi,
                          onChanged: (val) {
                            setState(() {
                              pickle = val!;
                            });
                          },
                        ),
                      ],
                    ),
                  ),
                  // Sağ sütun
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CheckboxRow(
                          value: tomato,
                          label: d.domatesYazi,
                          onChanged: (val) {
                            setState(() {
                              tomato = val!;
                            });
                          },
                        ),
                        CheckboxRow(
                          value: mayonnaise,
                          label: d.mayonezYazi,
                          onChanged: (val) {
                            setState(() {
                              mayonnaise = val!;
                            });
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            SizedBox(height: 16),

            // Menü Kartları
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5.0, vertical: 8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly, // Kartlar arası eşit boşluk
                children: [
                  MenuCard(
                    name: d.patatesKizartmasiYazi,
                    price: d.patatesFiyat,
                    imagePath: 'resimler/patates.png',
                    quantity: friesQty,
                    onIncrement: () {
                      setState(() {
                        friesQty++;
                      });
                    },
                    onDecrement: () {
                      setState(() {
                        if (friesQty > 0) friesQty--;
                      });
                    },
                  ),
                  MenuCard(
                    name: d.peynirYazi,
                    price: d.peynirFiyat,
                    imagePath: 'resimler/peynir.png',
                    quantity: cheeseQty,
                    onIncrement: () {
                      setState(() {
                        cheeseQty++;
                      });
                    },
                    onDecrement: () {
                      setState(() {
                        if (cheeseQty > 0) cheeseQty--;
                      });
                    },
                  ),
                  MenuCard(
                    name: d.mantarYazi,
                    price: d.mantarFiyat,
                    imagePath: 'resimler/mantar.png',
                    quantity: mushroomQty,
                    onIncrement: () {
                      setState(() {
                        mushroomQty++;
                      });
                    },
                    onDecrement: () {
                      setState(() {
                        if (mushroomQty > 0) mushroomQty--;
                      });
                    },
                  ),
                ],
              ),
            ),


            SizedBox(height: 16),
            // Özet
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "${quantity}x Chicken Burger, "
                        "${friesQty}x Fries, "
                        "${cheeseQty}x Cheese, "
                        "${mushroomQty}x Mushroom",
                    style: TextStyle(color: yaziRenk1, fontSize: 20,fontFamily: "RobotoSlab"),
                  ),
                  SizedBox(height: 10),
                  Text(
                    "Total: \$ ${total.toStringAsFixed(2)}",
                    style: TextStyle(color: yaziRenk1, fontSize: 23, fontWeight: FontWeight.bold,fontFamily: "RobotoSlab"),
                  ),
                ],
              ),
            ),

            SizedBox(height: 16),

            // Butonlar
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                CustomButton(
                  text: d.siparisButon,
                  onPressed: () {
                    // sipariş işlemleri
                  },
                ),
                CustomButton(
                  text: d.sepeteEkleButon,
                  onPressed: () {
                    // sepete ekle işlemleri
                  },
                  backgroundColor: Colors.white,
                  textColor: Colors.orange,
                ),
              ],
            ),

            SizedBox(height: 30),
          ],
        ),
      ),
    );
  }
}

// Menü Kartı Bileşeni
class MenuCard extends StatelessWidget {
  final String name;
  final String price;
  final String imagePath;
  final int quantity;
  final VoidCallback onIncrement;
  final VoidCallback onDecrement;

  const MenuCard({
    super.key,
    required this.name,
    required this.price,
    required this.imagePath,
    required this.quantity,
    required this.onIncrement,
    required this.onDecrement,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 100,
          height: 130,
          padding: EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.3),
                blurRadius: 5,
                offset: Offset(0, 3),
              ),
            ],
          ),
          child: Column(
            children: [
              Image.asset(
                imagePath,
                width: 60,
                height: 60,
              ),
              SizedBox(height: 8),
              Text(
                name,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontFamily: "RobotoSlab",
                  fontSize: 15,
                ),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 4),
              Text(
                price,
                style: TextStyle(color: Colors.grey),
              ),
            ],
          ),
        ),
        SizedBox(height: 8),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IconButton(
              onPressed: onDecrement,
              icon: Icon(Icons.remove, color: Colors.black),
            ),
            Text(
              '$quantity',
              style: TextStyle(fontSize: 18),
            ),
            IconButton(
              onPressed: onIncrement,
              icon: Icon(Icons.add, color: Colors.black),
            ),
          ],
        ),
      ],
    );
  }
}


// Buton Bileşeni
class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final Color backgroundColor;
  final Color textColor;

  const CustomButton({
    Key? key,
    required this.text,
    required this.onPressed,
    this.backgroundColor = Colors.orange,
    this.textColor = Colors.white,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: backgroundColor,
        foregroundColor: textColor,
        padding: const EdgeInsets.symmetric(horizontal: 35, vertical: 16),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        textStyle: const TextStyle(
          fontSize: 23,
          fontWeight: FontWeight.bold,
          fontFamily: "RobotoSlab"
        ),
      ),
      child: Text(text),
    );
  }
}
class CheckboxRow extends StatelessWidget {
  final bool value;
  final String label;
  final ValueChanged<bool?> onChanged;

  const CheckboxRow({
    Key? key,
    required this.value,
    required this.label,
    required this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Checkbox(
          value: value,
          onChanged: onChanged,
          activeColor: Color(0xFF592E1E),
        ),
        Text(label,
          style:TextStyle(fontSize: 18,fontFamily: "RobotoSlab") ,
        ),
      ],
    );
  }
}


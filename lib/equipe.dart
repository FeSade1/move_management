import 'package:flutter/material.dart';

class EquipePage extends StatefulWidget {
  const EquipePage({super.key});

  @override
  State<EquipePage> createState() => _EquipePageState();
}

class _EquipePageState extends State<EquipePage> {
  List<Map> colaboradoresList = [
    {
      "name": "Eduardo Medeiros",
      "since": "01/01/2024",
      "last": "1 mes atrás",
      "photo": "https://logging.discloud.app/Expresso/Eduardo.jfif",
      "color": "547cb8"
    }
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: CardBuilder(cardList: colaboradoresList),
        )
      ],
    );
  }
}

class CardBuilder extends StatelessWidget {
  const CardBuilder({
    super.key,
    required this.cardList,
  });

  final List cardList;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      separatorBuilder: (context, index) => const SizedBox(
        height: 10,
      ),
      padding: const EdgeInsets.only(top: 20, left: 15, right: 15, bottom: 120),
      itemCount: cardList.length,
      itemBuilder: (BuildContext context, int index) {
        return Card(data: cardList[index]);
      },
    );
  }
}

class Card extends StatelessWidget {
  final Map data;

  const Card({
    super.key,
    required this.data,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(30)),
        color: Color(
          int.parse('0XFF${data["color"]}'),
        ),
      ),
      padding: const EdgeInsets.all(10),
      //height: 250,
      child: Column(
        children: [
          Row(
            //mainAxisAlignment: MainAxisAlignment.start,
            children: [
              data["photo"] != null
                  ? SizedBox(
                      height: 120,
                      width: 120,
                      child: Image.network(data["photo"], fit: BoxFit.contain),
                    )
                  : Container(
                      color: Colors.white,
                      height: 120,
                      width: 120,
                    ),
              const SizedBox(
                width: 5,
              ),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      data["name"],
                      style: const TextStyle(
                          color: Colors.white,
                          fontSize: 22,
                          fontWeight: FontWeight.bold),
                    ),
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Admissão:",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 14,
                              fontWeight: FontWeight.bold),
                        ),
                        Text(
                          "Ultimo feedback:",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 14,
                              fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          data["since"],
                          style: const TextStyle(
                              color: Colors.white,
                              fontSize: 14,
                              fontWeight: FontWeight.bold),
                        ),
                        Text(
                          data["last"],
                          style: const TextStyle(
                              color: Colors.white,
                              fontSize: 14,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor:
                                  const Color.fromARGB(255, 30, 146, 175),
                            ),
                            onPressed: () {},
                            child: const Text('Atualizar feedback',
                                style: TextStyle(
                                    fontSize: 14,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold)),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              )
            ],
          ),
          if (data["progress"] != null)
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(6),
                      bottomLeft: Radius.circular(6),
                    ),
                    color: Color(0XFF4bab5d),
                  ),
                  height: 20,
                  width: 275 * data["progress"] / 100,
                ),
                Container(
                  decoration: const BoxDecoration(
                    color: Colors.grey,
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(6),
                      bottomRight: Radius.circular(6),
                    ),
                  ),
                  height: 20,
                  width: 275 * (100 - data["progress"]) / 100,
                ),
              ],
            ),
        ],
      ),
    );
  }
}

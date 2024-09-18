import 'package:flutter/material.dart';

class ComercialPage extends StatefulWidget {
  const ComercialPage({super.key});

  @override
  State<ComercialPage> createState() => _ComercialPageState();
}

class _ComercialPageState extends State<ComercialPage> {
  List<Map> cardList = [
    {
      "title": "Brownie recheado",
      "subtitle": "Variação nas vendas",
      "description":
          "As vendas do produto diminuiram em relação ao mês passado.",
      "teste": List.generate(5, (index) => 'Item $index'),
      "fields": <Map>[
        {"name": "Mês atual:", "value": "Setembro"},
        {"name": "Mês referencia:", "value": "Agosto"},
        {"name": "Quantidade:", "value": "7"},
        {"name": "Quantidade:", "value": "21"},
        {"name": "Receita:", "value": "R\$56,00"},
        {"name": "Receita:", "value": "R\$168,00"},
        {"name": "Variação:", "value": "14 UND (R\$112,00)"},
        {"name": "Variação:", "value": "14 UND (R\$112,00)"},
      ],
      "color": "d44242",
      "photo": "https://logging.discloud.app/Expresso/brownies.png"
    },
    {
      "title": "Doces",
      "subtitle": "Variação nas vendas",
      "color": "4bab5d",
      "photo": "https://logging.discloud.app/Expresso/saches.png"
    }
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const TabBar(),
        Expanded(
          child: ListView.separated(
            separatorBuilder: (context, index) => const SizedBox(
              height: 10,
            ),
            padding: const EdgeInsets.only(
                top: 20, left: 15, right: 15, bottom: 120),
            itemCount: cardList.length,
            itemBuilder: (BuildContext context, int index) {
              return Card(data: cardList[index]);
            },
          ),
        )
      ],
    );
  }
}

class TabBar extends StatelessWidget {
  const TabBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
      color: Colors.black.withOpacity(0.15),
      child: Row(
        children: [
          GestureDetector(
            onTap: () {
              print("tapped");
            },
            child: Container(
              alignment: Alignment.center,
              padding: const EdgeInsets.all(10),
              decoration: const BoxDecoration(
                borderRadius: const BorderRadius.all(Radius.circular(12)),
                color: Colors.yellow,
              ),
              height: 45,
              child: const Text(
                "Alertas",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.fromLTRB(5, 1, 5, 1),
            child: Container(
              height: 30,
              width: 1,
              color: Colors.white,
            ),
          ),
          GestureDetector(
            onTap: () {
              print("tapped");
            },
            child: Container(
              alignment: Alignment.center,
              padding: EdgeInsets.all(10),
              decoration: const BoxDecoration(
                borderRadius: const BorderRadius.all(Radius.circular(12)),
                color: Color.fromARGB(255, 150, 135, 1),
              ),
              height: 45,
              child: const Text(
                "Metas",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ],
      ),
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
    List<Widget> buildRows(List<Map> items) {
      List<Widget> rows = [];
      for (int i = 0; i < items.length; i += 2) {
        bool souldbreak = false;
        if ((i + 1 < items.length) &&
            ((items[i]['value'] +
                        items[i]['name'] +
                        items[i + 1]['value'] +
                        items[i + 1]['name'])
                    .toString()
                    .length >
                35)) {
          souldbreak = true;
        }
        //${i + 1 < items.length ? ((items[i]['value'] + items[i]['name'] + items[i + 1]['value'] + items[i + 1]['name']).toString().length > 40 ? '\n' : ' ') : " "}
        rows.add(
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "${items[i]['name']}${souldbreak ? "\n" : " "}${items[i]['value']}",
                style: const TextStyle(
                  fontSize: 16,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
              if (i + 1 <
                  items.length) // Check if there's a second item in the pair
                Text(
                  "${items[i + 1]['name']}${souldbreak ? "\n" : " "}${items[i + 1]['value']}",
                  style: const TextStyle(
                    fontSize: 16,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
            ],
          ),
        );
      }
      return rows;
    }

    return Container(
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(30)),
        color: Color(
          int.parse('0XFF${data["color"]}'),
        ),
      ),
      padding: const EdgeInsets.all(20),
      //height: 250,
      child: Column(
        children: [
          Row(
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
                width: 20,
              ),
              Expanded(
                child: Column(
                  children: [
                    Text(
                      data["title"],
                      style: const TextStyle(
                          color: Colors.white,
                          fontSize: 22,
                          fontWeight: FontWeight.bold),
                    ),
                    data["subtitle"] != null
                        ? Text(data["subtitle"],
                            style: const TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.bold))
                        : const SizedBox(),
                    data["description"] != null
                        ? Text(data["description"],
                            style: const TextStyle(
                                color: Colors.white,
                                fontSize: 14,
                                fontWeight: FontWeight.bold))
                        : const SizedBox(),
                  ],
                ),
              )
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: data["teste"] != null ? buildRows(data["fields"]) : [],
          ),
        ],
      ),
    );
  }
} //teste

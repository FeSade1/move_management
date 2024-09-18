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
      "color": "c0c0c0",
    },
    {
      "title": "Doces",
      "subtitle": "Variação nas vendas",
      "color": "ffc70e",
    }
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 50,
          color: Colors.grey,
          child: const Row(
            children: [Text("Teste"), Text("Teste2")],
          ),
        ),
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
              Container(
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

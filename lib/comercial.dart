import 'package:flutter/material.dart';

class ComercialPage extends StatefulWidget {
  const ComercialPage({super.key});

  @override
  State<ComercialPage> createState() => _ComercialPageState();
}

class _ComercialPageState extends State<ComercialPage> {
  List<Map> alertasList = [
    {
      "title": "Brownie recheado",
      "subtitle": "Variação nas vendas",
      "description":
          "As vendas do produto aumentaram em relação ao mês anterior.",
      "fields": <Map>[
        {"name": "Mês referência:", "value": "Agosto"},
        {"name": "Mês anterior:", "value": "Julho"},
        {"name": "Quantidade:", "value": "176"},
        {"name": "Quantidade:", "value": "123"},
        {"name": "Receita:", "value": "R\$1408,00"},
        {"name": "Receita:", "value": "R\$984,00"},
        {"name": "Variação:", "value": "53 UND (R\$424,00)"},
      ],
      "color": "4bab5d",
      "photo": "https://logging.discloud.app/Expresso/brownies.png"
    },
    {
      "title": "Sachê de maionese",
      "subtitle": "Variação nas vendas",
      "description":
          "As vendas do produto diminuiram em relação ao mês anterior.",
      "fields": <Map>[
        {"name": "Mês referência:", "value": "Agosto"},
        {"name": "Mês anterior:", "value": "Julho"},
        {"name": "Quantidade:", "value": "697"},
        {"name": "Quantidade:", "value": "832"},
        {"name": "Receita:", "value": "R\$697,00"},
        {"name": "Receita:", "value": "R\$832,00"},
        {"name": "Variação:", "value": "135 UND (R\$135,00)"},
      ],
      //"color": "4bab5d", //green
      "color": "d44242", //red
      "photo": "https://logging.discloud.app/Expresso/saches.png"
    }
  ];

  String tab = "Alertas";
  void update(String tabname) {
    setState(() {
      tab = tabname;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TabBar(update: update),
        Expanded(
          child: tab == "Alertas"
              ? AlertasTab(cardList: alertasList)
              : const Placeholder(),
        )
      ],
    );
  }
}

class AlertasTab extends StatelessWidget {
  const AlertasTab({
    super.key,
    required this.cardList,
  });

  final List<Map> cardList;

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

class TabBar extends StatefulWidget {
  final ValueChanged<String> update;
  const TabBar({super.key, required this.update});

  @override
  State<TabBar> createState() => _TabBarState();
}

class _TabBarState extends State<TabBar> {
  List<String> tabNames = <String>[
    "Alertas",
    "Metas",
  ];
  late String selectedTab = tabNames[0];
  List<Widget> buildChildren() {
    List<Widget> children = [];
    for (var i = 0; i < tabNames.length; i++) {
      // TO DO
      var currentElement = tabNames[i];
      Widget tab = GestureDetector(
        onTap: () {
          //print("Alertas tapped");
          widget.update(currentElement);
          setState(() {
            selectedTab = currentElement;
          });
        },
        child: Container(
          alignment: Alignment.center,
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(12)),
            color: selectedTab == currentElement
                ? Colors.yellow
                : const Color.fromARGB(255, 150, 135, 1),
          ),
          height: 45,
          child: Text(
            currentElement,
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
      );
      children.add(tab);
      if (currentElement != tabNames[tabNames.length - 1]) {
        children.add(Container(
          padding: const EdgeInsets.fromLTRB(5, 1, 5, 1),
          child: Container(
            height: 30,
            width: 1,
            color: Colors.white,
          ),
        ));
      }
    }
    return children;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
      color: Colors.black.withOpacity(0.15),
      child: Row(
        children: buildChildren(),
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
              if (i + 1 >= items.length)
                SizedBox(), // Center the text if there isn't a second field
              Text(
                "${items[i]['name']}${souldbreak ? "\n" : " "}${items[i]['value']}",
                style: const TextStyle(
                  fontSize: 16,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
              if (i + 1 >= items.length)
                SizedBox(), // Center the text if there isn't a second field
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
      padding: const EdgeInsets.all(10),
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
                width: 10,
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
            children: data["fields"] != null ? buildRows(data["fields"]) : [],
          ),
        ],
      ),
    );
  }
} //teste

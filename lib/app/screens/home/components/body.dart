import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ocean_tech/app/model/mapping.dart';
import 'package:ocean_tech/app/screens/reports_list_name/reports_list_name_screen.dart';
import 'package:ocean_tech/app/screens/reports_state_year/reports_state_year_screen.dart';
import 'package:ocean_tech/app/service/mapping_service_api.dart';
import 'package:ocean_tech/app/core/core.dart';

class Body extends StatefulWidget {
  const Body({Key? key}) : super(key: key);

  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  Future<List<Mapping>> _future = MappingServiceApi().list();
  List<Mapping> _listaPraias = [];
  late String dropdownValue;
  late TextEditingController _anoController;
  int _year = 2015;
  late Mapping _selectedMapping;

  @override
  void initState() {
    _future.then((value) {
      setState(() {
        _listaPraias.addAll(value);
      });
    });
    dropdownValue = _options[0];
    _anoController = TextEditingController.fromValue(
        TextEditingValue(text: _year.toString()));
    super.initState();
  }

  @override
  dispose() {
    _anoController.dispose();
    super.dispose();
  }

  List<String> _options = [
    "alagoas",
    "bahia",
    "ceara",
    "maranhao",
    "santa-catarina",
    "rio-grande-do-norte",
    "rio-grande-do-sul",
    "parana",
    "sao-paulo",
    "rio-de-janeiro"
  ];

  _removerAcentos(String nome) {
    String comAcentos = "äáâàãéêëèíîïìöóôòõüúûùç";
    String semAcentos = "aaaaaeeeeiiiiooooouuuuc";

    for (int i = 0; i < comAcentos.length; i++) {
      nome = nome.replaceAll(comAcentos[i], semAcentos[i]);
    }
    return nome;
  }

  _updateAno() {
    int ano = int.parse(_anoController.text);
    if (ano >= 2015 && ano <= 2021) {
      setState(() {
        _year = ano;
      });
      FocusScope.of(context).unfocus();
    }
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(DefaultValues.padding),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Pesquisa da situação das praias brasileiras",
            style: AppTextStyles.title,
          ),
          SizedBox(height: DefaultValues.padding),
          Text(
            "Pesquisa de todos os relatórios de uma praia",
            style: AppTextStyles.heading,
          ),
          SizedBox(height: 20),
          Autocomplete<Mapping>(
            displayStringForOption: (Mapping mapping) => mapping.name,
            optionsBuilder: (TextEditingValue textEditingValue) {
              if (textEditingValue.text == '') {
                return const Iterable<Mapping>.empty();
              }
              return _listaPraias.where((Mapping option) {
                return option.name.toLowerCase().contains(
                    _removerAcentos(textEditingValue.text.toLowerCase()));
              });
            },
            onSelected: (Mapping mapping) {
              setState(() {
                _selectedMapping = mapping;
              });
            },
          ),
          OutlinedButton(
            onPressed: () {
              if (_selectedMapping != null) {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return ReportsListNameScreen(mapping: _selectedMapping);
                }));
              }
            },
            style: ButtonStyle(
              backgroundColor:
                  MaterialStateProperty.all<Color>(Colors.transparent),
              side: MaterialStateProperty.all(BorderSide(
                  color: Colors.blue, width: 1, style: BorderStyle.solid)),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: DefaultValues.padding / 2, horizontal: DefaultValues.padding),
              child: Text("Pesquisar"),
            ),
          ),
          SizedBox(height: DefaultValues.padding),
          Text(
            "Pesquisa por relatórios anuais de cada estado",
            style: AppTextStyles.heading,
          ),
          SizedBox(height: DefaultValues.padding),
          Row(
            children: [
              DropdownButton(
                value: dropdownValue,
                items: _options.map((String state) {
                  return new DropdownMenuItem<String>(
                      value: state,
                      child: Text(state.replaceAll("-", " ").toTitleCase()));
                }).toList(),
                onChanged: (String? state) {
                  setState(() {
                    dropdownValue = state!;
                  });
                },
              ),
              Expanded(
                child: Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: DefaultValues.padding / 2),
                  child: TextField(
                    decoration:
                        InputDecoration(labelText: "Digite o ano desejado"),
                    keyboardType: TextInputType.number,
                    inputFormatters: <TextInputFormatter>[
                      FilteringTextInputFormatter.digitsOnly,
                      LengthLimitingTextInputFormatter(4),
                    ],
                    controller: _anoController,
                    onEditingComplete: _updateAno,
                  ),
                ),
              ),
            ],
          ),
          OutlinedButton(
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return ReportStateYear(state: dropdownValue, year: _year);
              }));
            },
            style: ButtonStyle(
              backgroundColor:
              MaterialStateProperty.all<Color>(Colors.transparent),
              side: MaterialStateProperty.all(BorderSide(
                  color: Colors.blue, width: 1, style: BorderStyle.solid)),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: DefaultValues.padding / 2, horizontal: DefaultValues.padding),
              child: Text("Pesquisar"),
            ),
          ),
        ],
      ),
    );
  }
}

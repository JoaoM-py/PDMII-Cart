import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

// classe que inicia o aplicativo
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // define Material Design
    return MaterialApp(
      title: 'Sample Input',
      home: Forms(), // inicia página principal
    );
  }
}

// Classe que instância classe responsável por gerenciar estados
class Forms extends StatefulWidget {
  @override
  FormsState createState() => FormsState();
}

// classe que contém os widgets
class FormsState extends State<Forms> {
  // é necessário um controller para interagir com
  // wigdget de entrada de dados
  final TextEditingController _email = TextEditingController();
  final TextEditingController _senha = TextEditingController();

  bool _IsValid = false;

  Color textColor = Colors.black; // default color
  Color textColorWarning = Colors.grey; // default color
  Color borderColor = Colors.grey;

  String _result = "";
  bool envio = false;


  // cancelar
  void _cancelar() {
    _email.text = "";
    String email = _email.text;
    // define resposta
    setState(() {
      _result = email;
    });

    _senha.text = "";
    String senha = _senha.text;
    // define resposta
    setState(() {
      _result = senha;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // barra do aplicativo
        title: const Text('Shoe Store'),
      ),
      body: Align(
        // corpo do aplicativo
        alignment: Alignment.topCenter,
        child: ListView(
          padding: const EdgeInsets.all(8),
          children: [

             Image.asset('assets/images/logo.jpg'),
            const SizedBox(
                height: 16.0), // um retângulo contendo widget de entrada
            SizedBox(
                // label para primeiro número
                width: 300,
                child: TextField(
                  controller: _email, // associa controle ao widget
                  keyboardType: TextInputType.text, // tipo de entrada
                  decoration: InputDecoration(
                    // customização
                    hintText: 'Entre com email', //hint
                    prefixIcon:
                        const Icon(Icons.account_circle_outlined), //icon
                    enabledBorder: OutlineInputBorder(
                      //borda ao redor da entrada
                      borderSide: BorderSide(color: borderColor), //cor da borda
                    ), //quando receber o foco, altera cor da borda
                    focusedBorder: const OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.blue),
                    ),
                  ),
                onChanged: (_) => setState(() {
                  _IsValid = _email.text.isNotEmpty && _senha.text.isNotEmpty; 
                }),
                  

                )),
            const SizedBox(height: 16.0),

            SizedBox(
                // label para primeiro número
                width: 300,
                child: TextField(
                  controller: _senha, // associa controle ao widget
                  keyboardType: TextInputType.text, // tipo de entrada
                  decoration: InputDecoration(
                    // customização
                    hintText: 'Entre com número', //hint
                    prefixIcon:
                        const Icon(Icons.account_circle_outlined), //icon
                    enabledBorder: OutlineInputBorder(
                      //borda ao redor da entrada
                      borderSide: BorderSide(color: borderColor), //cor da borda
                    ), //quando receber o foco, altera cor da borda
                    focusedBorder: const OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.blue),
                    ),
                  ),

                onChanged: (_) => setState(() {
                  _IsValid = _email.text.isNotEmpty && _senha.text.isNotEmpty; 
                }),
                )),
            const SizedBox(height: 16.0),
            // if ternário que controla exibição da resposta.
            // senão foi enviado, então apresenta botões
            // enviar e cancelar
            !envio
                ? SizedBox(
                    // botões
                    width: 300,
                    // Row determina que os widgets serão acrescentados
                    // lado a lado
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [

                        ElevatedButton(
                          onPressed:_IsValid ?() {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => SecondPage()),
                            );
                          }

                          : null,


                          child: const Text('Enviar'),
                        ),

                        ElevatedButton(
                          onPressed: _cancelar, // executa _cancelar
                          child: const Text('Cancelar'),
                        ),
                      ],
                    ))
                : const SizedBox.shrink(), // espaço vazio
            const SizedBox(height: 16.0),
          ],
        ),
      ),
    );
  }
}


class SecondPage extends StatefulWidget {
  @override
  SecondPageState createState() => SecondPageState();
}

class SecondPageState extends State<SecondPage> {
    //define conteúdo de listView
  final List<String> items = ['Chuteira Society Fifty III Umbro - Preto+Salmão', 
  'Chuteira Society Nike Beco 2 TF - Preto+Branco', 
  'Chuteira Futsal Adidas Artilheira VI - Preto+Pink'];
  // controller para input nome
  final TextEditingController _nome = TextEditingController();
  // define cores para mensagens de aviso
  Color textColor = Colors.black; // default color
  Color textColorWarning = Colors.grey; // default color
  Color borderColor = Colors.grey;
  // informações de envio
  String _result = "";
  String _selectItem = "";
  bool envio = false;

  // obtém item selecionado e armazena
  void changeSelectedItem(String e) {
    setState(() {
      _selectItem = e;
      _result = _selectItem;
    });
  }

  // botão de envio
  void _enviar() {
    //obtém informações do usuário
    String nome = _nome.text;
    String selecionado = _selectItem;

    // altera state textColor
    void changeTextColor(Color newColor) {
      setState(() {
        textColor = newColor;
      });
    }

    // altera cor da borda
    void changeBorderColor(Color newColor) {
      setState(() {
        borderColor = newColor;
      });
    }

    void changeEnvio(bool e) {
      setState(() {
        envio = e;
      });
    }

    // define resposta
    setState(() {
      if (nome == "" || selecionado == "") {
        changeTextColor(Colors.red);
        if (nome == "") {
          _result = "Precisa informar a quantidade";
        }
        else
        if (selecionado == "") {
          _result = "Escolha pelo menos um item";
        }
        //altera cor da borda para indicar
        changeBorderColor(Colors.red);
      } else {
        changeEnvio(true);
        changeTextColor(Colors.red);
        changeBorderColor(Colors.grey);

        _result = nome;
        _selectItem = selecionado;
         _result = '$selecionado  Quantidade: $nome';
      }

      Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => ConfirmPage(result:_result)),
      );
    });
  }

  // cancela
  void _cancelar() {
    _nome.text = "";
    String nome = _nome.text;
    String sel = _selectItem;

    // define resposta
    setState(() {
      _result = '$sel $nome';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Produtos'),
      ),
      body: Align(
        alignment: Alignment.center,
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            const Divider(),//linha divisória
            const SizedBox(height: 16.0),
            const Text(
              'Produtos',
              style: TextStyle(fontSize: 24.0, color: Colors.blue),
            ),
            const Divider(),// linha divisória
            //Expanded( if view all items listview
            Container(
              width: 600,
              height: 200,
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.grey,
                  width: 1.0,
                ),
              ),
              child: ListView.builder(
                shrinkWrap: true, // if scroll
                itemCount: items.length,
                itemBuilder: (BuildContext context, int index) {
                  return ListTile(
                    //leading: Image(image: items[index]),
                    title: Text(items[index]),
                    //subtitle: Text(items[index]),
                    onTap: () {
                      // Handle tap on the item
                      print(' Porduto: ${items[index]}');
                      changeSelectedItem('Porduto: ${items[index]}');
                    },
                  );
                },
              ),
            ),
            const SizedBox(height: 16.0),
            const Text(
              'Quantidade',
              style: TextStyle(fontSize: 24.0, color: Colors.blue),
            ),
            const SizedBox(height: 16.0),
            SizedBox(
                // label para primeiro número
                width: 300,
                child: TextField(
                  controller: _nome,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    hintText: 'Quantidade',
                    prefixIcon: const Icon(Icons.account_circle_outlined),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: borderColor),
                    ),
                    focusedBorder: const OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.blue),
                    ),
                  ),
                )),
            const SizedBox(height: 16.0),
            const Divider(),
            !envio
                ? SizedBox(
                    // label para primeiro número
                    width: 300,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        ElevatedButton(
                          onPressed: _enviar,
                          child: const Text('Enviar'),
                        ),

                        ElevatedButton(
                          onPressed: _cancelar,
                          child: const Text('Cancelar'),
                        ),
                      ],
                    ))
                : const SizedBox.shrink(),
            const SizedBox(height: 16.0),
            Text(
              _result,
              style: TextStyle(fontSize: 24.0, color: textColor),
            ),

          ],
        ),
      ),
    );
  }
}

class ConfirmPage extends StatelessWidget{
  final String result;

  const ConfirmPage({Key? key, required this.result})
      : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Confirmação do pedido'),
      ),
      body: Align(
        alignment: Alignment.center,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // display parametres received
            Text(result,
                style: const TextStyle(fontSize: 24.0, color: Colors.red)),

            ElevatedButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => FinalPage()));
              },
              child: const Text('Enviar'),
            ),
          ],
        ),
      ),
    );
  }
}




class FinalPage extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('voltar'),
      ),
      body: Align(
        alignment: Alignment.center,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset('assets/images/logo.jpg'),
            const SizedBox(height: 16.0),
            Text("Pedido confirmado!",style: const TextStyle(fontSize: 24.0, color: Colors.green)),
            Text("Obrigado e volte sempre!",style: const TextStyle(fontSize: 24.0, color: Colors.green)),




          ],
        ),
      ),
    );
  }
}


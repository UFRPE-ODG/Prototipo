import 'package:estudos_flutter/App/Destinos/Configuracao.dart';
import 'package:estudos_flutter/App/Destinos/editProjeto.dart';
import 'package:flutter/material.dart';
import 'WidgetLoginState.dart';
import 'Projeto.dart';
import 'package:estudos_flutter/App/ClassesAParte/Projetos.dart';
import 'addProjeto.dart';
import 'package:estudos_flutter/App/ClassesAParte/CustomDialog.dart';
 
List<Projetos> meusProjetos = new List<Projetos>();
List<String> nomeProj = new List<String>();
List<String> descrProj = new List<String>();
var items = List<String>();

class SearchPage extends StatefulWidget {
  SearchPage({Key key, this.title}) : super(key: key);
  final String title;
  @override
  _SearchPageState createState() => new _SearchPageState();
}
  
class _SearchPageState extends State<SearchPage> {
  TextEditingController editingController = TextEditingController(); 
  TextStyle style = TextStyle(fontFamily: "Glacial Indifference", fontSize: 20.0);
   bool isSearching = false;
  //final duplicateItems = List<String>.generate(10000, (i) => "Item $i");


  
  @override
  void initState() {


    super.initState();
  }

  void filterSearchResults(String query) {
    List<String> dummySearchList = List<String>();
    dummySearchList.addAll(nomeProj);
    if(query.isNotEmpty) {
      List<String> dummyListData = List<String>();
      dummySearchList.forEach((item) {
        if(item.contains(query)) {
          dummyListData.add(item);
        }
      });
      setState(() {
        items.clear();
        items.addAll(dummyListData);
      });
      return;
    } else {
      setState(() {
        items.clear();
        items.addAll(nomeProj);
      });
    }

  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(

      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add,size: 40,), 
        backgroundColor: Colors.amber ,

        onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (context) => AddProjeto()));
        },
      ),

      appBar: new AppBar(
        backgroundColor: Color(0xFF3050ff),
        title: !isSearching 
          ? Text("Pesquisa",
              style: style.copyWith(
                fontSize: 25.0, 
              ),
            )
          : TextField(
            onChanged: (value) {
              filterSearchResults(value);
            },
            controller: editingController,

            style: style.copyWith(
              color: Colors.white,
            ),
            
            decoration: InputDecoration(
              hintText: "Search",
              hintStyle: style.copyWith(
                fontSize: 18.0,
                color: Colors.white
              ),
              icon: Icon(Icons.search, color: Colors.white),
              fillColor: Colors.white,
              focusColor: Colors.white,
              hoverColor: Colors.white,

              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.white,
                ),
              )

            ),
          ),
        
        actions: <Widget>[
          
          isSearching
            ? IconButton(
              icon: Icon(Icons.close),

              onPressed: () {
                setState((){
                  this.isSearching = false;
                });
              },
            )
            : IconButton(
              icon: Icon(Icons.search),

              onPressed: () {
                setState((){
                  this.isSearching = true;
                });
              },
            )

        ],
      ),
      body: ListView.builder(
        itemCount: items.length,
        itemBuilder: (context, index) {

          return Container(
            margin: EdgeInsets.only(top: 20,),
            //height: 50.0,

            child: ListTile(          
                leading: Icon(Icons.assignment, size: 50, color: Colors.blue,),
                
                title: Text('${items[index]}',   
                  style: style.copyWith(
                    fontSize: 20.0,
                    color: Colors.blue,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                
                subtitle: Text("${descrProj[index]}"),
                dense: true,
                
                trailing: SizedBox(
                  width: 40.0,
                  height: 40.0,   
                  child: Center(
                    child: RaisedButton( 
                      color: Colors.white,
                      child: Icon(Icons.edit, color: Colors.blue,),
                      elevation: 0.0,
                      
                      onPressed: () {
                        var pass = new Projetos();

                        for(int i = 0; i<meusProjetos.length;i++){
                          if(meusProjetos[i].nome.contains(items[index])){
                            pass = meusProjetos[i];
                          }
                        }

                        Navigator.push(context, 
                          MaterialPageRoute(
                            builder: (context) => editProjeto(pass)
                          )
                        );

                      },
                    ),
                  ),
                ),

                onTap: () {
                  var pass = new Projetos();

                  for(int i = 0; i<meusProjetos.length;i++){
                    if(meusProjetos[i].nome.contains(items[index])){
                      pass = meusProjetos[i];
                    }
                  }

                  Navigator.push(context, 
                    MaterialPageRoute(
                      builder: (context) => DetailProject(pass)
                    )
                  );
                            
                },
            ),
          );  
        },
      ),              
    );
  }
}

 _dialogAddRecDesp(context) {
    showDialog(
        context: context,
        builder: (context) {
          return CustomDialog();
        });
  }
lista(){

  Projetos notas1 = new Projetos();
  Projetos notas2 = new Projetos();
  Projetos notas3 = new Projetos();
  Projetos notas4 = new Projetos();

  notas1.nome = "Desenvolvimento de gráficos";
  notas2.nome = "Análise de Produtividade de 2018";
  notas3.nome = "Análise de Produtividade de 2019";
  notas4.nome = "Recolhimento de dados de 2020";

  notas1.descricao = "Projeto sobre o Desenvolvimento de graficos";
  notas2.descricao = "Detalhes da análise de produtividade de todo o ano de 2018";
  notas3.descricao = "Detalhes da análise de produtividade de todo o ano de 2019";
  notas4.descricao =  "Detalhes do recolhimento dos dados do ano de 2020";

  notas1.pessoasParticipando = 3;
  notas2.pessoasParticipando = 5;
  notas3.pessoasParticipando = 7;
  notas4.pessoasParticipando = 3;

  notas1.porcentagemFeita = 40;
  notas2.porcentagemFeita = 70;
  notas3.porcentagemFeita = 70;
  notas4.porcentagemFeita = 40;

  meusProjetos.add(notas1);
  meusProjetos.add(notas2);
  meusProjetos.add(notas3);
  meusProjetos.add(notas4);



  Projetos notas6 = new Projetos();
  Projetos notas7 = new Projetos();
  Projetos notas8 = new Projetos();
  Projetos notas9 = new Projetos();

  notas6.nome = "Desenvolvimento de Funcionabilidades";
  notas7.nome = "Análise de Produtividade de 2017";
  notas8.nome = "Análise de Produtividade de 2020";
  notas9.nome = "Recolhimento de dados de 2018";

  notas6.descricao = "Projeto sobre o Desenvolvimento de funcionalidades";
  notas7.descricao = "Detalhes da análise de produtividade de todo o ano de 2017";
  notas8.descricao = "Detalhes da análise de produtividade de todo o ano de 2020";
  notas9.descricao = "Detalhes do recolhimento dos dados do ano de 2018";

  notas6.pessoasParticipando = 8;
  notas7.pessoasParticipando = 8;
  notas8.pessoasParticipando = 7;
  notas9.pessoasParticipando = 3;

  notas6.porcentagemFeita = 40;
  notas7.porcentagemFeita = 60;
  notas8.porcentagemFeita = 60;
  notas9.porcentagemFeita = 40;
    
  meusProjetos.add(notas6);
  meusProjetos.add(notas7);
  meusProjetos.add(notas8);
  meusProjetos.add(notas9);

  for (int i = 0; i<meusProjetos.length; i++){
    nomeProj.add(meusProjetos[i].nome);
    descrProj.add(meusProjetos[i].descricao);
  }
    
  items.addAll(nomeProj);
}

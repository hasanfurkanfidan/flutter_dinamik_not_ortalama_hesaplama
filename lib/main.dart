import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(new MaterialApp(
      title: "Not Hesaplama Uygulaması",
      theme: ThemeData.light(),
      home: MyHomePage()));
}

class MyHomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _MyHomePageState();
  }
}

class _MyHomePageState extends State<MyHomePage> {

  String _dersAdi;
  double _ortalama =0;
  int dersKredi = 1;
  double dersHarfDegeri = 4;
  List<Ders>tumDersler ;
  var formKey = GlobalKey<FormState>();
  @override
  void initState() {
    // TODO: implement initState
    tumDersler = [];
  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      appBar: AppBar(
        title: Text("Ortalama Hesaplama Programı"),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
           if(formKey.currentState.validate()){
             formKey.currentState.save();
           }

        },
        child: Icon(Icons.add),
      ),
      body: uygulamaGovdesi(),
    );
  }

  Widget uygulamaGovdesi() {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Container(
            padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
            child: Form(

              key: formKey,
              child: Column(
                children: <Widget>[
                  TextFormField(
                    validator: (girilenDeger){
                      if(girilenDeger.length==0){
                        return "Ders adı alanı gereklidir.";
                      }
                      else{
                        return null;
                      }
                    },
                    onSaved: (girilenDeger){
                      _dersAdi = girilenDeger;
                      setState(() {
                        tumDersler.add(Ders(_dersAdi, dersHarfDegeri, dersKredi));

                        setState(() {
                          _ortalama = 0;
                          ortalamaYiHesapla();
                        });

                      });

                    },
                    decoration: InputDecoration(
                      labelText: "DersAdı",
                      hintText: "Ders Adını giriniz",
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.purple,
                          width: 2
                        ),

                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.purple,
                          width: 2

                        ),
                      )


                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Container(
                        child: DropdownButtonHideUnderline(
                          child: DropdownButton<int>(

                            items: dersKredileriItems(),
                            value: dersKredi,
                            onChanged: (secilenKredi){
                              setState(() {
                                dersKredi = secilenKredi;
                              });

                            },
                          ),
                        ),
                        padding: EdgeInsets.symmetric(horizontal: 15,vertical: 4),
                        margin:EdgeInsets.only(top: 10) ,
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.purple)
                        ),
                      ),
                      Container(
                        child: DropdownButtonHideUnderline(

                          child: DropdownButton<double>(
                            items: dersHarfDegerleriItems(),
                            value: dersHarfDegeri,
                            onChanged: (secilenHarfDegeri){
                              setState(() {
                                dersHarfDegeri = secilenHarfDegeri;
                              });

                            },
                          ),
                        ),
                        padding: EdgeInsets.symmetric(horizontal: 15,vertical: 4),
                        margin: EdgeInsets.only(top: 10),
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.purple)
                        ),
                      ),
                    ],
                  ),
                
                ],

              ),
            ),
          ),
         Container(
           margin: EdgeInsets.only(top: 10),
           child: Center(child: RichText(
             textAlign: TextAlign.center,
             text: TextSpan(
               children: [
                 TextSpan(
                   text: "Ortalama:  ",
                   style: TextStyle(fontSize: 30)
                 ),
                 TextSpan(text: "$_ortalama",style: (TextStyle(fontSize: 30)))
               ]
             ),
           )),
           color: Colors.blue,
           height: 50.0,
         ),
          Expanded(
            child: Container(
             child: ListView.builder(itemBuilder: _listeElemanlariniOlustur,itemCount: tumDersler.length,),
              
            ),
          )
        ],
      ),
    );
  }
  List<DropdownMenuItem<int>> dersKredileriItems() {
    List<DropdownMenuItem<int>> krediler = [];
    for (int i = 1; i <= 10; i++) {
      var aa = DropdownMenuItem<int>(
          value: i,
          child: Text(
            "$i kredi",
            style: TextStyle(fontSize: 30),
          ));
      krediler.add(aa);
    }

    return krediler;
  }

  List<DropdownMenuItem<double>> dersHarfDegerleriItems() {
    List<DropdownMenuItem<double>> harfler = [];
    harfler.add(DropdownMenuItem(
      child: Text(
        "AA",
        style: TextStyle(fontSize: 30),
      ),
      value: 4,
    ));
    harfler.add(DropdownMenuItem(
      child: Text(
        "BA",
        style: TextStyle(fontSize: 30),
      ),
      value: 3.5,
    ));
    harfler.add(DropdownMenuItem(
      child: Text(
        "BB",
        style: TextStyle(fontSize: 30),
      ),
      value: 3,
    ));
    harfler.add(DropdownMenuItem(
      child: Text(
        "CB",
        style: TextStyle(fontSize: 30),
      ),
      value: 2.5,
    ));
    harfler.add(DropdownMenuItem(
      child: Text(
        "CC",
        style: TextStyle(fontSize: 30),
      ),
      value: 2,
    ));
    harfler.add(DropdownMenuItem(
      child: Text(
        "DC",
        style: TextStyle(fontSize: 30),
      ),
      value: 1.5,
    ));
    harfler.add(DropdownMenuItem(
      child: Text(
        "DD",
        style: TextStyle(fontSize: 30),
      ),
      value: 1,
    ));
    harfler.add(DropdownMenuItem(
      child: Text(
        "FD",
        style: TextStyle(fontSize: 30),
      ),
      value: 0.5,
    ));
    harfler.add(DropdownMenuItem(
      child: Text(
        "DD",
        style: TextStyle(fontSize: 30),
      ),
      value: 0,
    ));

    return harfler;
  }

  Widget _listeElemanlariniOlustur(BuildContext context, int index) {
    return Dismissible(
      key: Key(index.toString()),
      direction: DismissDirection.startToEnd,
      onDismissed: (direction){
        setState(() {
          tumDersler.removeAt(index);

          if(tumDersler.isEmpty){
            _ortalama = 0;
          }
          else{
            ortalamaYiHesapla();
          }
        });
      },
      child: Card(
        child: ListTile(
          title: Text(tumDersler[index]._ad),
          subtitle: Text(tumDersler[index]._kredi.toString() + "kredi Ders Not Değer:"+tumDersler[index]._harfDegeri.toString()),
        ),
      ),
    );
  }

  void ortalamaYiHesapla() {
    double toplamNot = 0;
     double toplamKredi = 0;
    for(var oankiDers in tumDersler ){
      var kredi = oankiDers._kredi;
      var harfDegeri = oankiDers._harfDegeri;
      toplamNot = toplamNot + harfDegeri;
      toplamKredi +=kredi;
    }
    _ortalama = toplamNot/toplamKredi;
  }
}
class Ders{
  String _ad;
  double _harfDegeri;
  int _kredi;
  Ders(this._ad,this._harfDegeri,this._kredi);
}
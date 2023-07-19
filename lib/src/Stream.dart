import 'dart:async';
class Order{
  String type;
  Order(this.type);
}
class Cake{

}


void main() {
  final controller= StreamController();
  final order=Order('banana');
  final baker=StreamTransformer.fromHandlers(
      handleData:(cakeType,sink){
        if(cakeType=='chocolate'){
          sink.add(Cake());
        }else{
          sink.addError('cant bake this cake');
        }
      }
  );
  controller.sink.add(order);
  controller.stream.map((order)=>order.type).transform(baker)
      .listen(
          (cake)=>print('here your cake $cake'),
      onError:(err)=>print(err)
  );

}


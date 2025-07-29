Future<void> firstFun() async {
  print('first');
  await Future.delayed(Duration(seconds: 4));
  print('first done');
}

Future<String?> secFun() async {
  try {
    print('second');
    print('calling firstFun from secFun...');
    await firstFun();
    String data = 'data';
    return data;
  } catch (_) {
    print('caught error');
    return null;
  }
}

Future<void> thirdFun(data) async{
  try{
    print('third $data');
    String? secResult= await secFun();
    print('secResult: $secResult');
    print('third done');
  }catch(_){
    print('caught error');
  }
}

Stream<String> stream() async* {
  for(int i=0; i<20;i++) {
    yield '$i';
    await Future.delayed(Duration(seconds: 1));
  }
}

void listener(){
  stream().listen((message) => print('receive $message'));
}


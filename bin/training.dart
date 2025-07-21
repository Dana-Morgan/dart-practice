import 'package:args/args.dart';
import './null-safety.dart';
import './immutable-string.dart';

const String version = '0.0.1';

ArgParser buildParser() {
  return ArgParser()
    ..addFlag(
      'help',
      abbr: 'h',
      negatable: false,
      help: 'Print this usage information.',
    )
    ..addFlag(
      'verbose',
      abbr: 'v',
      negatable: false,
      help: 'Show additional command output.',
    )
    ..addFlag('version', negatable: false, help: 'Print the tool version.');
}

void printUsage(ArgParser argParser) {
  print('Usage: dart training.dart <flags> [arguments]');
  print(argParser.usage);
}

void main(List<String> arguments) {
  try{
  testFunction();
  testStrings();

  var x = 1; // dart automatically know that the type is int
  // x = "dana"; // it wont accept this value because there is a type safety


  } on FormatException catch (e) {
    // Print usage information if an invalid argument was provided.
    print(e.message);
    print('');
  }
}

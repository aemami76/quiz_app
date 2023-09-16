class Questions {
  String text;
  List<String> answers;

  Questions(this.text, this.answers);
}

List<Questions> questions = [
  Questions("1. Some teachers ____________ much homework.",
      ['give', 'gives', 'are give', 'is give']),
  Questions("2. Taylor and Adam __________ good friends.",
      ['are', 'be', 'is', 'does']),
  Questions("3. _______ your parents let you go to bed late?",
      ['do', 'are', 'do', 'is']),
  Questions("4. How many books __________ you read in a year?",
      ['do', 'are', 'were', 'did']),
  Questions("5. He is good at football but he _____ want to play now.",
      ['dosn\'t', 'isn\'t', "wasn't", 'don\'t']),
  Questions("6. He is talking for hours but I _______ understand anything.",
      ['don\'t', 'wasn\'nt', "isn't", 'am not']),
];

List<Questions> qOrigin = questions;

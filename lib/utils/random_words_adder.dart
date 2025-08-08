import 'dart:math';

String randomWordsAdder(String? description) {
  const minLength = 500;
  final random = Random();

  const fillerTexts = [
    "In the ever-evolving digital landscape, each day brings new stories worth exploring and sharing. What may seem like a small shift today can spark major changes tomorrow, shaping how we work, connect, and live. The pace of change reminds us to stay curious and adaptable. Knowledge fuels growth, and staying curious opens doors to countless opportunities. Every insight we gain becomes a stepping stone toward better understanding ourselves and the world. The more we explore, the richer our perspective becomes.",

    "From groundbreaking research to everyday innovations, the world is full of fascinating developments. Each new discovery has the potential to touch lives, inspire creativity, and spark movements. Progress is often a collection of small but meaningful steps. Each piece of news contributes to a broader understanding of how our society evolves. Even seemingly minor stories can connect to larger trends that shape the future. Paying attention allows us to anticipate and prepare for change.",

    "Information, when shared, becomes the seed of progress and positive change. A single idea can ripple outward, influencing decisions and inspiring new possibilities. We never know whose life a piece of knowledge might transform. History shows us that even the most unexpected events can lead to great transformations. The stories we follow today may become the turning points remembered by generations to come. Staying informed is a form of empowerment.",

    "Innovation thrives in environments where curiosity and courage meet. Every breakthrough starts as a spark of imagination, fueled by persistence and a willingness to take risks. The world rewards those who dare to try. Communication has always been at the heart of human progress. Whether through spoken word, printed pages, or digital platforms, our ability to share ideas shapes the path of civilizations. The more open the exchange, the richer the culture.",

    "Challenges, while uncomfortable, are the breeding ground for growth and resilience. In every obstacle lies a lesson, and in every setback, an opportunity for reinvention. Progress is rarely a straight line—it’s a journey of adaptation. Curiosity is the silent engine that drives both science and art. It leads us to question the familiar, explore the unknown, and connect the dots others overlook. In a world full of noise, curiosity helps us find meaning.",
  ];

  if (description == null || description.length < minLength) {
    final extraText =
        " This section of description is added statically because the description given by the API is too short. "
        "${fillerTexts[random.nextInt(fillerTexts.length)]}";

    return (description ?? "") + extraText;
  }

  return description;
}

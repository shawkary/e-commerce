class BoardingModel
{
  final String title;
  final String onBoarding;

  BoardingModel({
    required this.title,
    required this.onBoarding,
  });
}

List<BoardingModel> lst = [
  BoardingModel(
    title: 'Choose Your Product',
    onBoarding: 'Lorem Ipsum is simply dummy text of the printing and typesetting industry.',
  ),
  BoardingModel(
    title: 'Add to Your Cart',
    onBoarding: 'Lorem Ipsum is simply dummy text of the printing and typesetting industry.',
  ),
  BoardingModel(
    title: 'Pay by Cart',
    onBoarding: 'Lorem Ipsum is simply dummy text of the printing and typesetting industry.',
  ),
];
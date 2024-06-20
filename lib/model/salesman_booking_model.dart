class SalesmanBookingModel {
  final String referenceNumber;
  final String campaignName;
  final String bookingTime;
  final String salesMan;
  const SalesmanBookingModel(
      {required this.referenceNumber,
      required this.campaignName,
      required this.bookingTime,
      required this.salesMan});
}

const List<SalesmanBookingModel> salemansBookingList = [
  SalesmanBookingModel(
      referenceNumber: 'MEP_18745632',
      campaignName: 'Make New Mobile Application',
      bookingTime: '20-05-2024 08:48 pm',
      salesMan: 'Prof. Sigurd Wiegand'),
  SalesmanBookingModel(
      referenceNumber: 'MEP_1861223',
      campaignName: 'Job Application',
      bookingTime: '22-05-2024 12:38 pm',
      salesMan: 'Melyssa Wilkinson'),
  SalesmanBookingModel(
      referenceNumber: 'MEP_18745647',
      campaignName: 'Job Application',
      bookingTime: '15-05-2024 06:28 pm',
      salesMan: "Rosemarie O'Reilly"),
  SalesmanBookingModel(
      referenceNumber: 'MEP_18745689',
      campaignName: 'Job Application',
      bookingTime: '20-05-2024 08:48 pm',
      salesMan: 'Garett Schmeler'),
  SalesmanBookingModel(
      referenceNumber: 'MEP_18745645',
      campaignName: 'Make New Mobile Application',
      bookingTime: '20-05-2024 08:48 pm',
      salesMan: 'Rhett Hermann II')
];

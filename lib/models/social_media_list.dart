class SocialMediaModel {
  final String socialMediaIcon;
  final String socialMediaLink;
  const SocialMediaModel({
    required this.socialMediaIcon,
    required this.socialMediaLink,
  });
}

final socialMediaList = [
  const SocialMediaModel(
      socialMediaIcon: 'assets/images/phone.png',
      socialMediaLink: 'tel://+918893917626'),
  const SocialMediaModel(
      socialMediaIcon: 'assets/images/mail.png',
      socialMediaLink: 'mailto:mail2aamizallu@gmail.com'),
  const SocialMediaModel(
      socialMediaIcon: 'assets/images/whatsapp.png',
      socialMediaLink:
          'https://wa.me/+918893917626/?text=Hi, I am contacting from your portfolio.'),
  const SocialMediaModel(
      socialMediaIcon: 'assets/images/in.png',
      socialMediaLink: 'https://www.linkedin.com/in/aamina-n-r-492497152/'),
  const SocialMediaModel(
      socialMediaIcon: 'assets/images/git.png',
      socialMediaLink: 'https://github.com/aaminaameen'),
];

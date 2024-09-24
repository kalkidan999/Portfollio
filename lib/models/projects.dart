class ProjectsData {
  final String projectName;
  final String projectTitle;
  final String projectImage;
  final String platform;
  final String projectDescription;
  final String technologies;
  final String androidLink;
  final String iosLink;
  final String webLink;

  ProjectsData(
      {required this.projectName,
      required this.projectTitle,
      required this.projectImage,
      required this.platform,
      required this.projectDescription,
      required this.technologies,
      required this.androidLink,
      required this.iosLink,
      required this.webLink});

  static List<ProjectsData> projectsData = <ProjectsData>[
    ProjectsData(
        projectTitle: "HellOOMarket",
        projectName: "E-commerce",
        platform: "Mobile,iOS",
        projectDescription:
            "E-commerce app for a seamless, convenient, and secure shopping experience, enabling businesses to reach a wider audience and manage sales efficiently.",
        technologies: "Flutter, Firebase, Dart",
        androidLink:
            "https://play.google.com/store/apps/details?id=com.belcash.helloopay_corporate&hl=en&gl=US",
        iosLink:
            "https://apps.apple.com/us/app/helloopay-corporate/id6444025766",
        webLink: "",
        projectImage: 'assets/images/helloomarket.jpeg'),
    ProjectsData(
        projectTitle: "HellOOpay",
        projectName: "E-Wallet",
        platform: "Mobile,iOS",
        projectDescription:
            "An e-wallet app for users to store, manage, and use their money electronically and enableing secure transactions.",
        technologies: "Flutter, Firebase, Dart",
        androidLink:
            "https://play.google.com/store/apps/details?id=com.belcash.helloodube&hl=en&gl=US",
        iosLink:
            "https://apps.apple.com/us/app/helloodube-merchant/id6476572691",
        webLink: "",
        projectImage: 'assets/images/helloopay.jpeg'),
    ProjectsData(
        projectTitle: "CIYA!",
        projectName: "Ride-hailing",
        platform: "Mobile, iOS",
        projectDescription:
            "Ride-hailing app for users to get quick & easy booking, connect with drivers with real-time tracking and payment methods integrated. ",
        technologies: "Flutter, Firebase, Dart",
        androidLink: "https://bit.ly/3tw3xuH",
        iosLink: "https://apple.co/3tv6ag0",
        webLink: "",
        projectImage: 'assets/images/ciya_project.jpeg')
  ];
}

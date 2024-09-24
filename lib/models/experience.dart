class ExperienceData {
  final String companyName;
  final String companyLogo;
  final String positiontitle;
  final String employmentDate;
  final List<String> jobDescription;

  ExperienceData(
      {required this.companyName,
      required this.companyLogo,
      required this.positiontitle,
      required this.employmentDate,
      required this.jobDescription});

  static List<ExperienceData> myExperiences = <ExperienceData>[
    ExperienceData(
      companyName: "Belcash Technology Solutions",
      companyLogo: "assets/images/belcash.png",
      positiontitle: "Mobile Application Developer",
      employmentDate: "Oct 2021 - Present",
      jobDescription: [
        'Developed and maintained mobile and web applications using modern technologies like Flutter, Dart, Firebase, Flutter web, NextJs, React, NodeJS',
        'Implemented RESTful APIs to facilitate data exchange between the front-end and back-end systems.',
        'Worked on optimizing application performance, reducing load times, and enhancing the user experience.',
        'Implemented secure authentication and authorization features, including biometric authentication and OAuth.'
      ],
    ),
    ExperienceData(
      companyName: "Ciya Sarl",
      companyLogo: "assets/images/ciya.png",
      positiontitle: "Software Engineer",
      employmentDate: "Oct 2022 - Aug 2023",
      jobDescription: [
        'Developed and maintained mobile applications using modern mobile development technologies like Flutter, Dart, Firebase.',
        'Collaborated with cross-functional teams, including product managers and designers, to define project requirements and deliver high-quality software products.',
        'Debugged and resolved software defects and issues, improving product stability and reliability.'
      ],
    )
  ];
}

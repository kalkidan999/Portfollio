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
      employmentDate: "October 2021 - Present",
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
      employmentDate: "October 2022 - August 2023",
      jobDescription: [
        'Developed and maintained mobile applications using modern mobile development technologies like Flutter, Dart, Firebase.',
        'Collaborated with cross-functional teams, including product managers and designers, to define project requirements and deliver high-quality software products.',
        'Debugged and resolved software defects and issues, improving product stability and reliability.'
      ],
    )
  ];
}

class EducationData {
  final String universityName;
  final String location;
  final String title;
  final String durationDate;
  final String educationDescription;

  EducationData(
      {required this.universityName,
      required this.title,
      required this.location,
      required this.durationDate,
      required this.educationDescription});

  static List<EducationData> education = <EducationData>[
    EducationData(
      universityName: "BahirDar University",
      title: "Bachelor of Science in Computer Engineering",
      durationDate: "September 2015 - July 2019",
      location: "Ethiopia, BahirDar",
      educationDescription:
          "I gained a solid understanding of both hardware and software systems. My coursework and hands-on projects provided me with a deep knowledge of algorithms, data structures, network security, and mobile app development. During my studies, I worked on several projects that allowed me to apply my skills in real-world scenarios. I also developed strong problem-solving and teamwork skills that have been essential in my professional growth.",
    ),
    EducationData(
        universityName: "Holberton University",
        title: "Software Engineering",
        durationDate: "January 2021 - January 2022",
        location: "Online",
        educationDescription:
            "I gained a solid understanding on key software engineering principles such as object-oriented programming, system design, version control with Git, and software testing. The program also covered best practices in agile development, software architecture, and writing clean, maintainable code."),
    EducationData(
        universityName: "Google Developer Group ",
        title: "Mobile Application Development",
        durationDate: "October 2021 - March 2022",
        location: "Online",
        educationDescription:
            "I gained a solid understanding on building cross-platform mobile applications using Flutter. It covered key concepts such as state management, API integration, and building responsive UIs. The course also emphasized best practices for app deployment and performance optimization."),
  ];
}
